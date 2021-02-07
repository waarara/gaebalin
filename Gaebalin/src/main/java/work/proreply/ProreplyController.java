package work.proreply;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import work.promark.PromarkService;
import work.sell.SellService;

@Controller
public class ProreplyController {
	@Resource(name = "proreplyService")
	private ProreplyService proreplyService;

	@Resource(name = "sellService")
	private SellService sellService;

	@Resource(name = "promarkService")
	private PromarkService promarkService;

	@RequestMapping(value="/work/proreply/createProductReply.do", method=RequestMethod.POST)
	public ModelAndView createProductReply
	(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();

		Map<String, String> proreplyParam = new HashMap<String, String>();
		Map<String, String> promarkParam = new HashMap<String, String>();
		Map<String, String> sellParam = new HashMap<String, String>();

		String userCode = (String)session.getAttribute("userCode");
		String productCode = request.getParameter("productCode");
		String userReply = request.getParameter("userReply");
		String markYn = request.getParameter("markYn");
		String markRating = request.getParameter("markRating");
		String sellCode = request.getParameter("sellCode");

		proreplyParam.put("userCode", userCode);
		proreplyParam.put("productCode", productCode);
		proreplyParam.put("userReply", userReply);
		
		sellParam.put("sellCode", sellCode);

		if("N".equals(markYn)){
			promarkParam.put("productCode", productCode);
			promarkParam.put("userCode", userCode);
			promarkParam.put("markRating", markRating);

			promarkService.createProductMark(promarkParam);
		}

		//댓글 생성
		proreplyService.createProductReply(proreplyParam);
		
		//판매 코드에 댓글이 생성됬다는 것을 알려줌.
		sellService.updateProductReviewYn(sellParam);

		mv.setViewName("redirect:/work/product/retrieveProduct.do?productCode=" + productCode);

		return mv;
	}

	@RequestMapping(value="/work/proreply/deleteProductReply.do", method=RequestMethod.GET)
	public ModelAndView deleteProductReply(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();

		Map<String, String> proreplyParam = new HashMap<String, String>();

		String userCode = (String)session.getAttribute("userCode");
		String productCode = request.getParameter("productCode");
		String userReplyNo = request.getParameter("userReplyNo");

		proreplyParam.put("userCode", userCode);
		proreplyParam.put("productCode", productCode);
		proreplyParam.put("userReplyNo", userReplyNo);

		//댓글 삭제
		proreplyService.deleteProductReply(proreplyParam);

		mv.setViewName("redirect:/work/product/retrieveProduct.do?productCode=" + productCode);

		return mv;
	}

}
