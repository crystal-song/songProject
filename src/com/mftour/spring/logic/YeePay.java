package com.mftour.spring.logic;

import java.io.ByteArrayInputStream;

import com.mftour.spring.base.JsonBaseBean;
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
	public static boolean doLoan(int product) throws Exception {
		{


		String pfx = f.getYeepayCfaFile();
		String requestNo = UUID.randomUUID().toString();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", "19");
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
				String res = rest.postRestful("/rest/yeepay/create", map);
				JsonBaseBean rr = JSON.parseObject(res, JsonBaseBean.class);
				if (rr.isSuccess()){

					HttpClientTest d = new HttpClientTest();
					String resp = d.postForm("LOAN", f.getOnSubmit()+"/bhaexter/bhaController", s,
							SignUtil.sign(s, pfx, "liukai123"));


					Map<String, Object> mm = Xml.Dom2Map(resp);
					if(mm.get("code").equals("1")){

						String updateRes = rest.postRestful("/rest/yeepay/update-success", map);
						JsonBaseBean updateReturn = JSON.parseObject(s, JsonBaseBean.class);
						if (updateReturn.isSuccess()){
							return true;
						}else{

							return false;
						}
					}else{
						return false;
					}

				}else{
					return false;
				}



		}else{
			return false;
		}
	}}
}
	
		

