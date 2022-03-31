package yunseunghwan.used.domain;

import java.time.LocalDate;

import lombok.Data;

@Data
public class Blind {
	private int blindNum;
	private String userId;
	private LocalDate blindRegDate;
	private String title;
	private String contents;
	private int blindLikeCount;
}
