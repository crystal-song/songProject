
package com.mftour.spring.util;
 
//import java.io.FileInputStream;
//import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
//import java.net.URL;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ReadWirtePropertis {
	private static  Logger logger = LoggerFactory
			.getLogger(ReadWirtePropertis.class);
	public static File file() {
		Properties pro = new Properties();

		InputStream path = Thread.currentThread().getContextClassLoader()
				.getResourceAsStream("configuration.properties");

		try {

			pro.load(path);

			File f = new File();
			f.setPlatformNo(pro.getProperty("platformNo"));
			f.setCallbackUrl(pro.getProperty("callbackUrl"));
			f.setNotifyUrl(pro.getProperty("notifyUrl"));
			f.setUrl(pro.getProperty("url"));
			f.setOnSubmit(pro.getProperty("onSubmit"));
			f.setBasePath(pro.getProperty("basePath"));
			f.setRestHost(pro.getProperty("restHost"));
			f.setYeepayCfaFile(pro.getProperty("yeepayCfaFile"));
			f.setRestOutHost(pro.getProperty("restOutHost"));
			f.setWeixinCallHost(pro.getProperty("weixinCallHost"));
			f.setAppId(pro.getProperty("appId"));
			f.setAppSecret(pro.getProperty("appSecret"));
			return f;
		} catch (IOException e) {
		
			logger.error(e.getMessage());;
		}
		
		return null;
	}
}