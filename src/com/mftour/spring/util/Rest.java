package com.mftour.spring.util;

import java.util.Map;

import com.mftour.spring.base.Base;

import org.springframework.web.client.RestTemplate;
public class Rest extends Base{
	
	
	private  RestTemplate restTemplate = new RestTemplate();
	//获取restful资源get
	public String getRestful(String url){
		try{
			return restTemplate.getForObject(this.getF().getRestHost()+url, String.class);
		}
		catch(Exception e){
			this.getLogger().error(e.getMessage());
			return "{success:false}";
		}
	}
	//获取restful资源
		public String postRestful(String url, Map<String, Object> map){
			try{
				return restTemplate.postForObject(this.getF().getRestHost()+url,map, String.class);
			}
			catch(Exception e){
				this.getLogger().error(e.getMessage());
				return "{success:false}";
			}
		}
}

