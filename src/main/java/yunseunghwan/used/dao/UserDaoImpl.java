package yunseunghwan.used.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import yunseunghwan.used.dao.map.UserMap;
import yunseunghwan.used.domain.User;
import yunseunghwan.used.domain.UserDto;

@Repository
public class UserDaoImpl implements UserDao {
	@Autowired private UserMap userMap;
	
	@Override
	public User loginUser(User user) {
		return userMap.loginUser(user);
	}
	
	@Override
	public UserDto findId(UserDto user) {
		return userMap.findId(user);
	}
	
	@Override
	public UserDto findPw(UserDto user) {
		return userMap.findPw(user);
	}
	
	@Override
	public UserDto checkUserId(UserDto user) {
		return userMap.checkUserId(user);
	}
	
	@Override
	public UserDto checkUserNickName(UserDto user) {
		return userMap.checkUserNickName(user);
	}
	
	@Override
	public UserDto checkUserPw(UserDto user) {
		return userMap.checkUserPw(user);
	}
	
	@Override
	public List<User> selectUsers() {
		return userMap.selectUsers();
	}

	@Override
	public User selectUser(String userId) {
		return userMap.selectUser(userId);
	}

	@Override
	public void insertUser(User user) {
		userMap.insertUser(user);
	}
	
	@Override
	public void updateUser(User user) {
		userMap.updateUser(user);
	}
	
	@Override
	public void deleteUser(String userId) {
		userMap.deleteUser(userId);
	}
}
