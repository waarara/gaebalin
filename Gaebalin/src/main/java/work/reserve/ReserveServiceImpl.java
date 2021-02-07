package work.reserve;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("reserveService")
public class ReserveServiceImpl implements ReserveService{
	@Resource(name = "reserveDAO")
	private ReserveDAO reserveDAO;

	public List<Map<String, String>> retrieveReserveListForM(Map<String, String> reserveParam){
		return reserveDAO.retrieveReserveListForM(reserveParam);
	}
	
	public List<Map<String, String>> retrieveReserveList(Map<String, String> reserveParam){
		return reserveDAO.retrieveReserveList(reserveParam);
	}
	
	public Map<String, String> retrieveReserveReply(Map<String, String> reserveParam){
		return reserveDAO.retrieveReserveReply(reserveParam);
	}

	public Map<String, String> retrieveReserve(Map<String, String> reserveParam){
		return reserveDAO.retrieveReserve(reserveParam);
	}

	public void createReserve(Map<String, String> reserveParam){
		reserveDAO.createReserve(reserveParam);
	}
	
	public void updateReserve(ReserveBean reserve){
		reserveDAO.updateReserve(reserve);
	}
	
	public String retrieveMaxReserveNo(){
		return reserveDAO.retrieveMaxReserveNo();
	}

	public void updateReserveYn(Map<String, String> reserveParam){
		reserveDAO.updateReserveYn(reserveParam);
	}
	
	public void updateReserveSellYn(Map<String, String> reserveParam){
		reserveDAO.updateReserveSellYn(reserveParam);
	}

	public void updateReserveReviewYn(Map<String, String> reserveParam){
		reserveDAO.updateReserveReviewYn(reserveParam);
	}
	
	public void deleteReserve(Map<String, String> reserveParam){
		reserveDAO.deleteReserve(reserveParam);
	}

}
