package com.zhousf.office.exception;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartException;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

/**
 * 
 * 错误异常拦截器
 * @author zhousf
 */
public class ExceptionResolver implements HandlerExceptionResolver{

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception ex) {
		Map<String, Object> model = new HashMap<String, Object>();
        model.put("ex", ex);
        logger.error("##ExceptionResolver:"+ex.getMessage());
        if(ex instanceof MultipartException){
            return new ModelAndView("error", model);
        }
        return new ModelAndView("error", model);
	}
	
	
	
	

}
