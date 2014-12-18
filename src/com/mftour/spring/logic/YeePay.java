package com.mftour.spring.logic;

import java.io.ByteArrayInputStream;
import java.io.InputStream;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;

import com.alibaba.fastjson.JSON;
import com.mftour.spring.util.File;
import com.mftour.spring.util.HttpClientTest;
import com.mftour.spring.util.ReadWirtePropertis;
import com.mftour.spring.util.Rest;
import com.yeepay.g3.utils.security.cfca.SignUtil;
import com.mftour.spring.rest.bean.Response;
public class YeePay {
	private static final File f = ReadWirtePropertis.file();
	private static final Logger logger = LoggerFactory
			.getLogger(YeePay.class);
  
	private Rest rest = new Rest();
	public boolean doLoan(int product) {
		
		
		String pfx = f.getYeepayCfaFile();
		
		
		String s = rest.getRestful("/rest/yeepay/xml/generate-do-loan-xml.json");
		Response r = JSON.parseObject(s, Response.class);
		if (r.isSuccess()){
		
			try {
				s = r.getResponse().replaceAll("[\\r\\n]", "");
				HttpClientTest d = new HttpClientTest();
				String resp = d.postForm("LOAN", f.getOnSubmit()+"/bhaexter/bhaController", s,
						SignUtil.sign(s, pfx, "liukai123"));
				DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
				DocumentBuilder db = dbf.newDocumentBuilder();

				InputStream iStream = new ByteArrayInputStream(
						resp.getBytes("UTF-8"));
				Document dm = db.parse(iStream);

				NodeList persons = dm.getElementsByTagName("code");
				String updateResult = rest.getRestful("/rest/account/update-loan.json");
				Response resultjson = JSON.parseObject(updateResult, Response.class);
				logger.info("get", persons);

				if(resultjson.isSuccess()){
					return true;
				}else{
					return false;
				}


			} catch (Exception e) {
				// TODO: handle exception
				logger.info(e.getMessage());
				return false;
			}
		}else{
			return false;
		}
	
		

	}

}