package work.user;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserServiceImpl implements UserService{
	@Resource(name = "userDAO")
	private UserDAO UserDAO;

	@Autowired
	public void setUserDAO(UserDAO dao){
		this.UserDAO = dao;
	}
	
	public List<Map<String, String>> retrieveUserListForM(){
		return UserDAO.retrieveUserListForM();
	}

	public String retrieveUserId(String email){
		return UserDAO.retrieveUserId(email);
	}

	public String retrieveUserPw(String id, String email){
		return UserDAO.retrieveUserPw(id, email);
	}

	public List<UserBean> retrieveUserList()  {
		return UserDAO.retrieveUserList();
	}

	public UserBean retrieveUser(String id)  {
		return UserDAO.retrieveUser(id);
	}

	public UserBean retrieveSessionInfo(String id)  {
		return UserDAO.retrieveSessionInfo(id);
	}

	public boolean logincheck(String id, String pw){
		return UserDAO.logincheck(id, pw);
	}

	public void deleteUser(Map<String, String> userParam)  {
		UserDAO.deleteUser(userParam);
	}

	public void createUser(UserBean bean)  {
		UserDAO.createUser(bean);
	}

	public void updateUser(UserBean bean)  {
		UserDAO.updateUser(bean);
	}

	public List<Map<String, String>> retrievePostByDong(Map<String, String> userParam){
		return UserDAO.retrievePostByDong(userParam);
	}

}
