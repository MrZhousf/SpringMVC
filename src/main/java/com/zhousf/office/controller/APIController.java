package com.zhousf.office.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhousf.office.dto.Message;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/api")
public class APIController {
	
	
	@RequestMapping(value = "/time",produces="text/html;charset=UTF-8")  
    public @ResponseBody String upload(@RequestParam(value = "key", required = true) String key,
    		HttpServletRequest request,ModelMap modelMap){ 
		JSONObject json;
		if("zhousf_key".equals(key)){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
	        String dateNowStr = sdf.format(new Date());  
	        System.out.println(dateNowStr);
			json = JSONObject.fromObject(new Message(true, dateNowStr));
		}else{
			json = JSONObject.fromObject(new Message(false, "key不正确"));
		}
        return json.toString();
	}
	

}
