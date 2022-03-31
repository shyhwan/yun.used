package yunseunghwan.used.dao.map;

import java.util.List;

import yunseunghwan.used.domain.User;
import yunseunghwan.used.domain.UserDto;

public interface UserMap {
	User loginUser(User user);
	UserDto findId(UserDto user);
	UserDto findPw(UserDto user);
	UserDto checkUserId(UserDto user);
	UserDto checkUserNickName(UserDto user);
	UserDto checkUserPw(UserDto user);
	List<User> selectUsers();
	User selectAdminUser(User user);
	User selectUser(String userId);
	void insertUser(User user);
	void updateUser(User user);
	void deleteUser(String userId);
}
