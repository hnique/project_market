package com.market.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

	/**
	 * 회원가입 화면
	 * @return
	 */
	@GetMapping("/sign_up_view")
	public String signUpView() {
		return "user/signUp";
	}
	
	/**
	 * 로그인 화면
	 * @return
	 */
	@GetMapping("/sign_in_view")
	public String signInView() {
		return "user/signIn";
	}
	
	@RequestMapping("/sign_out")
	public String signOut() {
		return "redirect:/user/sign_in_view";
	}
}
