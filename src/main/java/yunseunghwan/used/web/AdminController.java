package yunseunghwan.used.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import yunseunghwan.used.domain.Report;
import yunseunghwan.used.domain.Trade;
import yunseunghwan.used.domain.User;
import yunseunghwan.used.service.ReportService;
import yunseunghwan.used.service.TradeService;
import yunseunghwan.used.service.UserService;

@RestController
@RequestMapping("admin")
public class AdminController {
	@Autowired private UserService userService;
	@Autowired private ReportService reportService;
	@Autowired private TradeService tradeService;
	
	@GetMapping("users")
	public ModelAndView Users(ModelAndView mv) {
		mv.setViewName("admin/user/users");
		return mv;
	}
	
	@GetMapping("userList")
	public List<User> UserList() {
		return userService.getUsers();
	}
	
	@GetMapping("userManager")
	public ModelAndView UserProfile(ModelAndView mv, User user) {
		return userService.getAdminUser(user, mv);
	}
	
	@GetMapping("report")
	public ModelAndView Reports(ModelAndView mv) {
		mv.setViewName("admin/report/report");
		return mv;
	}
	
	@GetMapping("reportList")
	public List<Report> reportList() {
		return reportService.getAdminReports();
	}
	
	@GetMapping("reportManager")
	public ModelAndView reportView(ModelAndView mv, Report report) {
		return reportService.getAdminReport(mv, report);
	}

	@GetMapping("trade")
	public ModelAndView trade(ModelAndView mv) {
		mv.setViewName("admin/trade/trade");
		return mv;
	}
	
	@GetMapping("tradeList")
	public List<Trade> tradeList(Trade trade) {
		return tradeService.getAdminTrades(trade);
	}
	
	@GetMapping("tradeManager")
	public ModelAndView tradeView(ModelAndView mv, Trade trade) {
		return tradeService.getAdminTrade(mv, trade);
	}
	
}
