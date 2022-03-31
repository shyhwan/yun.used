package yunseunghwan.used.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import yunseunghwan.used.dao.map.ReportMap;
import yunseunghwan.used.domain.Report;

@Repository
public class ReportDaoImpl implements ReportDao {
	@Autowired private ReportMap reportMap;
	
	@Override
	public List<Report> selectReports(String userId) {
		return reportMap.selectReports(userId);
	}
	
	@Override
	public List<Report> selectAdminReports() {
		return reportMap.selectAdminReports();
	}

	@Override
	public Report selectReport(Report report) {
		return reportMap.selectReport(report);
	}
	
	@Override
	public void insertReport(Report report) {
		reportMap.insertReport(report);
	}
}
