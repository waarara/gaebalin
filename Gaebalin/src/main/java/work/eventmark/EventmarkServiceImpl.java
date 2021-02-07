package work.eventmark;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("eventmarkService")
public class EventmarkServiceImpl implements EventmarkService{
	@Resource(name = "eventmarkDAO")
	private EventmarkDAO eventmarkDAO;

	public Map<String, String> retrieveEventMark(Map<String, String> markParam){
		return eventmarkDAO.retrieveEventMark(markParam);
	}

	public void createEventMark(Map<String, String> markParam){
		eventmarkDAO.createEventMark(markParam);
	}
}
