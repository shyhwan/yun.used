package yunseunghwan.used.domain;

import lombok.Data;

@Data
public class UserDto {
	private String userId;
	private String pw;
	private String userName;
	private String nickName;
	private int phoneNum;
}
