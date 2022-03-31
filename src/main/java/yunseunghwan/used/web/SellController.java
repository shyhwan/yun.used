package yunseunghwan.used.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import yunseunghwan.used.domain.Trade;
import yunseunghwan.used.service.TradeService;

@RestController
@RequestMapping("sell")
public class SellController {
	@Autowired private TradeService tradeService;
	
	@GetMapping
	public ModelAndView sells(ModelAndView mv) {
		mv.setViewName("sell/post");
		return mv;
	}
	
	@GetMapping("list")
	public List<Trade> sellList(String tradeCode) {
		tradeCode = "판매";
		return tradeService.getTrades(tradeCode);
	}
	
	@GetMapping("write")
	public ModelAndView writeTrade(ModelAndView mv, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		if(userId == null) {
			mv.setViewName("redirect:/user/login");
		} else {			
			mv.addObject("userId", userId);
			mv.setViewName("sell/write");
		}
		
		return mv;
	}
	
	@PostMapping("add")
	public ModelAndView addTrade(HttpSession session, ModelAndView mv, Trade trade) {
		tradeService.addTrade(session, trade);
		mv.setViewName("redirect:/sell");
		return mv;
	}
	
	
	
	@GetMapping("view")
	public ModelAndView tradeView(ModelAndView mv, HttpSession session, Trade trade) {
		return tradeService.getTrade(trade, mv, session);
	}
	
	@GetMapping("fix")
	public ModelAndView fixView(ModelAndView mv, int tradeNum, Model model) {
		Trade trade  = tradeService.fixView(tradeNum);
		model.addAttribute("trade", trade);
		mv.setViewName("sell/fix");
		return mv;
		
	}
	
	@PutMapping("fix") 
	public String fixTrade(Trade trade, HttpSession session, Model model){
		
		tradeService.fixTrade(trade, session);
		model.addAttribute("trade", trade);
		
		 
		return "redirect:sell/view?tradeNum=" + trade.getTradeNum();
	}
	
	

	
	@DeleteMapping("del/{tradeNum}")
	public void delTrade(@PathVariable int tradeNum) {
		tradeService.delTrade(tradeNum);
	}
}
