package work.event;

import java.util.List;
import java.util.Map;


public interface EventService {
	public List<Map<String, String>> retrieveEventList(Map<String, String> eventParam);
	public List<Map<String, String>> retrieveEventMain();
	public List<Map<String, String>> retrieveEventListForM();
	
	public Map<String, String> retrieveEvent(Map<String, String> eventParam);

	public void createEvent(EventBean event);
	public void updateEvent(EventBean event);
	
	public void updateEventPopMinus(Map<String, String> eventParam);
	public void updateEventPopPlus(Map<String, String> eventParam);

	public void updateEventYn(Map<String, String> eventParam);
}
