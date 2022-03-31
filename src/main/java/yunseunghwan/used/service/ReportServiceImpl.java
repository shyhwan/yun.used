package yunseunghwan.used.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import yunseunghwan.used.dao.ReportDao;
import yunseunghwan.used.dao.UserDao;
import yunseunghwan.used.domain.Report;
import yunseunghwan.used.domain.User;

@Service
public class ReportServiceImpl implements ReportService {
	@Autowired private ReportDao reportDao;
	@Autowired private UserDao userDao;
	
	@Override
	public List<Report> getReports(String userId) {
		return reportDao.selectReports(userId);
	}
	
	@Override
	public List<Report> getAdminReports() {
		return reportDao.selectAdminReports();
	}
	
	@Override
	public ModelAndView getAdminReport(ModelAndView mv, Report report, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		Report reportVal = reportDao.selectAdminReport(report);
		String reportId = reportVal.getUserId();
		User nickName = userDao.selectUser(reportId);
		
		mv.addObject("userId", userId);
		mv.addObject("report", reportVal);
		mv.addObject("reportNickName", nickName.getNickName());
		
		System.out.println("성공2");
		mv.setViewName("report/reportManager");
		
		return mv;
	}
	
	@Override
	public ModelAndView getReport(ModelAndView mv, Report report) {
		Report reportVal = reportDao.selectReport(report);

		mv.addObject("report", reportVal);
		mv.setViewName("report/view");
		return mv;
	}
	
	@Override
	public void addReport(Report report) {
		reportDao.insertReport(report);
	}
}
