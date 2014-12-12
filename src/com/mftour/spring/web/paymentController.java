package com.mftour.spring.web;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/payment")
public class paymentController {

	public static void testPost(String urlStr) {
		
		try {
			URL url = new URL(urlStr);
			URLConnection con = url.openConnection();
			con.setDoOutput(true);
			con.setRequestProperty("Pragma:", "no-cache");
			con.setRequestProperty("Cache-Control", "no-cache");
			con.setRequestProperty("Content-Type", "text/xml");

			OutputStreamWriter out = new OutputStreamWriter(
					con.getOutputStream());
			String xmlInfo = getXmlInfo();
		
			out.write(new String(xmlInfo.getBytes("UTF-8")));
			out.flush();
			out.close();
			BufferedReader br = new BufferedReader(new InputStreamReader(
					con.getInputStream()));
			String line = "";
			for (line = br.readLine(); line != null; line = br.readLine()) {
				System.out.println(line);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static String getXmlInfo() {
		StringBuilder sb = new StringBuilder();
		/*
		 * sb.append("<?xml version='1.0' encoding='UTF-8'?>");
		 * sb.append("<Message>"); sb.append(" <header>");
		 * sb.append("     <action>readMeetingStatus</action>");
		 * sb.append("     <service>meeting</service>");
		 * sb.append("     <type>xml</type>");
		 * sb.append("     <userName>admin</userName>");
		 * sb.append("     <password>admin</password>");
		 * sb.append("     <siteName>box</siteName>"); sb.append(" </header>");
		 * sb.append(" <body>"); sb.append("     <confKey>43283344</confKey>");
		 * sb.append(" </body>"); sb.append("</Message>");
		 */

		/*
		 * platformNo 商户编号 Y 商户在易宝唯一标识 platformUserNo 商户平台会员标识 Y 会员在商户平台唯一标识
		 * requestNo 请求流水号 Y nickName 昵称 N 交易查询时希望显示的会员名称，若不写则 与会员标识一致 realName
		 * 会员真实姓名 Y 会员真实姓名 idCardType 身份证类型 Y 【见身份证类型】 idCardNo 身份证号 Y 会员身份证号
		 * mobile 手机号 Y 接收短信验证码的手机号 email 邮箱 Y 邮箱 callbackUrl 页面回跳URL Y 页面回跳URL
		 * notifyUrl 服务器通知URL Y 服务器通知URL 2.1.2. 接口输出 参数
		 */

		sb.append("<?xml version='1.0' encoding='UTF-8' standalone='yes'?>");
		/* sb.append("<request platformNo='10012415118'>"); */
		sb.append("<request platformNo='10040011137'>");
		sb.append(" <platformUserNo>sdfdfsdfsdfd<platformUserNo>");
		sb.append("     <requestNo>1234<requestNo>");
		sb.append("     <idCardType>G2_IDCARD<idCardType>");
		sb.append("     <idCardNo>430702198909061591<idCardNo>");
		sb.append("     <mobile>18975601645<mobile>");
		sb.append("     <email>459384843@qq.com<email>");
		sb.append("     <callbackUrl>user<callbackUrl>");
		sb.append("     <notifyUrl>user<notifyUrl>");
		sb.append("     </request>");

		return sb.toString();
	}

	public static void main(String[] args) {
		String urlStr = "http://qa.yeepay.com/member/bha/toRegister";
		/* String urlStr="https://member.yeepay.com/member/bha/toRegister"; */
		testPost(urlStr);

	}
}
