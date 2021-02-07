package work.sell;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("sellService")
public class SellServiceImpl implements SellService{
	@Resource(name = "sellDAO")
	private SellDAO sellDAO;

	public List<Map<String, String>> retrieveSellList(Map<String, String> sellParam){
		return sellDAO.retrieveSellList(sellParam);
	}

	public List<Map<String, String>> retrieveBuyList(Map<String, String> sellParam){
		return sellDAO.retrieveBuyList(sellParam);
	}

	public void createSell(Map<String, String> sellParam){
		sellDAO.createSell(sellParam);
	}

	public Map<String, String> retrieveSellReply(Map<String, String> sellParam){
		return sellDAO.retrieveSellReply(sellParam);
	}

	public String retrieveSellCode(Map<String, String> sellParam){
		return sellDAO.retrieveSellCode(sellParam);
	}


	public void updateSellYn(Map<String, String> sellParam){
		sellDAO.updateSellYn(sellParam);
	}

	public void updateProductReviewYn(Map<String, String> sellParam){
		sellDAO.updateProductReviewYn(sellParam);
	}

	public List<Map<String, String>> retrieveStatisticsForProduct(){
		return sellDAO.retrieveStatisticsForProduct();
	}

	public List<Map<String, String>> retrieveStatisticsForCategory(){
		return sellDAO.retrieveStatisticsForCategory();
	}
	
	public void deleteSell(Map<String, String> sellParam){
		sellDAO.deleteSell(sellParam);
	}

	public void deleteSellForRecord(Map<String, String> sellParam){
		sellDAO.deleteSellForRecord(sellParam);
	}

}
