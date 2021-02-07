package work.eventmark;

import java.util.Map;

public interface EventmarkService {
	public Map<String, String> retrieveEventMark(Map<String, String> markParam);
	public void createEventMark(Map<String, String> markParam);

}
