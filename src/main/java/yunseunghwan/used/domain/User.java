package yunseunghwan.used.domain;

import java.time.LocalDate;

import lombok.Data;

@Data
public class User {
	private String userId;
	private String userName;
	private String Pw;
	private String nickName;
	private int phoneNum;
	private LocalDate joinDate;
}
