package yunseunghwan.used.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import yunseunghwan.used.domain.Blind;
import yunseunghwan.used.service.BlindService;

@RestController
@RequestMapping("blind")
public class BlindController {
	@Autowired private BlindService blindService;
	
	@GetMapping
	public ModelAndView blinds(ModelAndView mv) {
		mv.setViewName("blind/post");
		
		return mv;
	}
	
	@GetMapping("list")
	public List<Blind> blindlList() {
		return blindService.getBlinds();
	}
	
	@GetMapping("write")
	public ModelAndView writeBlind(ModelAndView mv, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		if(userId == null) {
			mv.setViewName("redirect:/user/login");
		} else {			
			mv.addObject("userId", userId);
			mv.setViewName("blind/write");
		}
		
		return mv;
	}
	
	@PostMapping("add")
	public void addBlind(@RequestBody Blind blind) {
		blindService.addBlind(blind);
	}
	
	@GetMapping("view")
	public ModelAndView tradeView(ModelAndView mv, HttpSession session, Blind blind) {
		return blindService.getBlind(blind, mv, session);
	}
	
	@DeleteMapping("del/{blindNum}")
	public void delTrade(@PathVariable int blindNum) {
		blindService.delBlind(blindNum);
	}
}
