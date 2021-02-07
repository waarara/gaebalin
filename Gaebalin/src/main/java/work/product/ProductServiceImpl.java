package work.product;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("productService")
public class ProductServiceImpl implements ProductService{
	@Resource(name = "productDAO")
	private ProductDAO productDAO;

	public List<Map<String, String>> retrieveProductList(Map<String, String> productParam){
		return productDAO.retrieveProductList(productParam);
	}

	public List<Map<String, String>> retrieveProductListPop(){
		return productDAO.retrieveProductListPop();
	}

	public List<Map<String, String>> retrieveProductListForMain(){
		return productDAO.retrieveProductListForMain();
	}

	public List<Map<String, String>> retrieveProductListForJava(){
		return productDAO.retrieveProductListForJava();
	}

	public Map<String, String> retrieveProductPop(){
		return productDAO.retrieveProductPop();
	}
	
	public Map<String, String> retrieveProduct(Map<String, String> productParam){
		return productDAO.retrieveProduct(productParam);
	}

	public void createProduct(ProductBean product){
		productDAO.createProduct(product);
	}

	public String retrieveMaxProductCode(){
		return productDAO.retrieveMaxProductCode();
	}

	public void updateProduct(ProductBean product){
		productDAO.updateProduct(product);
	}

	public void updateProductCountMinus(Map<String, String> productParam){
		productDAO.updateProductCountMinus(productParam);
	}

	public void updateProductCountPlus(Map<String, String> productParam){
		productDAO.updateProductCountPlus(productParam);
	}

	public List<Map<String, String>> retrieveStatisticsForStock(Map<String, String> productParam){
		return productDAO.retrieveStatisticsForStock(productParam);
	}

	public List<Map<String, String>> retrieveStatisticsForSell(){
		return productDAO.retrieveStatisticsForSell();
	}
}
