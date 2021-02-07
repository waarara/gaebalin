package work.sche;

import java.util.List;
import java.util.Map;


public interface ScheService {
	public List<Map<String, String>> retrieveScheList();

	public Map<String, String> retrieveSche(Map<String, String> scheParam);

	public List<Map<String, String>> retrieveScheListByTime();
	public List<Map<String, String>> retrieveScheListByHits();

	public String retrieveMaxScheNo();

	public void createSche(ScheBean sche);

	public void updateSche(ScheBean sche);

	public void updateScheHits(Map<String, String> scheParam);

	public void deleteSche(Map<String, String> scheParam);
}
