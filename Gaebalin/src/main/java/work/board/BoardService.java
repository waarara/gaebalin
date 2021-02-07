package work.board;

import java.util.List;
import java.util.Map;


public interface BoardService {
	public List<Map<String, String>> retrieveBoardList();
	public List<Map<String, String>> retrieveBoardListByTime();
	public List<Map<String, String>> retrieveBoardListByHits();
	public List<Map<String, String>> retrieveBoardListByRating();

	public Map<String, String> retrieveBoard(Map<String, String> boardParam);

	public String retrieveMaxBoardNo();

	public void createBoard(BoardBean board);

	public void updateBoard(BoardBean board);

	public void updateBoardHits(Map<String, String> boardParam);

	public void updateBoardRating(Map<String, String> boardParam);

	public void deleteBoard(Map<String, String> boardParam);
}
