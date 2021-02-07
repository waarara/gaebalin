package work.user;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
import com.github.scribejava.core.model.OAuth2AccessToken;

import work.code.CodeBean;
import work.code.CodeService;

@Controller
public class UserController implements HttpSessionListener{
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	private KakaoLoginBO kakaoLoginBO = new KakaoLoginBO();

	
    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }
    
	@Resource(name = "userService")
	private UserService userService;

	@Resource(name = "codeService")
	private CodeService codeService;

	@RequestMapping(value="/work/user/idCheck.do", method=RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<String> idCheck(HttpServletRequest request){
		String id = request.getParameter("id");
		UserBean bean = userService.retrieveUser(id);
		String checkMsg = "<font color='green' size='3px;'><i class='fa fa-check'>&nbsp;사용 가능한 아이디입니다.</i></font>@true";

		if(bean != null){
			checkMsg = "<font color='red' size='3px;'><i class='fa fa-times'>&nbsp;이미 사용중인 아이디입니다.</i></font>@false";
		}

		HttpHeaders resHeader = new HttpHeaders();
		resHeader.add("Content-Type","text/html;charset=UTF-8");
		ResponseEntity resultMsg = new ResponseEntity<String>(checkMsg, resHeader, HttpStatus.OK);
		return resultMsg;
	}

	@RequestMapping(value="/work/user/ajaxLoginCheck.do",method=RequestMethod.GET)
	@ResponseBody
	public Map<String, String> ajaxLogincheck(HttpServletRequest request
											, @RequestParam(value="id", required=false) String id
											, @RequestParam(value="pw", required=false) String pw){
		Map<String, String> loginYnMap = new HashMap<String, String>();

		boolean check = false;
		check = userService.logincheck(id, pw);

		if(check){
			loginYnMap.put("loginYn", "success");
		}else{
			loginYnMap.put("loginYn", "fail");
		}

		return loginYnMap;
	}

	@RequestMapping(value="/work/user/login.do", method=RequestMethod.POST)
	public String login(@ModelAttribute UserBean bean, HttpServletRequest request){
		HttpSession session = request.getSession();

		UserBean userBean = userService.retrieveSessionInfo(bean.getId());

		String userCode = userBean.getUserCode();
		String id = userBean.getId();
		String grade = userBean.getGrade();

		session.setAttribute("userCode", userCode);
		session.setAttribute("grade", grade);
		session.setAttribute("id", id);

		session.setMaxInactiveInterval(-1); //세션 무한대
		
		// 이전 페이지 정보를 저장했다가 다시 로그인 완료 후 이전 페이지로 이동
		String referer = (String) session.getAttribute("referUrl");
		System.out.println(referer);
		return "redirect:" + referer;
	}

	@RequestMapping(value="/work/user/retrieveUserId.do", method=RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<Map<String, String>> retrieveUserId(HttpServletRequest request){
		String checkMsg = "";
		String email = request.getParameter("email");
		String id = userService.retrieveUserId(email);

		Map<String, String> idMap = new HashMap<String, String>();

		if(id == null){
			checkMsg = "<div class='col-md-5 col-md-offset-2'>"
					+ "<p>해당하는 ID가 존재하지 않습니다</p>"
					+ "</div>";
		}else{
			checkMsg = "<div class='col-md-5 col-md-offset-2'>"
					+ "<p>회원님의 ID는 <font color='red'><strong>" + id + "</strong></font>입니다."
					+ " <a href='login.jsp'>로그인 페이지로 이동</a>|<a href='pwFind.jsp'>PW찾기</a></p>"
					+ "</div>";
		}

		idMap.put("checkMsg", checkMsg);

		HttpHeaders resHeader = new HttpHeaders();
		resHeader.add("Content-Type","text/html;charset=UTF-8");
		ResponseEntity resultMsg = new ResponseEntity<Map<String, String>>(idMap, resHeader, HttpStatus.OK);
		return resultMsg;
	}

	@RequestMapping(value="/work/user/retrieveUserPw.do", method=RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<Map<String, String>> retrieveUserPw(HttpServletRequest request){
		String checkMsg = "";
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String pw = userService.retrieveUserPw(id, email);

		Map<String, String> idMap = new HashMap<String, String>();

		if(pw == null){
			checkMsg = "<div class='col-md-5 col-md-offset-2'>"
					+ "<p>해당하는 ID가 존재하지 않습니다</p>"
					+ "</div>";
		}else{
			checkMsg = "<div class='col-md-4 col-md-offset-2'>"
					+ "<p>회원님의 PW는 <font color='blue'><strong>" + pw + "</strong></font>입니다."
					+ " <a href='login.jsp'>로그인 페이지로 이동</a></p>"
					+ "</div>";
		}
		idMap.put("checkMsg", checkMsg);

		HttpHeaders resHeader = new HttpHeaders();
		resHeader.add("Content-Type","text/html;charset=UTF-8");
		ResponseEntity resultMsg = new ResponseEntity<Map<String, String>>(idMap, resHeader, HttpStatus.OK);
		return resultMsg;
	}

	@RequestMapping(value="/work/user/logout.do")
	public String logout(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.removeAttribute("id");
		session.removeAttribute("userCode");
		session.invalidate();
		return "redirect:/work/product/goMain.do";

	}

	@RequestMapping(value="/work/user/createUser.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView createUser(@ModelAttribute UserBean bean){
		ModelAndView mv = new ModelAndView();
        String id = bean.getId(); //없으면 GET(create안함), 있으면 POST(create)
		Map<String, String> codeParam = new HashMap<String, String>();

		if(id == null){
			codeParam.put("commTyCd", "CODE0100");
			List<CodeBean> dsCode1 = codeService.retrieveCodeList(codeParam);
			mv.addObject("dsCode1", dsCode1);
			mv.setViewName("/user/userC");
		}else{
			userService.createUser(bean);
			mv.setViewName("/user/login");
		}
		return mv;
	}
	
	@RequestMapping(value="/work/user/retrieveUserListForM.do", method=RequestMethod.GET)
	public ModelAndView retrieveUserListForM(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		
		List<Map<String, String>> dsUserList = userService.retrieveUserListForM();

		mv.addObject("dsUserList", dsUserList);
		
		mv.setViewName("/user/userListR");
		return mv;
	}

	@RequestMapping(value="/work/user/updateUser.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView updateUser(HttpServletRequest request, @ModelAttribute UserBean bean){
		HttpSession session = request.getSession();

		ModelAndView mv = new ModelAndView();
        String id = (String) session.getAttribute("id"); //없으면 GET(create안함), 있으면 POST(create)
        String flag = bean.getNickName();
		Map<String, String> codeParam = new HashMap<String, String>();

		UserBean dsUser = userService.retrieveUser(id);

		if(flag == null){
			codeParam.put("commTyCd", "CODE0100");

			List<CodeBean> dsCode1 = codeService.retrieveCodeList(codeParam);

			mv.addObject("dsUser", dsUser);
			mv.addObject("dsCode1", dsCode1);
			mv.setViewName("/user/userU");
		}else{
			String userCode = dsUser.getUserCode();
			bean.setUserCode(userCode);
			userService.updateUser(bean);
			mv.setViewName("redirect:/work/product/goMain.do");
		}
		return mv;
	}
	
	 @RequestMapping(value = "/work/user/goLogin.do", method = { RequestMethod.GET, RequestMethod.POST })
	    public ModelAndView goLogin(HttpServletRequest request) {
	    	HttpSession session = request.getSession();
	    	ModelAndView mv = new ModelAndView();
	        /* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
	        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
	        // 네이버 인증 URL

	        System.out.println("네이버:" + naverAuthUrl);
	        
	        String kakaoUrl = KakaoLoginBO.getAuthorizationUrl(session);
	        //카카오 인증 URL 

	        System.out.println("카카오:" + kakaoUrl);
	        
			String referer = request.getHeader("Referer");
			System.out.println(referer);
	        
			session.setAttribute("referUrl", referer);
			
	        mv.addObject("naver_url", naverAuthUrl);
	        mv.addObject("kakao_url", kakaoUrl);
	        /* 생성한 인증 URL을 View로 전달 */
	        mv.setViewName("/user/login");
			return mv;
	    }
		
	 @RequestMapping(value = "/work/user/naverLogin.do", produces = "application/json;charset=utf-8", method = { RequestMethod.GET, RequestMethod.POST })
		public ModelAndView naverLogin(@RequestParam String code, @RequestParam String state, HttpServletRequest request, HttpSession session) throws IOException {
			ModelAndView mv = new ModelAndView();
			OAuth2AccessToken oauthToken;
			oauthToken = naverLoginBO.getAccessToken(session, code, state);
			
			// 로그인한 사용자의 모든 정보가 JSON타입으로 저장되어 있음
			apiResult = naverLoginBO.getUserProfile(oauthToken);

			// 내가 원하는 정보 (이름)만 JSON타입에서 String타입으로 바꿔 가져오기 위한 작업
			JSONParser parser = new JSONParser();
			Object obj = null;
			try {
				obj = parser.parse(apiResult);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			JSONObject jsonobj = (JSONObject) obj;
			JSONObject response = (JSONObject) jsonobj.get("response");
			String id = (String) response.get("id");
			String nname = (String) response.get("nickname");
			String nemail = (String) response.get("email");
			String nimage = (String) response.get("profile_image");
			
//			System.out.println(id);
			System.out.println(nname);
			System.out.println(nemail);
			System.out.println(nimage);
			
			UserBean userBean = userService.retrieveSessionInfo(id);
			
			try {
				System.out.println(userBean.getUserCode());
				String userCode = userBean.getUserCode();
				String naverid = userBean.getId();
				String grade = userBean.getGrade();

				session.setAttribute("userCode", userCode);
				session.setAttribute("grade", grade);
				session.setAttribute("id", naverid);
				
				session.setMaxInactiveInterval(-1); //세션 무한대
				
				String referer = (String) session.getAttribute("referUrl");
				System.out.println(referer);
				
				mv.setViewName("redirect:/work/product/goMain.do");
				return mv;
			} catch (Exception e) {
				String[] urlSplit = nimage.split("/");
				String temp = urlSplit[urlSplit.length-1];
				System.out.println(temp);
				
				String[] typeSplit = temp.split("\\.");
				String imageType = typeSplit[typeSplit.length-1];
				System.out.println(imageType);
				
				String rootPath = request.getSession().getServletContext().getRealPath("/");
				// C:\wsf\gaebalin-wsf\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\gaebalin\
				String path = "";
				if(temp.equals("img_profile.png")) {
					path = rootPath + "\\" + "userImg" + "\\" + "img_profile.png";					
				} else {
					path = rootPath + "\\" + "userImg" + "\\" + id + "." + imageType;					
				}
				Image image = null;
		        try {
		            URL url = new URL(nimage);
		            BufferedImage img = ImageIO.read(url);
		            File file=new File(path);
		            ImageIO.write(img, imageType, file);
		        } catch (IOException e1) {
		         e1.printStackTrace();
		        }
				
				System.out.println("UnKnowned");
		        mv.addObject("id", id);
		        mv.addObject("pw", id);
		        mv.addObject("email", nemail);
		        mv.addObject("nickname", nname);
		        mv.addObject("profile", nimage);
		        mv.setViewName("/user/naverC");
				return mv;
				// TODO: handle exception
			}
		}// end naverLogin()
		
	@RequestMapping(value="/work/user/createNaverUser.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView createNaverUser(@ModelAttribute UserBean bean){
		ModelAndView mv = new ModelAndView();
        String id = bean.getAddress(); //없으면 GET(create안함), 있으면 POST(create)

		if(id == null){
			mv.setViewName("/user/naverC");
		}else{
			userService.createUser(bean);
			mv.setViewName("redirect:/work/user/goLogin.do");
		}
		return mv;
	}
	
	@RequestMapping(value = "/work/user/kakaoLogin.do", produces = "application/json", method = { RequestMethod.GET, RequestMethod.POST }) 
	public ModelAndView kakaoLogin(@RequestParam("code") String code, HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView(); // 결과값을 node에 담아줌 
		JsonNode node = kakaoLoginBO.getAccessToken(code); // accessToken에 사용자의 로그인한 모든 정보가 들어있음 
		JsonNode accessToken = node.get("access_token"); // 사용자의 정보 
		JsonNode userInfo = kakaoLoginBO.getKakaoUserInfo(accessToken); 
		String kemail = null; 
		String kname = null; 
		String kimage = null; 
		
		// 유저정보 카카오에서 가져오기 Get properties 
		JsonNode kakao_id = userInfo.path("id");
		JsonNode properties = userInfo.path("properties"); 
		JsonNode kakao_account = userInfo.path("kakao_account"); 

		String id = kakao_id.asText();
		
		kemail = kakao_account.path("email").asText(); 
		kname = properties.path("nickname").asText(); 
		kimage = properties.path("profile_image").asText(); 
		
//		session.setAttribute("kemail", kemail); 
//		session.setAttribute("kname", kname); 
//		session.setAttribute("kimage", kimage); 
		
		System.out.println(kemail);
		System.out.println(kname);
		System.out.println(kimage);
		
        UserBean userBean = userService.retrieveSessionInfo(id);
		
		try {
			System.out.println(userBean.getUserCode());
			String userCode = userBean.getUserCode();
			String naverid = userBean.getId();
			String grade = userBean.getGrade();

			session.setAttribute("userCode", userCode);
			session.setAttribute("grade", grade);
			session.setAttribute("id", naverid);
			
			session.setMaxInactiveInterval(-1); //세션 무한대
			
			String referer = (String) session.getAttribute("referUrl");
			System.out.println(referer);
			
			mv.setViewName("redirect:/work/product/goMain.do");
			return mv;
		} catch (Exception e) {
			String[] urlSplit = kimage.split("/");
			String temp = urlSplit[urlSplit.length-1];
			System.out.println(temp);
			
			String[] typeSplit = temp.split("\\.");
			String imageType = typeSplit[typeSplit.length-1];
			System.out.println(imageType);
			
			String rootPath = request.getSession().getServletContext().getRealPath("/");
			// E:\20204th\wsf\gaebalin-wsf\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\gaebalin\
			String path = rootPath + "\\" + "userImg" + "\\" + id + "." + imageType;
			
			Image image = null;
	        try {
	            URL url = new URL(kimage);
	            BufferedImage img = ImageIO.read(url);
	            File file=new File(path);
	            ImageIO.write(img, imageType, file);
	        } catch (IOException e1) {
	         e1.printStackTrace();
	        }

			System.out.println("UnKnowned");
	        mv.addObject("id", id);
	        mv.addObject("pw", id);
	        mv.addObject("email", kemail);
	        mv.addObject("nickname", kname);
	        mv.addObject("profile", kimage);
	        mv.setViewName("/user/kakaoC");
			return mv;
			}
		}// end kakaoLogin()

	@RequestMapping(value="/work/user/createKakaoUser.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView createKakaoUser(@ModelAttribute UserBean bean){
		ModelAndView mv = new ModelAndView();
        String id = bean.getAddress(); //없으면 GET(create안함), 있으면 POST(create)

		if(id == null){
			mv.setViewName("/user/kakaoC");
		}else{
			userService.createUser(bean);
			mv.setViewName("redirect:/work/user/goLogin.do");
		}
		return mv;
	}
	
	@RequestMapping(value="/work/user/deleteUser.do", method=RequestMethod.GET)
	public ModelAndView deleteUser(HttpServletRequest request){
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();
		String grade = (String) session.getAttribute("grade");
		Map<String, String> userParam = new HashMap<String, String>();

		String userCode = request.getParameter("userCode");

		userParam.put("userCode", userCode);

		userService.deleteUser(userParam);
		
		if(grade.equals("M")) {
			mv.setViewName("redirect:/work/user/retrieveUserListForM.do");
		} else {
			session.removeAttribute("id");
			session.removeAttribute("userCode");
			session.invalidate();
			mv.setViewName("redirect:/work/product/goMain.do");
		}
		return mv;
	}
	
	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub

	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub
		HttpSession session = arg0.getSession();
		session.removeAttribute("id");
		session.removeAttribute("userCode");
		session.invalidate();
	}

	@RequestMapping(value="/work/applicant/retrievePostByDong.do")
	@ResponseBody
	public ResponseEntity<List<Map<String, String>>> retrievePostByDong(HttpServletRequest request){
		String paramdong = request.getParameter("dong");

		Map<String, String> userParam = new HashMap<String, String>();

		userParam.put("dong", paramdong);

		List<Map<String, String>> dsPost = userService.retrievePostByDong(userParam);

		JSONArray jsonPostArr = new JSONArray();
		JSONObject jsonObj = null;

		for(int i = 0; i < dsPost.size(); i++){
			jsonObj = new JSONObject();
			String zipcode = dsPost.get(i).get("ZIPCODE");
			String sido = dsPost.get(i).get("SIDO");
			String gugun = dsPost.get(i).get("GUGUN");
			String dong = dsPost.get(i).get("DONG");
			String bunji = dsPost.get(i).get("BUNJI");

			jsonObj.put("zipcode", zipcode);
			jsonObj.put("sido", sido);
			jsonObj.put("gugun", gugun);
			jsonObj.put("dong", dong);
			jsonObj.put("bunji", bunji);

			jsonPostArr.add(jsonObj);
		}

		HttpHeaders resHeader = new HttpHeaders();
		resHeader.add("Content-Type","text/javascript;charset=UTF-8");

		ResponseEntity resultMsg = new ResponseEntity<List<Map<String, String>>>(jsonPostArr, resHeader, HttpStatus.OK);
		return resultMsg;
	}
	
}
