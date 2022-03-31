package yunseunghwan.used.dao.map;

import java.util.List;

import yunseunghwan.used.domain.Trade;

public interface TradeMap {
	List<Trade> selectTrades(String tradeCode);
	List<Trade> selectAdminTrades();
<<<<<<< HEAD
	Trade seletTrade(Trade trade);
	Trade seletTrade(int tradeNum);
=======
	Trade selectTrade(Trade trade);
>>>>>>> branch 'master' of https://github.com/shyhwan/yun.used.git
	void insertTrade(Trade trade);
	void updateTrade(Trade trade);
	void deleteTrade(int tradeNum);
}
