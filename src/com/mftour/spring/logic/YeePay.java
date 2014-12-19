package com.mftour.spring.logic;

import java.io.ByteArrayInputStream;
import org.dom4j.Document;  
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.fastjson.JSON;
import com.mftour.spring.util.File;
import com.mftour.spring.util.HttpClientTest;
import com.mftour.spring.util.ReadWirtePropertis;
import com.mftour.spring.util.Rest;
import com.mftour.spring.util.Xml;
import java.util.UUID;
import com.yeepay.g3.utils.security.cfca.SignUtil;
import com.mftour.spring.rest.bean.Response;
public class YeePay {
	private static final File f = ReadWirtePropertis.file();
	private static final Logger logger = LoggerFactory
			.getLogger(YeePay.class);
  
	private static Rest rest = new Rest();
	public static boolean doLoan(int product) {
		
		
		String pfx = f.getYeepayCfaFile();
		String requestNo = UUID.randomUUID().toString();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", "19");
		map.put("notifyurl", "/gate/loanNotify");
		map.put("requestno", requestNo);
		String s = rest.postRestful("/rest/yeepay/xml/generate-do-loan-xml", map);
		Response r = JSON.parseObject(s, Response.class);
		if (r.isSuccess()){
			try {
				s = r.getResponse().replaceAll("[\\r\\n]", "");
				HttpClientTest d = new HttpClientTest();
				String resp = d.postForm("LOAN", f.getOnSubmit()+"/bhaexter/bhaController", s,
						SignUtil.sign(s, pfx, "liukai123"));

		        Map<String, Object> m = Xml.Dom2Map(resp); 
		        if(m.get("code").equals("1")){
		        	
		        }else{
		            logger.error("error loan "+ m.get("description"));
		        	return false;
		        }
				String updateResult = rest.getRestful("/rest/account/update-loan/");
				Response resultjson = JSON.parseObject(updateResult, Response.class);
				if(resultjson.isSuccess()){
					return true;
				}else{
					return false;
				}


			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				logger.info(e.getMessage());
				return false;
			}
		}else{
			return false;
		}
	
		

	}

}