package work.reserve;

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

import work.code.CodeBean;
import work.event.EventService;
import work.user.UserService;
import work.code.CodeService;

@Controller
public class ReserveController {
	@Resource(name = "eventService")
	private EventService eventService;

	@Resource(name = "codeService")
	private CodeService codeService;
	
	@Resource(name = "userService")
	private UserService userService;

	@Resource(name = "reserveService")
	private ReserveService reserveService;

	@RequestMapping(value="/work/reserve/createReserve.do", method=RequestMethod.GET)
	public ModelAndView createReserve(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();

		String eventNo = request.getParameter("eventNo");
		String reservePrice = request.getParameter("reservePrice");
		String reservePop = request.getParameter("reservePop");

		String userCode = (String)session.getAttribute("userCode");

		Map<String, String> reserveParam = new HashMap<String, String>();

		reserveParam.put("eventNo", eventNo);
		reserveParam.put("userCode", userCode);
		reserveParam.put("reservePrice", reservePrice);
		reserveParam.put("reservePop", reservePop);

		//판매테이블에 저장
		reserveService.createReserve(reserveParam);

		mv.setViewName("redirect:/work/reserve/retrieveReserveList.do");

		return mv;
	}

	@RequestMapping(value="/work/reserve/updateFinalBuy.do", method=RequestMethod.GET)
	public ModelAndView updateFinalBuy(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		Map<String, String> eventParam = new HashMap<String, String>();
		Map<String, String> reserveParam = new HashMap<String, String>();

		String eventNo = request.getParameter("eventNo");
		String reserveNo = request.getParameter("reserveNo");
		String reservePop = request.getParameter("reservePop");

		reserveParam.put("reserveNo", reserveNo);

		eventParam.put("eventNo", eventNo);
		eventParam.put("eventCurPop", reservePop);

		eventService.updateEventPopPlus(eventParam);
		
		// 예약 결제 여부
		reserveService.updateReserveSellYn(reserveParam);

		mv.setViewName("redirect:/work/reserve/retrieveReserveConfirm.do?eventNo=" + eventNo);

		return mv;
	}

	@RequestMapping(value="/work/reserve/retrieveReserveConfirm.do", method=RequestMethod.GET)
	public ModelAndView retrieveReserveConfirm(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		String eventNo = request.getParameter("eventNo");

		mv.addObject("eventNo", eventNo);

		mv.setViewName("/reserve/reserveConfirmR");

		return mv;
	}

	@RequestMapping(value="/work/reserve/retrieveReserveListForManage.do", method=RequestMethod.GET)
	public ModelAndView retrieveEventListForManage(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		Map<String, String> reserveParam = new HashMap<String, String>();

		List<Map<String, String>> dsReserveList = reserveService.retrieveReserveListForM(reserveParam);

		mv.addObject("dsReserveList", dsReserveList);
		mv.setViewName("/stockmanage/stockReserveListR");
		return mv;
	}
	
	@RequestMapping(value="/work/reserve/updateReserve.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView updateEvent(@ModelAttribute ReserveBean reserve, HttpServletRequest request){
		String reserveNo = null;
		Map<String, String> dsReserve = null;
		List<Map<String, String>> dsReserveList = null;
		
		List<CodeBean> dsCode2 = null; //행사 시간 분류
		
		ModelAndView mv = new ModelAndView();
		
		Map<String, String> reserveParam = new HashMap<String, String>();
		Map<String, String> codeParam2 = new HashMap<String, String>();
		
		
		String flag = reserve.getEventNo(); //ProductBean 존재여부
		
//		System.out.println(flag);

		HttpSession session = request.getSession();
		String userCode = (String)session.getAttribute("userCode");
		reserveParam.put("userCode", userCode);
		
		if(flag == null){
			codeParam2.put("commTyCd", "CODE0103");
			dsCode2 = codeService.retrieveCodeList(codeParam2); //행사 시간 분류
			mv.addObject("dsCode2", dsCode2);

			reserveNo = request.getParameter("reserveNo");

			reserveParam.put("reserveNo", reserveNo);
			dsReserve = reserveService.retrieveReserve(reserveParam);

			mv.addObject("dsReserve", dsReserve);

			mv.setViewName("/reserve/reserveU");
		}else if(flag != null){
			//예약 수정
			/*
			reserveNo = reserve.getReserveNo();
			int reservePop = reserve.getReservePop();
			int reservePrice = reserve.getReservePrice();
			
			System.out.println(reserveNo);
			System.out.println(reservePop);
			System.out.println(reservePrice);
			*/
			
			reserveService.updateReserve(reserve);
						
			dsReserveList = reserveService.retrieveReserveList(reserveParam);
			
			mv.addObject("dsReserveList", dsReserveList);
			mv.setViewName("redirect:/work/reserve/retrieveReserveList.do");
		}

		return mv;
	}
	
	@RequestMapping(value="/work/reserve/updateFinalReserve.do", method=RequestMethod.GET)
	public ModelAndView updateFinalReserve(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		Map<String, String> reserveParam = new HashMap<String, String>();

		String reserveNo = request.getParameter("reserveNo");

		reserveParam.put("reserveNo", reserveNo);
		
		// 예약 승인 여부
		reserveService.updateReserveYn(reserveParam);

		mv.setViewName("redirect:/work/reserve/retrieveReserveListForManage.do");
		return mv;
	}
	
	@RequestMapping(value="/work/reserve/retrieveReserveList.do", method=RequestMethod.GET)
	public ModelAndView retrieveReserveList(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();

		String userCode = (String)session.getAttribute("userCode");

		Map<String, String> reserveParam = new HashMap<String, String>();

		reserveParam.put("userCode", userCode);

		List<Map<String, String>> dsReserveList = reserveService.retrieveReserveList(reserveParam);

		mv.addObject("dsReserveList", dsReserveList);

		mv.setViewName("/reserve/reserveListR");

		return mv;
	}
	
	@RequestMapping(value="/work/reserve/deleteReserve.do", method=RequestMethod.GET)
	public ModelAndView deleteReserve(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		Map<String, String> reserveParam = new HashMap<String, String>();
		Map<String, String> eventParam = new HashMap<String, String>();

		String reserveNo = request.getParameter("reserveNo");
		String eventNo = request.getParameter("eventNo");
		String reservePop = request.getParameter("reservePop");

		reserveParam.put("reserveNo", reserveNo);

		reserveService.deleteReserve(reserveParam);

		eventParam.put("eventNo", eventNo);
		eventParam.put("eventCurPop", reservePop);

		eventService.updateEventPopMinus(eventParam);

		mv.setViewName("redirect:/work/reserve/retrieveReserveList.do");

		return mv;
	}

	@RequestMapping(value="/work/reserve/deletePreReserve.do", method=RequestMethod.GET)
	public ModelAndView deletePreReserve(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		Map<String, String> reserveParam = new HashMap<String, String>();

		String reserveNo = request.getParameter("reserveNo");

		reserveParam.put("reserveNo", reserveNo);

		reserveService.deleteReserve(reserveParam);

		mv.setViewName("redirect:/work/reserve/retrieveReserveList.do");

		return mv;
	}
}
