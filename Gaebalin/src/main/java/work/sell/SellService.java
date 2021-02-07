package work.sell;

import java.util.List;
import java.util.Map;


public interface SellService {
	public void createSell(Map<String, String> sellParam);
	public List<Map<String, String>> retrieveSellList(Map<String, String> sellParam);

	public List<Map<String, String>> retrieveBuyList(Map<String, String> sellParam);

	public Map<String, String> retrieveSellReply(Map<String, String> sellParam);
	public String retrieveSellCode(Map<String, String> sellParam);

	public void updateSellYn(Map<String, String> sellParam);
	public void updateProductReviewYn(Map<String, String> sellParam);

	public List<Map<String, String>> retrieveStatisticsForProduct();
	public List<Map<String, String>> retrieveStatisticsForCategory();

	public void deleteSell(Map<String, String> sellParam);
	public void deleteSellForRecord(Map<String, String> sellParam);
}
