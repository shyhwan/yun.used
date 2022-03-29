package yunseunghwan.used.domain;

import java.time.LocalDate;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Report {
	private int reportNum;
	private String userId;
	private String title;
	private String contents;
	private String accusedName;
	private String reportImgFileName;
	private MultipartFile reportImgFile;
	private LocalDate regDate;
	
}
