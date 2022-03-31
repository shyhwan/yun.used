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
	public List<Trade> selectAdminTrades(Trade trade) {
		return tradeMap.selectAdminTrades();
	}
	
	@Override
	public Trade selectTrade(Trade trade) {
		return tradeMap.selectTrade(trade);
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

	@Override
	public Trade selectTrade(int tradeNum) {
		return tradeMap.seletTrade(tradeNum);
	}


}


