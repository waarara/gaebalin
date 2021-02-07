package work.qna;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("qnaService")
public class QnaServiceImpl implements QnaService{
	@Resource(name = "qnaDAO")
	private QnaDAO qnaDAO;
	
	public List<Map<String, String>> retrieveQnaList(Map<String, String> qnaParam){
		return qnaDAO.retrieveQnaList(qnaParam);
	}
	
	public List<Map<String, String>> retrieveQnaListForM(Map<String, String> qnaParam){
		return qnaDAO.retrieveQnaListForM(qnaParam);
	}
	
	public Map<String, String> retrieveQna(Map<String, String> qnaParam){
		return qnaDAO.retrieveQna(qnaParam);
	}
	
	public void createQna(QnaBean qna){
		qnaDAO.createQna(qna);
	}
	
	public void createResponse(QnaBean qna){
		qnaDAO.createResponse(qna);
	}
	
	public void deleteQna(Map<String, String> qnaParam){
		qnaDAO.deleteQna(qnaParam);
	}
}
