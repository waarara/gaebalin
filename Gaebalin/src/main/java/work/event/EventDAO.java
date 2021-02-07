package work.event;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EventDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<Map<String, String>> retrieveEventList(Map<String, String> eventParam){
		return sqlSession.selectList("event.retrieveEventList", eventParam);
	}

	public List<Map<String, String>> retrieveEventMain(){
		return sqlSession.selectList("event.retrieveEventMain");
	}
	
	public List<Map<String, String>> retrieveEventListForM(){
		return sqlSession.selectList("event.retrieveEventListForM");
	}
	
	public Map<String, String> retrieveEvent(Map<String, String> eventParam){
		return sqlSession.selectOne("event.retrieveEvent", eventParam);
	}

	public void createEvent(EventBean event){
		sqlSession.insert("event.createEvent", event);
	}
	
	public void updateEvent(EventBean event){
		sqlSession.update("event.updateEvent", event);
	}
	
	public void updateEventPopMinus(Map<String, String> eventParam){
		sqlSession.update("event.updateEventPopMinus", eventParam);
	}

	public void updateEventPopPlus(Map<String, String> eventParam){
		sqlSession.update("event.updateEventPopPlus", eventParam);
	}
	
	public void updateEventYn(Map<String, String> eventParam){
		sqlSession.update("event.updateEventYn", eventParam);
	}
}
