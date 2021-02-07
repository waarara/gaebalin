package work.proreply;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("proreplyService")
public class ProreplyServiceImpl implements ProreplyService{
	@Resource(name = "proreplyDAO")
	private ProreplyDAO proreplyDAO;

	public List<Map<String, String>> retrieveProductReplyList(Map<String, String> replyParam){
		return proreplyDAO.retrieveProductReplyList(replyParam);
	}

	public Map<String, String> retrieveProductReply(Map<String, String> replyParam){
		return proreplyDAO.retrieveProductReply(replyParam);
	}

	public void createProductReply(Map<String, String> replyParam){
		proreplyDAO.createProductReply(replyParam);
	}

	public void updateProductReply(Map<String, String> replyParam){
		proreplyDAO.updateProductReply(replyParam);
	}

	public void deleteProductReply(Map<String, String> replyParam){
		proreplyDAO.deleteProductReply(replyParam);
	}
}
