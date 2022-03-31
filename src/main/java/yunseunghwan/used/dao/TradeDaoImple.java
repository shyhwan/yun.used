package yunseunghwan.used.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import yunseunghwan.used.dao.map.TradeMap;
import yunseunghwan.used.domain.Trade;

@Repository
public class TradeDaoImple implements TradeDao{
	@Autowired private TradeMap tradeMap;
	
	
	@Override
	public List<Trade> selectTrades(String tradeCode) {
		return tradeMap.selectTrades(tradeCode);
	}
	
	@Override
	public List<Trade> selectAdminTrades() {
		return tradeMap.selectAdminTrades();
	}
	
	@Override
	public Trade seletTrade(Trade trade) {
		return tradeMap.seletTrade(trade);
	}
	
	@Override
	public Trade seletTrade(int tradeNum) {
		return tradeMap.seletTrade(tradeNum);
	}
	
	@Override
	public void insertTrade(Trade trade) {
		tradeMap.insertTrade(trade);
	}
	
	@Override
	public void updateTrade(Trade trade) {
		tradeMap.updateTrade(trade);
	}
	
	@Override
	public void deleteTrade(int tradeNum) {
		tradeMap.deleteTrade(tradeNum);
	}
}


