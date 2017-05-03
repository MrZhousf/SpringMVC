package com.zhousf.office.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartException;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.util.FileCopyUtils;
import com.zhousf.office.dto.Message;

import net.sf.json.JSONObject;


@Controller
@RequestMapping("/upload")
public class UploadFileController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
    @RequestMapping(value = "/uploadFile",produces="text/html;charset=UTF-8")  
    public @ResponseBody String upload(@RequestParam(value = "uploadFile", required = false) MultipartFile[] files,
    		HttpServletRequest request,ModelMap modelMap){  
    	JSONObject json;
    	String fileUrl = "";
    	for(MultipartFile file : files){
    		if(file.isEmpty()){
            	json = JSONObject.fromObject(new Message(false, "参数错误"));
            	return "json";
            }
            String path = request.getSession().getServletContext().getRealPath("upload");  
            //后缀
            String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")); 
            String fileName = new Date().getTime()+suffix;  
            File targetFile = new File(path, fileName);  
            if(!targetFile.exists()){  
                targetFile.mkdirs();  
            }  
            //保存  
            try {  
                file.transferTo(targetFile);  
            } catch (Exception e) {  
                e.printStackTrace();  
            }  
            System.out.println("接受文件："+targetFile.getPath());
            fileUrl += request.getContextPath()+"/upload/"+fileName+",";
    	}
        json = JSONObject.fromObject(new Message(true, "上传文件成功"));
        json.put("fileUrl", fileUrl);
        return json.toString();  
    } 
    
    
	
	

}
