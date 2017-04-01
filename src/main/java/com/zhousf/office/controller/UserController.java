package com.zhousf.office.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhousf.office.entity.User;
import com.zhousf.office.service.UserService;

/**
 * 
 * 用户信息控制器
 * @author zhousf
 */
@Controller
@RequestMapping("/user")
public class UserController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	UserService userService;
	
	/**
	 * 显示用户列表页面
	 */
	@RequestMapping(value="/list",method=RequestMethod.GET)
	private String list(Model model) {
		List<User> list = userService.getList();
		for(User user:list){
			logger.debug(user.toString());
		}
		model.addAttribute("list", list);
		return "userList";
	}
	
	/**
	 * 显示添加用户页面
	 */
	@RequestMapping(value="/showAddUser",method=RequestMethod.GET)
	private String showAddUser(Model model) {
		return "addUser";
	}
	
	/**
	 * 显示编辑用户页面
	 */
	@RequestMapping(value="/showEditUser",method=RequestMethod.GET)
	private String showEditUser(Model model,int userId) {
		logger.debug("[showEditUser]"+userId);
		User user = userService.queryById(userId);
		model.addAttribute("user", user);
		return "editUser";
	}
	
	/**
	 * 添加用户-ajax
	 */
	@RequestMapping(value="/add",method=RequestMethod.POST,produces="text/html;charset=UTF-8")
	@ResponseBody
	private String addUser(Model model,@RequestBody User user) {
		logger.debug("[addUser] "+user.toString());
		if(userService.addUser(user)==1){
			return "success";
		}else{
			return "添加用户失败";
		}
	}
	
	/**
	 * 编辑用户-ajax
	 */
	@RequestMapping(value="/edit",method=RequestMethod.POST,produces="text/html;charset=UTF-8")
	@ResponseBody
	private String editUser(Model model,@RequestBody User user) {
		logger.debug("[editUser] "+user.toString());
		if(userService.updateUser(user)==1){
			return "success";
		}else{
			return "修改用户信息失败";
		}
	}
	
	/**
	 * 删除用户-ajax
	 */
	@RequestMapping(value="/deleteUser",method=RequestMethod.POST,produces="text/html;charset=UTF-8")
	@ResponseBody
	private String deleteUser(Model model,@RequestBody User user) {
		logger.debug("[deleteUser] "+user.toString());
		if(userService.deleteById(user.getUserId())==1){
			return "success";
		}else{
			return "删除用户["+user.getUserName()+"]失败";
		}
	}
	
	/**
	 * 搜索用户
	 */
	@RequestMapping(value="/find",method=RequestMethod.GET)
	private String findUser(Model model,String userName) {
		try {
			userName =  new String(userName.getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		logger.debug("[findUser] "+userName);
		List<User> list = userService.queryByName(userName);
		model.addAttribute("list", list);
		model.addAttribute("findKey", userName);
		return "userList";
	}
	

}
