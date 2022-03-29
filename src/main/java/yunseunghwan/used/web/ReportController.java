package yunseunghwan.used.web;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import yunseunghwan.used.domain.Report;
import yunseunghwan.used.service.ReportService;

@RestController
@RequestMapping("report")
public class ReportController {
	@Autowired private ReportService reportService;
	@Value("${attachPath}") private String attachPath;
	
	@GetMapping
	public ModelAndView reports(ModelAndView mv) {
		mv.setViewName("report/post");
		
		return mv;
	}
	
	@GetMapping("list")
	public List<Report> listReport(HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		return reportService.getReports(userId);
	}
	
	@GetMapping("write")
	public ModelAndView writeReport(ModelAndView mv, HttpSession session) {
		String reportNum = (String) session.getAttribute("reportNum");
		String userId = (String) session.getAttribute("userId");
		
		mv.addObject("reportNum", reportNum);
		mv.addObject("userId", userId);
		mv.setViewName("report/write");
		return mv;
	}
	
	@PostMapping("add")
	public ModelAndView addReport(Report report, HttpSession session, ModelAndView mv) {
		String userId = (String) session.getAttribute("userId");
		String fileName = report.getReportImgFile().getOriginalFilename();

		saveFile(attachPath + "/" + fileName, report.getReportImgFile());
		
		mv.setViewName("redirect:/report");
		report.setUserId(userId);
		report.setReportImgFileName(fileName);
		reportService.addReport(report);
		
		return mv;
	}
	
	private void saveFile(String fileName, MultipartFile file) {
		try {
			file.transferTo(new File(fileName));
		} catch(IOException e) {}
	}
	
	@GetMapping("view")
	public ModelAndView tradeView(ModelAndView mv, Report report) {
		return reportService.getReport(mv, report);
	}
}
