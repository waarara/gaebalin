package work.reserve;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReserveDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public void createReserve(Map<String, String> reserveParam){
		sqlSession.insert("reserve.createReserve", reserveParam);
	}

	public List<Map<String, String>> retrieveReserveListForM(Map<String, String> reserveParam){
		return sqlSession.selectList("reserve.retrieveReserveListForM", reserveParam);
	}
	
	public List<Map<String, String>> retrieveReserveList(Map<String, String> reserveParam){
		return sqlSession.selectList("reserve.retrieveReserveList", reserveParam);
	}
	
	public Map<String, String> retrieveReserveReply(Map<String, String> reserveParam){
		return sqlSession.selectOne("reserve.retrieveReserveReply", reserveParam);
	}

	public Map<String, String> retrieveReserve(Map<String, String> reserveParam){
		return sqlSession.selectOne("reserve.retrieveReserve", reserveParam);
	}
	
	public String retrieveMaxReserveNo(){
		return sqlSession.selectOne("reserve.retrieveMaxReserveNo");
	}
	
	public void updateReserve(ReserveBean reserve){
		sqlSession.update("reserve.updateReserve", reserve);
	}

	public void updateReserveYn(Map<String, String> reserveParam){
		sqlSession.update("reserve.updateReserveYn", reserveParam);
	}

	public void updateReserveReviewYn(Map<String, String> reserveParam){
		sqlSession.update("reserve.updateReserveReviewYn", reserveParam);
	}
	
	public void updateReserveSellYn(Map<String, String> reserveParam){
		sqlSession.update("reserve.updateReserveSellYn", reserveParam);
	}
	
	public void deleteReserve(Map<String, String> reserveParam){
		sqlSession.delete("reserve.deleteReserve", reserveParam);
	}

}
