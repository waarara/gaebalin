package work.reserve;

import java.util.List;
import java.util.Map;


public interface ReserveService {
	public void createReserve(Map<String, String> reserveParam);
	public void updateReserve(ReserveBean reserve);
	
	public List<Map<String, String>> retrieveReserveListForM(Map<String, String> reserveParam);

	public List<Map<String, String>> retrieveReserveList(Map<String, String> reserveParam);
	
	public Map<String, String> retrieveReserveReply(Map<String, String> reserveParam);
	public Map<String, String> retrieveReserve(Map<String, String> reserveParam);
	
	public String retrieveMaxReserveNo();

	public void updateReserveYn(Map<String, String> reserveParam);
	public void updateReserveSellYn(Map<String, String> reserveParam);
	public void updateReserveReviewYn(Map<String, String> reserveParam);
	
	public void deleteReserve(Map<String, String> reserveParam);

}
