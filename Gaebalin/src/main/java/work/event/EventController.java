package work.event;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import work.eventreply.EventreplyService;
import work.reserve.ReserveService;
import work.code.CodeBean;
import work.code.CodeService;

@Controller
public class EventController {
	
	@Resource(name = "eventService")
	private EventService eventService;

	@Resource(name = "reserveService")
	private ReserveService reserveService;
	
	@Resource(name = "eventreplyService")
	private EventreplyService eventreplyService;
	
	@Resource(name = "codeService")
	private CodeService codeService;
	
	@RequestMapping(value="/work/event/retrieveEventList.do", method=RequestMethod.GET)
	public ModelAndView retrieveEventList(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		String category = request.getParameter("eventCategoryCd");

		Map<String, String> eventParam = new HashMap<String, String>();

		eventParam.put("category", category);

		List<Map<String, String>> dsEventList = eventService.retrieveEventList(eventParam);

		mv.addObject("dsEventList", dsEventList);
		mv.setViewName("/event/eventListR");
		return mv;
	}
	
	@RequestMapping(value="/work/event/retrieveEventListForManage.do", method=RequestMethod.GET)
	public ModelAndView retrieveEventListForManage(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		List<Map<String, String>> dsEventList = eventService.retrieveEventListForM();

		mv.addObject("dsEventList", dsEventList);
		mv.setViewName("/stockmanage/stockEventListR");
		return mv;
	}
	
	@RequestMapping(value="/work/event/createEvent.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView createEvent(@ModelAttribute EventBean event, HttpServletRequest request){
		List<CodeBean> dsCode1 = null; //행사 종류 분류
		List<CodeBean> dsCode2 = null; //행사 시간 분류
		
		ModelAndView mv = new ModelAndView();
		Map<String, String> eventParam = new HashMap<String, String>();
		Map<String, String> codeParam = new HashMap<String, String>();
		Map<String, String> codeParam2 = new HashMap<String, String>();

		codeParam.put("commTyCd", "CODE0102");
		dsCode1 = codeService.retrieveCodeList(codeParam); //행사 종류 분류

		mv.addObject("dsCode1", dsCode1);

		codeParam2.put("commTyCd", "CODE0103");
		dsCode2 = codeService.retrieveCodeList(codeParam2); //행사 시간 분류
		mv.addObject("dsCode2", dsCode2);
		
		String flag = event.getEventTitle(); //EventBean 존재여부

		if(flag == null){
			mv.setViewName("/stockmanage/stockEventRegisterC");
		}else if(flag != null){
			//제품 생성
			String eventYn = event.getEventYn();

			eventService.createEvent(event);

			mv.addObject("dsEventList", eventService.retrieveEventList(eventParam));
			if(eventYn.equals("Y")) {
				mv.setViewName("redirect:/work/event/retrieveEventListForManage.do");
			}else {
				mv.setViewName("/event/eventListR");
			}
		}

		return mv;
	}
	
	@RequestMapping(value="/work/event/updateEvent.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView updateEvent(@ModelAttribute EventBean event, HttpServletRequest request){
		String eventNo = null;
		Map<String, String> dsEvent = null;
		List<Map<String, String>> dsEventList = null;
		
		List<CodeBean> dsCode1 = null; //행사 종류 분류
		List<CodeBean> dsCode2 = null; //행사 시간 분류

		ModelAndView mv = new ModelAndView();
		Map<String, String> codeParam = new HashMap<String, String>();
		Map<String, String> codeParam2 = new HashMap<String, String>();
		
		Map<String, String> eventParam = new HashMap<String, String>();

		codeParam.put("commTyCd", "CODE0102");
		dsCode1 = codeService.retrieveCodeList(codeParam); //분류

		mv.addObject("dsCode1", dsCode1);

		codeParam2.put("commTyCd", "CODE0103");
		dsCode2 = codeService.retrieveCodeList(codeParam2); //행사 시간 분류
		mv.addObject("dsCode2", dsCode2);
		
		String flag = event.getEventTitle(); //ProductBean 존재여부

		if(flag == null){
			HttpSession session = request.getSession();
			String userCode = (String)session.getAttribute("userCode");
			eventNo = request.getParameter("eventNo");

			eventParam.put("eventNo", eventNo);
			eventParam.put("userCode", userCode);

			dsEvent = eventService.retrieveEvent(eventParam);

			mv.addObject("dsEvent", dsEvent);

			mv.setViewName("/stockmanage/stockEventRegisterU");
		}else if(flag != null){
			//행사 수정
			eventService.updateEvent(event);
			
			dsEventList = eventService.retrieveEventList(eventParam);
			
			mv.addObject("dsEventList", dsEventList);
			mv.setViewName("redirect:/work/event/retrieveEventListForManage.do");
		}

		return mv;
	}
	
	@RequestMapping(value="/work/event/retrieveEvent.do", method=RequestMethod.GET)
	public ModelAndView retrieveEvent(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();

		String userCode = (String)session.getAttribute("userCode");
		String eventNo = request.getParameter("eventNo");

		Map<String, String> eventParam = new HashMap<String, String>();
		Map<String, String> eventreplyParam = new HashMap<String, String>();

		eventParam.put("eventNo", eventNo);

		eventreplyParam.put("eventNo", eventNo);

		Map<String, String> dsEvent = eventService.retrieveEvent(eventParam);

		List<Map<String, String>> dsReplyList = eventreplyService.retrieveEventReplyList(eventreplyParam);

		try {
			Map<String, String> reserveParam = new HashMap<String, String>();
			reserveParam.put("eventNo", eventNo);
			reserveParam.put("userCode", userCode);
			
			Map<String, String> dsReserve = reserveService.retrieveReserveReply(reserveParam);
			mv.addObject("dsReserve", dsReserve);
			System.out.println("success!");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("error!");			
		}
		
		
		mv.addObject("dsEvent", dsEvent);
		mv.addObject("dsReplyList", dsReplyList);

		mv.setViewName("/event/eventR");
		return mv;
	}
	
	// 행사 승인 여부
	@RequestMapping(value="/work/event/updateEventYn.do", method=RequestMethod.GET)
	public ModelAndView updateEventYn(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		Map<String, String> eventParam = new HashMap<String, String>();

		String eventNo = request.getParameter("eventNo");

		eventParam.put("eventNo", eventNo);

		eventService.updateEventYn(eventParam);

		mv.setViewName("redirect:/work/event/retrieveEventListForManage.do");
		return mv;
	}
}
