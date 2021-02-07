package work.qna;

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
import work.code.CodeService;

@Controller
public class QnaController {

	@Resource(name = "qnaService")
	private QnaService qnaService;
	
	@Resource(name = "codeService")
	private CodeService codeService;
	
	@RequestMapping(value="/work/qna/retrieveQnaList.do", method=RequestMethod.GET)
	public ModelAndView retrieveQnaList(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();

		String userCode = (String)session.getAttribute("userCode");

		Map<String, String> qnaParam = new HashMap<String, String>();
		
		qnaParam.put("userCode", userCode);

		List<Map<String, String>> dsQnaList = qnaService.retrieveQnaList(qnaParam);
		
		mv.addObject("dsQnaList", dsQnaList);

		mv.setViewName("/qna/qnaListR");

		return mv;
	}
	
	@RequestMapping(value="/work/qna/retrieveQnaListForManage.do", method=RequestMethod.GET)
	public ModelAndView retrieveQnaListForManage(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		Map<String, String> qnaParam = new HashMap<String, String>();

		List<Map<String, String>> dsQnaList = qnaService.retrieveQnaListForM(qnaParam);

		mv.addObject("dsQnaList", dsQnaList);
		mv.setViewName("/stockmanage/stockQnaListR");
		return mv;
	}
	
	@RequestMapping(value="/work/qna/createQna.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView createBoard(@ModelAttribute QnaBean qna, HttpServletRequest request){
		List<CodeBean> dsCode1 = null; //상품분류
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();

		String userCode = (String)session.getAttribute("userCode");

		Map<String, String> codeParam = new HashMap<String, String>();
		codeParam.put("commTyCd", "CODE0104");
		dsCode1 = codeService.retrieveCodeList(codeParam); //상품분류

		mv.addObject("dsCode1", dsCode1);
		
		String flag = qna.getQnaTitle(); //BoardBean 존재여부

		if(flag == null){
			mv.setViewName("/qna/qnaC");
		}else if(flag != null){
			//게시글 생성
			qna.setUserCode(userCode);
			qnaService.createQna(qna);

			mv.setViewName("redirect:/work/qna/retrieveQnaList.do");
		}

		return mv;
	}
	
	@RequestMapping(value="/work/qna/createResponse.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView createResponse(@ModelAttribute QnaBean qna, HttpServletRequest request){
		String qnaNo = null;
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();

		Map<String, String> dsQna = null;
		
		String userCode = (String)session.getAttribute("userCode");
		String grade = (String)session.getAttribute("grade");
		
		Map<String, String> qnaParam = new HashMap<String, String>();
		
		String flag = qna.getQnaTitle(); //BoardBean 존재여부

		if(flag == null){
			qnaNo = request.getParameter("qnaNo");
			
			qnaParam.put("qnaNo", qnaNo);
			qnaParam.put("userCode", userCode);
			
			dsQna = qnaService.retrieveQna(qnaParam);
			
			mv.addObject("dsQna", dsQna);
			
			mv.setViewName("/qna/responseC");
		}else if(flag != null){
			//게시글 생성
			qna.setUserCode(userCode);
			qnaService.createResponse(qna);
			if(grade.equals("M")) {
				mv.setViewName("redirect:/work/qna/retrieveQnaListForManage.do");
			} else {
				mv.setViewName("redirect:/work/qna/retrieveQnaList.do");
			}
		}

		return mv;
	}
	
	@RequestMapping(value="/work/qna/deleteQna.do", method=RequestMethod.GET)
	public ModelAndView deleteReply(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		Map<String, String> qnaParam = new HashMap<String, String>();

		String groupNo = request.getParameter("groupNo");
		qnaParam.put("groupNo", groupNo);
		
		//댓글 삭제
		qnaService.deleteQna(qnaParam);

		mv.setViewName("redirect:/work/qna/retrieveQnaList.do");

		return mv;
	}
}