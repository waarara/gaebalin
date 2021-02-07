package work.event;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


@Service("eventService")
public class EventServiceImpl implements EventService {
	@Resource(name = "eventDAO")
	private EventDAO eventDAO;
	
	public List<Map<String, String>> retrieveEventList(Map<String, String> eventParam){
		return eventDAO.retrieveEventList(eventParam);
	}

	public List<Map<String, String>> retrieveEventMain(){
		return eventDAO.retrieveEventMain();
	}
	
	public List<Map<String, String>> retrieveEventListForM(){
		return eventDAO.retrieveEventListForM();
	}
	
	public Map<String, String> retrieveEvent(Map<String, String> eventParam){
		return eventDAO.retrieveEvent(eventParam);
	}

	public void createEvent(EventBean event){
		eventDAO.createEvent(event);
	}
	
	public void updateEvent(EventBean event){
		eventDAO.updateEvent(event);
	}
	
	public void updateEventPopMinus(Map<String, String> eventParam){
		eventDAO.updateEventPopMinus(eventParam);
	}

	public void updateEventPopPlus(Map<String, String> eventParam){
		eventDAO.updateEventPopPlus(eventParam);
	}
	
	public void updateEventYn(Map<String, String> eventParam){
		eventDAO.updateEventYn(eventParam);
	}
}
