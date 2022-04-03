package yunseunghwan.used.domain;

import java.time.LocalDate;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Trade {
	private int tradeNum;
	private String traderId;
	private String tradeCode;
	private String productCode;
	private LocalDate tradeRegDate;
	private String title;
	private String contents;
	private String tradeImgFileName;
	private String location;
	private String price;
	private String reservation;
	private String finish;
	private int viewCount;
	private MultipartFile tradeImgFile;
}
