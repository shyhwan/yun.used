package yunseunghwan.used.dao.map;

import java.util.List;

import yunseunghwan.used.domain.Trade;

public interface TradeMap {
	List<Trade> selectTrades(String tradeCode);
	List<Trade> selectAdminTrades();
	Trade selectTrade(Trade trade);
	void insertTrade(Trade trade);
	void updateTrade(Trade trade);
	void deleteTrade(int tradeNum);
}
