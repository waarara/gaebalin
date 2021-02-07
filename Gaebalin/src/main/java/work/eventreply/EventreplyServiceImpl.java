package work.eventreply;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("eventreplyService")
public class EventreplyServiceImpl implements EventreplyService{
	@Resource(name = "eventreplyDAO")
	private EventreplyDAO eventreplyDAO;

	public List<Map<String, String>> retrieveEventReplyList(Map<String, String> replyParam){
		return eventreplyDAO.retrieveEventReplyList(replyParam);
	}

	public Map<String, String> retrieveEventReply(Map<String, String> replyParam){
		return eventreplyDAO.retrieveEventReply(replyParam);
	}

	public void createEventReply(Map<String, String> replyParam){
		eventreplyDAO.createEventReply(replyParam);
	}

	public void updateEventReply(Map<String, String> replyParam){
		eventreplyDAO.updateEventReply(replyParam);
	}

	public void deleteEventReply(Map<String, String> replyParam){
		eventreplyDAO.deleteEventReply(replyParam);
	}
}
