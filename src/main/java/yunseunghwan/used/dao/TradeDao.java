package yunseunghwan.used.dao;

import java.util.List;

import yunseunghwan.used.domain.Trade;

public interface TradeDao {
	List<Trade> selectTrades(String tradeCode);
<<<<<<< HEAD
	Trade selectTrade(Trade trade);
	Trade selectTrade(int tradeNum);
=======
	List<Trade> selectAdminTrades();
	Trade selectTrade(Trade trade);
>>>>>>> branch 'master' of https://github.com/shyhwan/yun.used.git
	void insertTrade(Trade trade);
	void updateTrade(Trade trade);
	void deleteTrade(int tradeNum);
	List<Trade> selectAdminTrades(Trade trade);
}
