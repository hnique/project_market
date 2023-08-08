package com.market.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.market.user.bo.UserBO;
import com.market.user.entity.UserEntity;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserBO userBO;

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
	
	/**
	 * 로그아웃
	 * @param session
	 * @return
	 */
	@RequestMapping("/sign_out")
	public String signOut(HttpSession session) {
		session.removeAttribute("userId");
		session.removeAttribute("userLoginId");
		session.removeAttribute("userName");
		
		return "redirect:/user/sign_in_view";
	}
	
	/**
	 * 회원정보 수정
	 * @param model
	 * @param session
	 * @return
	 */
	@GetMapping("/update_info_view")
	public String updateInfoView(Model model, HttpSession session) {
		// 로그인 여부 조회
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			// 비로그인이면 alert 띄우고 로그인 페이지로 이동
			model.addAttribute("msg", "회원 전용 메뉴입니다.");
			model.addAttribute("url", "/user/sign_in_view");
			return "alert";
		}
		
		UserEntity userEntity = userBO.getUserList(userId);
		model.addAttribute("user", userEntity);
		model.addAttribute("view", "user/updateInfo");
		return "template/layout";
	}
}
