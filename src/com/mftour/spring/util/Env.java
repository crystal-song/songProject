package com.mftour.spring.util;

import java.io.InputStream;
import java.util.Properties;

public final class Env extends Properties {  //继承Properties  
	private static Env instance; 
	public static Env getInstance() {  
		if (instance!= null) {   
			return instance;
		} else {  
			makeInstance();   
			return instance;  } }//这个是同步方法 
	private static synchronized void makeInstance() {  
		if (instance == null) {   
			instance = new Env();  
			} 
		}//加载属性文件 
	private Env(){  
		InputStream is=getClass().getResourceAsStream("/sms.properties");  
		try{   
			load(is);  
		}catch(Exception e){   
			System.out.println("错误:没有读取属性文件");  
			} 
		}
	}
