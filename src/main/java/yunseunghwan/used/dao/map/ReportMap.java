package yunseunghwan.used.dao.map;

import java.util.List;

import yunseunghwan.used.domain.Report;

public interface ReportMap {
	List<Report> selectReports(String userId);
	Report selectReport(Report report);
	void insertReport(Report report);
}
