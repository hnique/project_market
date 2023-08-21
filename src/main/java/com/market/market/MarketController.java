package com.market.market;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/market")
public class MarketController {

	@GetMapping("/main_view")
	public String mainView(Model model) {
		
		model.addAttribute("view", "market/main");
		return "template/layout";
	}
	
	@GetMapping("/dropdown_view")
	public String dropDownView() {
		return "include/dropdown";
	}
}
