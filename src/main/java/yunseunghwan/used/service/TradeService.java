package yunseunghwan.used.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import yunseunghwan.used.domain.Trade;

public interface TradeService {
	List<Trade> getTrades(String tradeCode);
	List<Trade> getAdminTrades();
	ModelAndView getTrade(Trade trade, ModelAndView mv, HttpSession session);
	ModelAndView getAdminTrade(ModelAndView mv, Trade trade);
	void addTrade(HttpSession session, Trade trade);
	void fixTrade(Trade trade, HttpSession session);
	void delTrade(int tradeNum);
}
