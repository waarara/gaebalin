package work.promark;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("promarkService")
public class PromarkServiceImpl implements PromarkService{
	@Resource(name = "promarkDAO")
	private PromarkDAO promarkDAO;

	public Map<String, String> retrieveProductMark(Map<String, String> markParam){
		return promarkDAO.retrieveProductMark(markParam);
	}

	public void createProductMark(Map<String, String> markParam){
		promarkDAO.createProductMark(markParam);
	}
}
