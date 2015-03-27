package com.easy.social.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.easy.social.resp.bean.Article;
import com.easy.social.resp.bean.ArticleMessage;
import com.easy.social.resp.bean.TextMessage;
import com.easy.social.util.MessageUtil;
import com.mftour.spring.util.File;
import com.mftour.spring.util.ReadWirtePropertis;

/**
 * 核心服务类
 
 */
public class CoreService {
	/**
	 * 处理微信发来的请求
	 * 
	 * @param request
	 * @return xml
	 */
	private static final File f = ReadWirtePropertis.file();
	public static String processRequest(HttpServletRequest request) {
		// xml格式的消息数据
		String respXml = null;
		// 默认返回的文本消息内容
		String respContent = "未知的消息类型！";
		try {
			// 调用parseXml方法解析请求消息
			Map<String, String> requestMap = MessageUtil.parseXml(request);
			// 发送方帐号
			String fromUserName = requestMap.get("FromUserName");
			request.getSession().setAttribute("openId", fromUserName);
			// 开发者微信号
			String toUserName = requestMap.get("ToUserName");
			// 消息类型
			String msgType = requestMap.get("MsgType");

			TextMessage textMessage = new TextMessage();
			textMessage.setToUserName(fromUserName);
			textMessage.setFromUserName(toUserName);
			textMessage.setCreateTime(new Date().getTime());
			textMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_TEXT);
			// 文本消息
			if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_TEXT)) {
				respContent = "您发送的是文本消息！";
				// 设置文本消息的内容
				textMessage.setContent(respContent);
				// 将消息对象转换成xml
				respXml = MessageUtil.messageToXml(textMessage);
			}
			// 图片消息
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_IMAGE)) {
				respContent = "您发送的是图片消息！";
				// 设置文本消息的内容
				textMessage.setContent(respContent);
				// 将消息对象转换成xml
				respXml = MessageUtil.messageToXml(textMessage);
			}
			// 语音消息
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_VOICE)) {
				respContent = "您发送的是语音消息！";
				// 设置文本消息的内容
				textMessage.setContent(respContent);
				// 将消息对象转换成xml
				respXml = MessageUtil.messageToXml(textMessage);
			}
			// 视频消息
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_VIDEO)) {
				respContent = "您发送的是视频消息！";
				// 设置文本消息的内容
				textMessage.setContent(respContent);
				// 将消息对象转换成xml
				respXml = MessageUtil.messageToXml(textMessage);
			}
			// 地理位置消息
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_LOCATION)) {
				respContent = "您发送的是地理位置消息！";
				// 设置文本消息的内容
				textMessage.setContent(respContent);
				// 将消息对象转换成xml
				respXml = MessageUtil.messageToXml(textMessage);
			}
			// 链接消息
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_LINK)) {
				respContent = "您发送的是链接消息！";
				// 设置文本消息的内容
				textMessage.setContent(respContent);
				// 将消息对象转换成xml
				respXml = MessageUtil.messageToXml(textMessage);
			}
			//事件推送
			else if(msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_EVENT)) {
					// 事件类型
					String eventType = requestMap.get("Event");
					// 订阅
					if (eventType.equals(MessageUtil.EVENT_TYPE_SUBSCRIBE)) {
						textMessage
								.setContent("您好，欢迎关注中租宝！体验生活，从这里开始！");
						// 将消息对象转换成xml
						respXml = MessageUtil.messageToXml(textMessage);
					}
					// 取消订阅
					else if (eventType.equals(MessageUtil.EVENT_TYPE_UNSUBSCRIBE)) {
						// TODO 暂不做处理
					}
					// 自定义菜单点击事件
					else if (eventType.equals(MessageUtil.EVENT_TYPE_CLICK)) {
						// 事件KEY值，与创建菜单时的key值对应
						String eventKey = requestMap.get("EventKey");
						// 根据key值判断用户点击的按钮
						if (eventKey.equals("news")) {
							Article article = new Article();
							article.setTitle("中租宝新闻公告");
							article.setDescription("为了更好的能为广大客户服务，我公司坚持“智谋优秀、财力归集、名闻海内、成就大业”的 企业愿景，坚守“诚信、务实、负责”的企业精神，牢记对社会负责、对股东负责、对客户负责、对员工负责、对企业自身负责的企业使命和社会责任，以投资领域 的需求为基础，以公司的服务水平和自身实力为保障，让公司快速健康发展，为客户高效便捷的提供服务。");
							article.setPicUrl("http://1.star530.sinaapp.com/weather.jpg");
							article.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid="+f.getAppId()+"&redirect_uri="+f.getWeixinCallHost()+"/m/getCode?path=/account/liquan&response_type=code&scope=snsapi_base&state={page:1,catlog:0}#wechat_redirect");
							List<Article> articleList = new ArrayList<Article>();
							articleList.add(article);
							// 创建图文消息
							ArticleMessage newsMessage = new ArticleMessage();
							newsMessage.setToUserName(fromUserName);
							newsMessage.setFromUserName(toUserName);
							newsMessage.setCreateTime(new Date().getTime());
							newsMessage
									.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
							newsMessage.setArticleCount(articleList.size());
							newsMessage.setArticles(articleList);
							respXml = MessageUtil.messageToXml(newsMessage);
						}
					}
				}else{
					textMessage
					.setContent("http://www.ptobchina.com");
			respXml = MessageUtil.messageToXml(textMessage);
				}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return respXml;
	}
}
