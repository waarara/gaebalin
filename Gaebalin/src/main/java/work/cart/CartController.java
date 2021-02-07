package work.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import work.product.ProductService;
import work.user.UserService;

@Controller
public class CartController {
	@Resource(name = "productService")
	private ProductService productService;

	@Resource(name = "cartService")
	private CartService cartService;

	@Resource(name = "userService")
	private UserService userService;


	@RequestMapping(value="/work/cart/createCart.do", method=RequestMethod.GET)
	public ModelAndView createCart(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();

		String productCode = request.getParameter("productCode");
		String cartPrice = request.getParameter("cartPrice");
		String cartCount = request.getParameter("cartCount");

		String userCode = (String)session.getAttribute("userCode");

		Map<String, String> cartParam = new HashMap<String, String>();
		Map<String, String> productParam = new HashMap<String, String>();

		cartParam.put("productCode", productCode);
		cartParam.put("userCode", userCode);
		cartParam.put("cartPrice", cartPrice);
		cartParam.put("cartCount", cartCount);

		//장바구니 테이블에 저장
		cartService.createCart(cartParam);

		productParam.put("productCode", productCode);
		productParam.put("productCount", cartCount);

		productService.updateProductCountMinus(productParam);

		mv.setViewName("redirect:/work/cart/retrieveCartList.do");

		return mv;
	}

	@RequestMapping(value="/work/cart/retrieveCartConfirm.do", method=RequestMethod.GET)
	public ModelAndView retrieveCartConfirm(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		String productCode = request.getParameter("productCode");

		mv.addObject("productCode", productCode);

		mv.setViewName("/cart/cartConfirmR");

		return mv;
	}


	@RequestMapping(value="/work/cart/retrieveCartList.do", method=RequestMethod.GET)
	public ModelAndView retrieveCartList(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();

		String userCode = (String)session.getAttribute("userCode");

		Map<String, String> cartParam = new HashMap<String, String>();

		cartParam.put("userCode", userCode);

		List<Map<String, String>> dsCartList = cartService.retrieveCartList(cartParam);

		mv.addObject("dsCartList", dsCartList);

		mv.setViewName("/cart/cartListR");

		return mv;
	}
	
	@RequestMapping(value="/work/cart/cartBuyList.do", method=RequestMethod.GET)
	public ModelAndView cartBuyAll(HttpServletRequest request
									){
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession();

		String userCode = (String)session.getAttribute("userCode");

		Map<String, String> cartParam = new HashMap<String, String>();

		cartParam.put("userCode", userCode);

		List<Map<String, String>> dsCartList = cartService.retrieveCartListForBuy(cartParam);
		Map<String, String> dsCart = cartService.retrieveCart(cartParam);
		
		mv.addObject("dsCartList", dsCartList);
		mv.addObject("dsCart", dsCart);
		
		mv.setViewName("/cart/cartBuyList");

		return mv;
	}
	
	@RequestMapping(value="/work/cart/ajaxBuyList.do",method=RequestMethod.GET)
	@ResponseBody
	public Map<String, String> ajaxBuyList(HttpServletRequest request
											, @RequestParam(value="buyList", required=false) List<String> buyList){
		HttpSession session = request.getSession();
		String userCode = (String)session.getAttribute("userCode");
		
		Map<String, String> resetParam = new HashMap<String, String>();
		resetParam.put("userCode", userCode);
		cartService.resetCheckYn(resetParam);
		
//		System.out.println(buyList.size());
		
		Map<String, String> cartYnMap = new HashMap<String, String>();
		try {
			for(int i = 0; i < buyList.size(); i++) {
				Map<String, String> cartParam = new HashMap<String, String>();
				cartParam.put("cartCode", buyList.get(i));
				
				cartService.updateCheckYn(cartParam);
			};
			cartYnMap.put("cartYn", "success");
		} catch (Exception e) {
			// TODO: handle exception
			cartYnMap.put("cartYn", "fail");
		}
		return cartYnMap;
	}
	
	@RequestMapping(value="/work/cart/ajaxDeleteCart.do",method=RequestMethod.GET)
	@ResponseBody
	public Map<String, String> ajaxDeleteCart(HttpServletRequest request
											, @RequestParam(value="deleteList", required=false) List<String> deleteList){
//		System.out.println(deleteList.size());
		
		Map<String, String> cartYnMap = new HashMap<String, String>();
		try {
			for(int i = 0; i < deleteList.size(); i++) {
				Map<String, String> cartParam = new HashMap<String, String>();
				Map<String, String> productParam = new HashMap<String, String>();
				cartParam.put("cartCode", deleteList.get(i));
				
				CartBean cart = cartService.cartInfo(deleteList.get(i));
				
				String productCode = cart.getProductCode();
				String productCount = Integer.toString(cart.getCartCount());
				
//				System.out.println(productCode);
				productParam.put("productCode", productCode);
				productParam.put("productCount", productCount);
				
				productService.updateProductCountPlus(productParam);
				
				cartService.deleteCart(cartParam);
			};
			cartYnMap.put("deleteYn", "success");
		} catch (Exception e) {
			// TODO: handle exception
			cartYnMap.put("deleteYn", "fail");
		}
		return cartYnMap;
	}

}
