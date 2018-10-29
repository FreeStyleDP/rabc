package com.fs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class toPageController {

	@GetMapping("toUser")
	public String toUser() {
		return "user";
	}
	
	@GetMapping("toMenu")
	public String toMenu() {
		return "menu";
	}
}
