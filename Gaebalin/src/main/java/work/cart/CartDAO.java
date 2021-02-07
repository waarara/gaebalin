package work.cart;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import work.user.UserBean;

@Repository
public class CartDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public void createCart(Map<String, String> cartParam){
		sqlSession.insert("cart.createCart", cartParam);
	}

	public List<Map<String, String>> retrieveCartList(Map<String, String> cartParam){
		return sqlSession.selectList("cart.retrieveCartList", cartParam);
	}

	public List<Map<String, String>> retrieveCartListForBuy(Map<String, String> cartParam){
		return sqlSession.selectList("cart.retrieveCartListForBuy", cartParam);
	}

	public Map<String, String> retrieveCart(Map<String, String> cartParam){
		return sqlSession.selectOne("cart.retrieveCart", cartParam);
	}
	
	public CartBean cartInfo(String cartCode){
		return sqlSession.selectOne("cart.cartInfo", cartCode);
	}

	public void deleteCart(Map<String, String> cartParam){
		sqlSession.delete("cart.deleteCart", cartParam);
	}
	
	public void updateCheckYn(Map<String, String> cartParam){
		sqlSession.update("cart.updateCheckYn", cartParam);
	}
	
	public void resetCheckYn(Map<String, String> cartParam){
		sqlSession.update("cart.resetCheckYn", cartParam);
	}
}
