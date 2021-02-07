package work.sche;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ScheDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Map<String, String>> retrieveScheList(){
		return sqlSession.selectList("sche.retrieveScheList");
	}

	public Map<String, String> retrieveSche(Map<String, String> scheParam){
		return sqlSession.selectOne("sche.retrieveSche", scheParam);
	}

	public List<Map<String, String>> retrieveScheListByTime(){
		return sqlSession.selectList("sche.retrieveScheListByTime");
	}

	public List<Map<String, String>> retrieveScheListByHits(){
		return sqlSession.selectList("sche.retrieveScheListByHits");
	}

	public List<Map<String, String>> retrieveScheListByRating(){
		return sqlSession.selectList("sche.retrieveScheListByRating");
	}

	public String retrieveMaxScheNo(){
		return sqlSession.selectOne("sche.retrieveMaxScheNo");
	}

	public void createSche(ScheBean sche){
		sqlSession.insert("sche.createSche", sche);
	}

	public void updateSche(ScheBean sche){
		sqlSession.update("sche.updateSche", sche);
	}

	public void updateScheHits(Map<String, String> scheParam){
		sqlSession.update("sche.updateScheHits", scheParam);
	}

	public void deleteSche(Map<String, String> scheParam){
		sqlSession.delete("sche.deleteSche", scheParam);
	}


}
