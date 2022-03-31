package yunseunghwan.used.dao.map;

import java.util.List;

import yunseunghwan.used.domain.Report;

public interface ReportMap {
	List<Report> selectReports(String userId);
	List<Report> selectAdminReports();
	Report selectAdminReport(Report report);
	Report selectReport(Report report);
	void insertReport(Report report);
}
