package work.proreply;

import java.util.List;
import java.util.Map;


public interface ProreplyService {
	public List<Map<String, String>> retrieveProductReplyList(Map<String, String> proreplyParam);

	public Map<String, String> retrieveProductReply(Map<String, String> proreplyParam);

	public void createProductReply(Map<String, String> proreplyParam);

	public void updateProductReply(Map<String, String> proreplyParam);
	public void deleteProductReply(Map<String, String> proreplyParam);
}
