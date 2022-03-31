package yunseunghwan.used.domain;

import java.time.LocalDate;

import lombok.Data;

@Data
public class Comment {
	private int commentNum;
	private String userId;
	private int tradeNum;
	private int blindNum;
	private int reportNum;
	private LocalDate commentRegDate;
	private String contents;
	private int commentLikeCount;
} 
  