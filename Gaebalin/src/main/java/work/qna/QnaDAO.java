package work.qna;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QnaDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<Map<String, String>> retrieveQnaList(Map<String, String> qnaParam){
		return sqlSession.selectList("qna.retrieveQnaList", qnaParam);
	}
	
	public List<Map<String, String>> retrieveQnaListForM(Map<String, String> qnaParam){
		return sqlSession.selectList("qna.retrieveQnaListForM", qnaParam);
	}
	
	public Map<String, String> retrieveQna(Map<String, String> qnaParam){
		return sqlSession.selectOne("qna.retrieveQna", qnaParam);
	}
	
	public void createQna(QnaBean qna){
		sqlSession.insert("qna.createQna", qna);
	}
	
	public void createResponse(QnaBean qna){
		sqlSession.insert("qna.createResponse", qna);
	}
	
	public void deleteQna(Map<String, String> qnaParam){
		sqlSession.delete("qna.deleteQna", qnaParam);
	}
	
}
