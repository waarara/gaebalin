package work.introduce;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IntroduceController {
	@RequestMapping(value="/work/introduce/main.do", method=RequestMethod.GET)
	public ModelAndView introduceMain(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		mv.setViewName("/introduce/main");
		return mv;
	}
}
