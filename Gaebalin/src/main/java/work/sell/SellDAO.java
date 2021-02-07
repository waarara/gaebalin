package work.sell;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SellDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public void createSell(Map<String, String> sellParam){
		sqlSession.insert("sell.createSell", sellParam);
	}

	public List<Map<String, String>> retrieveSellList(Map<String, String> sellParam){
		return sqlSession.selectList("sell.retrieveSellList", sellParam);
	}

	public List<Map<String, String>> retrieveBuyList(Map<String, String> sellParam){
		return sqlSession.selectList("sell.retrieveBuyList", sellParam);
	}

	public Map<String, String> retrieveSellReply(Map<String, String> sellParam){
		return sqlSession.selectOne("sell.retrieveSellReply", sellParam);
	}
	
	public String retrieveSellCode(Map<String, String> sellParam){
		return sqlSession.selectOne("sell.retrieveSellCode", sellParam);
	}

	public void updateSellYn(Map<String, String> sellParam){
		sqlSession.update("sell.updateSellYn", sellParam);
	}

	public void updateProductReviewYn(Map<String, String> sellParam){
		sqlSession.update("sell.updateProductReviewYn", sellParam);
	}

	public List<Map<String, String>> retrieveStatisticsForProduct(){
		return sqlSession.selectList("sell.retrieveStatisticsForProduct");
	}

	public List<Map<String, String>> retrieveStatisticsForCategory(){
		return sqlSession.selectList("sell.retrieveStatisticsForCategory");
	}
	
	public void deleteSell(Map<String, String> sellParam){
		sqlSession.delete("sell.deleteSell", sellParam);
	}

	public void deleteSellForRecord(Map<String, String> sellParam){
		sqlSession.delete("sell.deleteSellForRecord", sellParam);
	}
}
