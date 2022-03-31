package yunseunghwan.used.dao;

import java.util.List;

import yunseunghwan.used.domain.Trade;

public interface TradeDao {
	List<Trade> selectTrades(String tradeCode);
	List<Trade> selectAdminTrades();
	Trade seletTrade(Trade trade);
	void insertTrade(Trade trade);
	void updateTrade(Trade trade);
	void deleteTrade(int tradeNum);
}
