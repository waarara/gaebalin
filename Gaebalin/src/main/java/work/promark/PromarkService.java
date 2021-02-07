package work.promark;

import java.util.Map;

public interface PromarkService {
	public Map<String, String> retrieveProductMark(Map<String, String> markParam);
	public void createProductMark(Map<String, String> markParam);

}
