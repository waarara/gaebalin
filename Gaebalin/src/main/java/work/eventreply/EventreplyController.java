package work.eventreply;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import work.eventmark.EventmarkService;
import work.reserve.ReserveService;

@Controller
public class EventreplyController {
	@Resource(name = "eventreplyService")
	private EventreplyService eventreplyService;

	@Resource(name = "eventmarkService")
	private EventmarkService eventmarkService;

	@Resource(name = "reserveService")
	private ReserveService reserveService;

	@RequestMapping(value="/work/eventreply/createEventReply.do", method=RequestMethod.POST)
	public ModelAndView createEventReply
	(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();

		Map<String, String> eventreplyParam = new HashMap<String, String>();
		Map<String, String> eventmarkParam = new HashMap<String, String>();
		Map<String, String> reserveParam = new HashMap<String, String>();

		String userCode = (String)session.getAttribute("userCode");
		String eventNo = request.getParameter("eventNo");
		String userReply = request.getParameter("userReply");
		String markYn = request.getParameter("markYn");
		String markRating = request.getParameter("markRating");
		String reserveNo = request.getParameter("reserveNo");

		eventreplyParam.put("userCode", userCode);
		eventreplyParam.put("eventNo", eventNo);
		eventreplyParam.put("userReply", userReply);
		
		reserveParam.put("reserveNo", reserveNo);
		
		if("N".equals(markYn)){
			eventmarkParam.put("eventNo", eventNo);
			eventmarkParam.put("userCode", userCode);
			eventmarkParam.put("markRating", markRating);

			eventmarkService.createEventMark(eventmarkParam);
		}

		//댓글 생성
		eventreplyService.createEventReply(eventreplyParam);

		//예약 번호에 댓글이 생성되었음을 알려줌.
		reserveService.updateReserveReviewYn(reserveParam);
		
		mv.setViewName("redirect:/work/event/retrieveEvent.do?eventNo=" + eventNo);

		return mv;
	}

	@RequestMapping(value="/work/eventreply/deleteEventReply.do", method=RequestMethod.GET)
	public ModelAndView deleteEventReply(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();

		Map<String, String> eventreplyParam = new HashMap<String, String>();

		String userCode = (String)session.getAttribute("userCode");
		String eventNo = request.getParameter("eventNo");
		String userReplyNo = request.getParameter("userReplyNo");

		eventreplyParam.put("userCode", userCode);
		eventreplyParam.put("productCode", eventNo);
		eventreplyParam.put("userReplyNo", userReplyNo);

		//댓글 삭제
		eventreplyService.deleteEventReply(eventreplyParam);

		mv.setViewName("redirect:/work/event/retrieveEvent.do?eventNo=" + eventNo);

		return mv;
	}

}
