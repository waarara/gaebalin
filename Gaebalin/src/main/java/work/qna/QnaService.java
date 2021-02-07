package work.qna;

import java.util.List;
import java.util.Map;

public interface QnaService {
	public List<Map<String, String>> retrieveQnaList(Map<String, String> qnaParam);
	public List<Map<String, String>> retrieveQnaListForM(Map<String, String> qnaParam);
	public Map<String, String> retrieveQna(Map<String, String> qnaParam);
	
	public void createQna(QnaBean qna);
	public void createResponse(QnaBean qna);
	
	public void deleteQna(Map<String, String> qnaParam);
}
