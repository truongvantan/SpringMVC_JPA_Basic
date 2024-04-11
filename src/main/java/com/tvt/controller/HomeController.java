package com.tvt.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tvt.entity.Account;
import com.tvt.service.AccountService;

@Controller
public class HomeController {

	@Autowired
	private AccountService accountService;

	@GetMapping(value = { "", "/", "/login" })
	public String showLogin(Model model, @RequestParam(value = "error", required = false) String error) {
		if ("1".equals(error)) {
			model.addAttribute("errorMessage", "Vui lòng đăng nhập để sử dụng hệ thống");
		}
		return "login";
	}

	@PostMapping("/checkLogin")
	public String checkLogin(Model model, HttpSession session, @RequestParam(name = "username") String username,
			@RequestParam(name = "password") String password) {
		Account a = accountService.findByUsernameAndPassword(username, password);
		String sessionAccount = null;
		if (a == null) {
			model.addAttribute("errorMessage", "Thông tin đăng nhập không chính xác");
			return "login";
		} else if ("admin".equals(a.getRole())) {
			sessionAccount = a.getUsername() + "(admin)";
			session.setAttribute("sessionAccount", sessionAccount);
			return "welcomeAdmin";
		} else {
			sessionAccount = a.getUsername() + "(user)";
			session.setAttribute("sessionAccount", sessionAccount);
			return "welcomeUser";
		}
	}
	
	@GetMapping("/logout")
	public String logout(Model model, HttpSession session) {
		session.invalidate();
		return "redirect:/login?error=1";
	}
}
