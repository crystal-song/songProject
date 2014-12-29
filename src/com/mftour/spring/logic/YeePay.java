package com.mftour.spring.logic;

import java.io.ByteArrayInputStream;

import com.mftour.spring.base.JsonBaseBean;
import com.mftour.spring.rest.bean.YeepayAccountInfo;
import org.dom4j.Document;
import java.io.InputStream;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.Map;

import javax.xml.bind.JAXB;
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
	public static boolean doLoan(int product, String enterpriceNumber) throws Exception {
		{


		String pfx = f.getYeepayCfaFile();
		String requestNo = UUID.randomUUID().toString();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", product);
		map.put("notifyurl", "/gate/loanNotify");

		map.put("requestno", requestNo);
		String s = rest.postRestful("/rest/yeepay/xml/generate-do-loan-xml", map);
		Response r = JSON.parseObject(s, Response.class);
		if (r.isSuccess()){

				s = r.getResponse().replaceAll("[\\r\\n]", "");
				Rest rest = new Rest();

				Map<String, Object> m = new HashMap<String, Object>();
				m.put("request-no", requestNo);
				m.put("service", "LOAN");
				m.put("request-xml", s);
				m.put("project-id", enterpriceNumber);
				String res = rest.postRestful("/rest/yeepay/create", m);
				JsonBaseBean rr = JSON.parseObject(res, JsonBaseBean.class);
				if (rr.isSuccess()){

					HttpClientTest d = new HttpClientTest();
					String resp = d.postForm("LOAN", f.getOnSubmit()+"/bhaexter/bhaController", s,
							SignUtil.sign(s, pfx, "liukai123"));


					Map<String, Object> mm = Xml.Dom2Map(resp);

					Map<String, Object> mapResp = new HashMap<String, Object>();
					mapResp.put("request-no", requestNo);
					mapResp.put("service", "LOAN");
					mapResp.put("code", mm.get("code"));
					mapResp.put("response-xml", resp);
					if(mm.get("code").equals("1")){

						String updateRes = rest.postRestful("/rest/yeepay/update-success", mapResp);
						JsonBaseBean updateReturn = JSON.parseObject(updateRes, JsonBaseBean.class);
						if (updateReturn.isSuccess()){
							return true;
						}else{

							return false;
						}
					}else{

						String updateRes = rest.postRestful("/rest/yeepay/update-error", mapResp);
						JsonBaseBean updateReturn = JSON.parseObject(s, JsonBaseBean.class);
						return false;
					}

				}else{
					return false;
				}



		}else{
			return false;
		}
	}}

	public static YeepayAccountInfo getAccountInfo(String username) throws Exception {
		{
			try{


				YeepayAccountInfo accountInfo = new YeepayAccountInfo();

				String pfx = f.getYeepayCfaFile();
				String s = "<?xml version='1.0' encoding='UTF-8' standalone='yes'?>"
						+"<request platformNo='"+f.getPlatformNo()+"'>"
						+"<platformUserNo>"+username+"</platformUserNo> "
						+"</request>";;
				s = s.replaceAll("[\\r\\n]", "");


				HttpClientTest d = new HttpClientTest();
				String resp = d.postForm("ACCOUNT_INFO", f.getOnSubmit()+"/bhaexter/bhaController", s,
						SignUtil.sign(s, pfx, "liukai123"));

				Map<String, Object> mm = Xml.Dom2Map(resp);
				accountInfo.setCode(mm.get("code").toString());
				accountInfo.setBank(mm.get("bank").toString());
				accountInfo.setCardStatus(mm.get("cardStatus").toString());
				accountInfo.setCardNo(mm.get("cardNo").toString());
				return  accountInfo;
			}catch(Exception e){
				return new YeepayAccountInfo();
			}
		}
	}
}
	
		

