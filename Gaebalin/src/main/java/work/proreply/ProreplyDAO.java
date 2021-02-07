package work.proreply;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProreplyDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Map<String, String>> retrieveProductReplyList(Map<String, String> replyParam){
		return sqlSession.selectList("productreply.retrieveProductReplyList", replyParam);
	}

	public Map<String, String> retrieveProductReply(Map<String, String> replyParam){
		return sqlSession.selectOne("productreply.retrieveProductReply", replyParam);
	}

	public void createProductReply(Map<String, String> replyParam){
		sqlSession.insert("productreply.createProductReply", replyParam);
	}

	public void updateProductReply(Map<String, String> replyParam){
		sqlSession.update("productreply.updateProductReply", replyParam);
	}

	public void deleteProductReply(Map<String, String> replyParam){
		sqlSession.delete("productreply.deleteProductReply", replyParam);
	}


}
