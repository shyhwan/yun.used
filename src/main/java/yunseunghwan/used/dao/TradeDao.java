package yunseunghwan.used.dao;

import java.util.List;

import yunseunghwan.used.domain.Trade;

public interface TradeDao {
	List<Trade> selectTrades(String tradeCode);
	Trade seletTrade(Trade trade);
	Trade seletTrade(int tradeNum);
	void insertTrade(Trade trade);
	void updateTrade(Trade trade);
	void deleteTrade(int tradeNum);
}
