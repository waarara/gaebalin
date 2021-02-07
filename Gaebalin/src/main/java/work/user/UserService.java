package work.user;

import java.util.List;
import java.util.Map;

public interface UserService {
	public List<UserBean> retrieveUserList();
	public List<Map<String, String>> retrieveUserListForM();
	
	public UserBean retrieveUser(String id);
	public String retrieveUserId(String email);
	public String retrieveUserPw(String id, String email);
	
	public boolean logincheck(String id, String pw);
	public void deleteUser(Map<String, String> userParam);
	
	public UserBean retrieveSessionInfo(String id);
	public void updateUser(UserBean bean);
	public void createUser(UserBean bean);
	public List<Map<String, String>> retrievePostByDong(Map<String, String> userParam);

}
