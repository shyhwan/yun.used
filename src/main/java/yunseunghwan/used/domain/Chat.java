package yunseunghwan.used.domain;

import java.time.LocalDate;

import lombok.Data;

@Data
public class Chat {
	private int roomNum;
	private String userId;
	private int tradeNum;
	private	LocalDate chatRegDate;
	private String traderId;
}
