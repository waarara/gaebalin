package work.product;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Map<String, String>> retrieveProductList(Map<String, String> productParam){
		return sqlSession.selectList("product.retrieveProductList", productParam);
	}

	public List<Map<String, String>> retrieveProductListPop(){
		return sqlSession.selectList("product.retrieveProductListPop");
	}

	public List<Map<String, String>> retrieveProductListForMain(){
		return sqlSession.selectList("product.retrieveProductListForMain");
	}

	public List<Map<String, String>> retrieveProductListForJava(){
		return sqlSession.selectList("product.retrieveProductListForJava");
	}

	public Map<String, String> retrieveProductPop(){
		return sqlSession.selectOne("product.retrieveProductPop");
	}
	
	public Map<String, String> retrieveProduct(Map<String, String> productParam){
		return sqlSession.selectOne("product.retrieveProduct", productParam);
	}

	public void createProduct(ProductBean product){
		sqlSession.insert("product.createProduct", product);
	}

	public String retrieveMaxProductCode(){
		return sqlSession.selectOne("product.retrieveMaxProductCode");
	}

	public void updateProduct(ProductBean product){
		sqlSession.update("product.updateProduct", product);
	}

	public void updateProductCountMinus(Map<String, String> productParam){
		sqlSession.update("product.updateProductCountMinus", productParam);
	}

	public void updateProductCountPlus(Map<String, String> productParam){
		sqlSession.update("product.updateProductCountPlus", productParam);
	}

	public List<Map<String, String>> retrieveStatisticsForStock(Map<String, String> productParam){
		return sqlSession.selectList("product.retrieveStatisticsForStock", productParam);
	}

	public List<Map<String, String>> retrieveStatisticsForSell(){
		return sqlSession.selectList("product.retrieveStatisticsForSell");
	}
}
