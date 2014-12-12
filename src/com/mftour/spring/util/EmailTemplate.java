package com.mftour.spring.util;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import com.mftour.spring.model.TUser;

public class EmailTemplate {
			
	
			public  static void SendMail(TUser user,String resetPassHref,String operate,String title){
				try{
				String htmlContent = "亲爱的用户"
						+ user.getName()
						+ "，您好，<br/><br/>"
						+ "您在"
						+ new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.format(new Date())
				+ operate+"：<br/><br/>"
				+ "<a href="
				+ resetPassHref
				+ "><font color='green'>"+resetPassHref+"</font></a><br/><br/>"
				+ "(如果无法点击该URL链接地址，请将它复制并粘帖到浏览器的地址输入框，然后单击回车即可。)<br/><br/>"
				+ "(该链接在24小时内有效，24小时后请重新获取。)<br/><br/>"
				+ "中租宝   <a href='http://www.ptobchina.com/'><font color='green'>http://www.ptobchina.com/</font></a>"
				+ "<br/><br/>" + "此为自动发送邮件，请勿直接回复！";
				 String url = "https://sendcloud.sohu.com/webapi/mail.send.xml";
			        HttpClient httpclient = new DefaultHttpClient();
			        HttpPost httpost = new HttpPost(url);

			        List nvps = new ArrayList();
			        nvps.add(new BasicNameValuePair("api_user", "ptobchina_test_U1BqG6")); //# 使用api_user和api_key进行验证
			        nvps.add(new BasicNameValuePair("api_key", "xkP8cQXYryMAyKBe"));
			        nvps.add(new BasicNameValuePair("from", "cs@ptobchina.com")); //# 发信人，用正确邮件地址替代
			        nvps.add(new BasicNameValuePair("to", user.getEmail()));// # 收件人地址，用正确邮件地址替代，多个地址用';'分隔
			        nvps.add(new BasicNameValuePair("subject", title));
			        nvps.add(new BasicNameValuePair("html",htmlContent ));
			        httpost.setEntity(new UrlEncodedFormEntity(nvps, "UTF-8"));

			        HttpResponse response = httpclient.execute(httpost);

			        if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) { // 正常返回
			            System.out.println(EntityUtils.toString(response.getEntity()));
			        } else {
			            System.err.println("error");
			        }

		        } catch (Exception e) {
					e.printStackTrace();
				}

			}

}
