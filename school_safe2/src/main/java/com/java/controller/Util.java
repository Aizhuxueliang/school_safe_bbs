package com.java.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;

import com.java.utils.ResponseUtil;

@Controller
public class Util {
	
	public static String SetMap(String mgf,boolean  b,HttpServletResponse response)
	{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("mgf", mgf);
		map.put("success", b);
		String result = new JSONObject(map).toString();
		ResponseUtil.write(response, result);
		return null;
	}
    
    
}


