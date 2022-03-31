package yunseunghwan.used.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import yunseunghwan.used.dao.ReportDao;
import yunseunghwan.used.domain.Report;

@Service
public class ReportServiceImpl implements ReportService {
	@Autowired private ReportDao reportDao;
	
	@Override
	public List<Report> getReports(String userId) {
		return reportDao.selectReports(userId);
	}
	
	@Override
	public List<Report> getAdminReports() {
		return reportDao.selectAdminReports();
	}
	
	@Override
	public ModelAndView getAdminReport(ModelAndView mv, Report report) {
		Report reportVal = reportDao.selectReport(report);
		
		mv.addObject("report", reportVal);
		mv.setViewName("admin/report/reportManager");
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
