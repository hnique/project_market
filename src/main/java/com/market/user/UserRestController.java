package com.market.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.market.common.EncryptUtils;
import com.market.user.bo.UserBO;
import com.market.user.entity.UserEntity;

@RestController
@RequestMapping("/user")
public class UserRestController {
	
	@Autowired
	private UserBO userBO;

	/**
	 * 아이디 중복확인 API
	 * @param loginId
	 * @return
	 */
	@RequestMapping("/is_duplicated_id")
	public Map<String, Object> isDuplicatedId(
			@RequestParam("loginId") String loginId) {
		
		Map<String, Object> result = new HashMap<>();
		result.put("isDuplicatedId", false);
		
		// select DB
		UserEntity userEntity = userBO.getUserEntityByLoginId(loginId);
		result.put("code", 1);
		
		if (userEntity != null) {
			result.put("isDuplicatedId", true);
		}
		
		return result;
	}
	
	/**
	 * 회원가입 API
	 * @param loginId
	 * @param password
	 * @param name
	 * @param phoneNumber
	 * @param email
	 * @return
	 */
	@PostMapping("/sign_up")
	public Map<String, Object> signUp(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			@RequestParam("name") String name,
			@RequestParam("phoneNumber") String phoneNumber,
			@RequestParam("email") String email) {
		
		// password hashing
		String hashedPassword = EncryptUtils.md5(password);
		
		// insert DB
		Integer userId = userBO.addUser(loginId, hashedPassword, name, phoneNumber, email);
		
		Map<String, Object> result = new HashMap<>();
		if (userId != null) {
			result.put("code", 1);
			result.put("result", "성공");
		} else {
			result.put("code", 500);
			result.put("errorMessage", "회원가입에 실패했습니다.");
		}
		
		return result;
	}
	
	/**
	 * 로그인 API
	 * @param loginId
	 * @param password
	 * @param session
	 * @return
	 */
	@PostMapping("/sign_in")
	public Map<String, Object> signIn(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			HttpSession session) {
		
		// password hashing
		String hashedPassword = EncryptUtils.md5(password);
		
		// select DB
		UserEntity userEntity = userBO.getUserEntityByLoginIdAndPassword(loginId, hashedPassword);
		
		Map<String, Object> result = new HashMap<>();
		if (userEntity != null) {
			// 로그인 성공
			session.setAttribute("userId", userEntity.getId());
			session.setAttribute("userLoginId", userEntity.getLoginId());
			session.setAttribute("userName", userEntity.getName());
			
			result.put("code", 1);
			result.put("result", "성공");
		} else {
			// 로그인 실패
			result.put("code", 500);
			result.put("errorMessage", "존재하지 않는 사용자입니다.");
		}
		return result;
	}
	
	/**
	 * 회원정보 수정 API
	 * @param password
	 * @param phoneNumber
	 * @param email
	 * @param session
	 * @return
	 */
	@PostMapping("/update_info")
	public Map<String, Object> updateInfo(
			@RequestParam("password") String password,
			@RequestParam("phoneNumber") String phoneNumber,
			@RequestParam("email") String email,
			HttpSession session) {
		
		int userId = (int)session.getAttribute("userId");
		
		// password hashing
		String hashPW;
		if (password != "") {
			hashPW = EncryptUtils.md5(password);
		} else {
			hashPW = null;
		}
		String hashedPassword = hashPW;
		
		// update DB
		userBO.updateUserInfo(userId, hashedPassword, phoneNumber, email);
		
		Map<String, Object> result = new HashMap<>();
		result.put("code", 1);
		result.put("result", "성공");
		
		return result;
	}
}
