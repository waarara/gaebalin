package work.eventmark;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EventmarkDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public Map<String, String> retrieveEventMark(Map<String, String> markParam){
		return sqlSession.selectOne("eventmark.retrieveEventMark", markParam);
	}

	public void createEventMark(Map<String, String> markParam){
		sqlSession.insert("eventmark.createEventMark", markParam);
	}

}
