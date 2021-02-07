package work.eventreply;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EventreplyDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Map<String, String>> retrieveEventReplyList(Map<String, String> replyParam){
		return sqlSession.selectList("eventreply.retrieveEventReplyList", replyParam);
	}

	public Map<String, String> retrieveEventReply(Map<String, String> replyParam){
		return sqlSession.selectOne("eventreply.retrieveEventReply", replyParam);
	}

	public void createEventReply(Map<String, String> replyParam){
		sqlSession.insert("eventreply.createEventReply", replyParam);
	}

	public void updateEventReply(Map<String, String> replyParam){
		sqlSession.update("eventreply.updateEventReply", replyParam);
	}

	public void deleteEventReply(Map<String, String> replyParam){
		sqlSession.delete("eventreply.deleteEventReply", replyParam);
	}


}
