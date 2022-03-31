package yunseunghwan.used.dao;

import java.util.List;

import yunseunghwan.used.domain.Report;

public interface ReportDao {
	List<Report> selectReports(String userId);
	List<Report> selectAdminReports();
	Report selectAdminReport(Report report);
	Report selectReport(Report report);
	void insertReport(Report report);
}
