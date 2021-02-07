package work.cart;

import java.util.List;
import java.util.Map;

public interface CartService {
	public void createCart(Map<String, String> cartParam);
	public List<Map<String, String>> retrieveCartList(Map<String, String> cartParam);
	public List<Map<String, String>> retrieveCartListForBuy(Map<String, String> cartParam);

	public Map<String, String> retrieveCart(Map<String, String> cartParam);
	public CartBean cartInfo(String cartCode);

	public void deleteCart(Map<String, String> cartParam);

	public void updateCheckYn(Map<String, String> cartParam);
	public void resetCheckYn(Map<String, String> cartParam);
	

}
