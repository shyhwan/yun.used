package yunseunghwan.used.domain;

import java.time.LocalDate;

import lombok.Data;

@Data
public class Message {
	private int messageNum;
	private String userId;
	private int roomNum;
	private	LocalDate messageRegTime;
	private String message;
}
