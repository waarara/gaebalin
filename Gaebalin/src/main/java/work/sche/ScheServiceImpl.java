package work.sche;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("scheService")
public class ScheServiceImpl implements ScheService{
	@Resource(name = "scheDAO")
	private ScheDAO scheDAO;

	public List<Map<String, String>> retrieveScheList(){
		return scheDAO.retrieveScheList();
	}

	public Map<String, String> retrieveSche(Map<String, String> scheParam){
		return scheDAO.retrieveSche(scheParam);
	}

	public List<Map<String, String>> retrieveScheListByTime(){
		return scheDAO.retrieveScheListByTime();
	}

	public List<Map<String, String>> retrieveScheListByHits(){
		return scheDAO.retrieveScheListByHits();
	}

	public List<Map<String, String>> retrieveScheListByRating(){
		return scheDAO.retrieveScheListByRating();
	}

	public String retrieveMaxScheNo(){
		return scheDAO.retrieveMaxScheNo();
	}

	public void createSche(ScheBean sche){
		scheDAO.createSche(sche);
	}

	public void updateSche(ScheBean sche){
		scheDAO.updateSche(sche);
	}

	public void updateScheHits(Map<String, String> scheParam){
		scheDAO.updateScheHits(scheParam);
	}

	public void deleteSche(Map<String, String> scheParam){
		scheDAO.deleteSche(scheParam);
	}
}
