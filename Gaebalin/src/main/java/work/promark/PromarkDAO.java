package work.promark;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PromarkDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public Map<String, String> retrieveProductMark(Map<String, String> markParam){
		return sqlSession.selectOne("productmark.retrieveProductMark", markParam);
	}

	public void createProductMark(Map<String, String> markParam){
		sqlSession.insert("productmark.createProductMark", markParam);
	}

}
