package yunseunghwan.used.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import yunseunghwan.used.dao.TradeDao;
import yunseunghwan.used.dao.UserDao;
import yunseunghwan.used.domain.Trade;
import yunseunghwan.used.domain.User;

@Service
public class TradeServiceImpl implements TradeService{
	@Autowired private TradeDao tradeDao;
	@Autowired private UserDao userDao;
	@Value("${attachPath}") private String attachPath;
	
	@Override
	public List<Trade> getTrades(String tradeCode) {
		return tradeDao.selectTrades(tradeCode);
	}
	
	@Override
	public List<Trade> getAdminTrades() {
		return tradeDao.selectAdminTrades();
	}
	
	@Override
	public ModelAndView getTrade(Trade trade, ModelAndView mv, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		Trade tradeVal = tradeDao.seletTrade(trade);
		String traderId = tradeVal.getTraderId();
		User nickName = userDao.selectUser(traderId);		
		
		mv.addObject("userId", userId);
		mv.addObject("trade", tradeVal);
		mv.addObject("traderNickName", nickName.getNickName());
		if(tradeVal.getTradeCode().equals("판매")) {
			mv.setViewName("sell/view");
		} else {
			mv.setViewName("buy/view");			
		}
		
		return mv;
	}
	
	@Override
	public void addTrade(HttpSession session, Trade trade) {
		String userId = (String) session.getAttribute("userId");
		String fileName = trade.getTradeImgFile().getOriginalFilename();

		trade.setTraderId(userId);
		trade.setTradeImgFileName(fileName);
		
		tradeDao.insertTrade(trade);
		saveFile(attachPath + "/" + fileName, trade.getTradeImgFile());
	}
	
	@Override
	public void fixTrade(Trade trade, HttpSession session) {
		tradeDao.updateTrade(trade);
		
	}
	
	private void saveFile(String fileName, MultipartFile file) {
		try {
			file.transferTo(new File(fileName));
		} catch(IOException e) {}
	}
	
	@Override 
	public ModelAndView fixView(ModelAndView mv, Trade trade, HttpSession session) {
		User user = (User) session.getAttribute("user");
		Trade tradeVal = tradeDao.seletTrade(trade);
		String userId = tradeVal.getTraderId();
		User nickName = userDao.selectUser(userId);		
		
		mv.addObject("user", user);
		mv.addObject("trade", tradeVal);
		mv.addObject("traderNickName", nickName.getNickName());
		if(tradeVal.getTradeCode().equals("판매")) {
			mv.setViewName("sell/fix");
		} else {
			mv.setViewName("buy/fix");			
		}
		
		return mv;
	}
	
	@Override
	public void delTrade(int tradeNum) {
		tradeDao.deleteTrade(tradeNum);
	}
}

