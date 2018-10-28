package com.fs.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.fs.entity.config.Persion;

@Controller
public class HelloController {
	
	@Value("${cupSize}")
	private String cupSize ;
	
	@Value("${content}")
	private String content ;
	
	@Autowired
	private Persion persion;
	
	@RequestMapping("/hello1")
	public String say() {
//		return "hello world";
//		return persion.toString();
		return "index";
	}
	
//	安全起见还是标明请求方式
	@RequestMapping(value = {"/hello" , "/hi"} , method = RequestMethod.GET)
	public String say1() {
//		return "hello world";
//		return persion.toString();
		return "index";
	}
	
	@GetMapping("/hello2")
	public String say2() {
		return "index";
	}
}
