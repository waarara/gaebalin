package work.eventreply;

import java.util.List;
import java.util.Map;


public interface EventreplyService {
	public List<Map<String, String>> retrieveEventReplyList(Map<String, String> eventreplyParam);

	public Map<String, String> retrieveEventReply(Map<String, String> eventreplyParam);

	public void createEventReply(Map<String, String> eventreplyParam);

	public void updateEventReply(Map<String, String> eventreplyParam);
	public void deleteEventReply(Map<String, String> eventreplyParam);
}
