package com.fs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fs.entity.JsonResult;
import com.fs.entity.pojo.User;
import com.fs.mapper.UserMapper;

@RestController
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserMapper userMapper;
	
	@RequestMapping("/selectUsers.do")
	public JsonResult selectUsers(){
		List<User> users = userMapper.selectAll();
		return JsonResult.ok(users);
	}
}
