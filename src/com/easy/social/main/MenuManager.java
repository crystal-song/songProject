package com.easy.social.main;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.easy.social.req.bean.Token;
import com.easy.social.util.CommonUtil;
import com.easy.social.util.MenuUtil;
import com.easy.social.widget.Button;
import com.easy.social.widget.ClickButton;
import com.easy.social.widget.ComplexButton;
import com.easy.social.widget.Menu;
import com.easy.social.widget.ViewButton;
import com.mftour.spring.util.File;
import com.mftour.spring.util.ReadWirtePropertis;

/**
 * 菜单管理器类
 */
public class MenuManager {
	private static Logger log = LoggerFactory.getLogger(MenuManager.class);
	private static final File f = ReadWirtePropertis.file();
	/**
	 * 定义菜单结构
	 * 
	 * @return
	 */
	private static Menu getMenu() {
		ViewButton btn11 = new ViewButton();
		btn11.setName("绑定账户");
		btn11.setType("view");
		btn11.setUrl(CommonUtil.OAuth2Url(f.getAppId(), f.getWeixinCallHost()+"/m/getCode", "binding"));
		//btn11.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid="+f.getAppId()+"&redirect_uri="+f.getWeixinCallHost()+"/m/getCode&response_type=code&scope=snsapi_base&state=binding#wechat_redirect");
		ViewButton btn12= new ViewButton();
		btn12.setName("账户资产");
		btn12.setType("view");
		btn12.setUrl(CommonUtil.OAuth2Url(f.getAppId(), f.getWeixinCallHost()+"/m/getCode?path=/m/service", "123"));
		//btn12.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid="+f.getAppId()+"&redirect_uri="+f.getWeixinCallHost()+"/m/getCode?path=/gate/service&response_type=code&scope=snsapi_base&state=123#wechat_redirect");
		ViewButton btn13 = new ViewButton();
		btn13.setName("投资记录");
		btn13.setType("view");
		btn13.setUrl("http://www.ptobchina.com");
		ViewButton btn14 = new ViewButton();
		btn14.setName("返息记录");
		btn14.setType("view");
		btn14.setUrl("http://www.ptobchina.com");
		ViewButton btn15 = new ViewButton();
		btn15.setName("交易记录");
		btn15.setType("view");
		btn15.setUrl("http://www.ptobchina.com");
		ComplexButton mainBtn1 = new ComplexButton();
		mainBtn1.setName("我的账户");
		mainBtn1.setSub_button(new Button[] { btn11,btn12,btn13,btn14,btn15 });
		ViewButton btn21 = new ViewButton();
		btn21.setName("投资热点");
		btn21.setType("view");
		btn21.setUrl("http://www.ptobchina.com");
		ClickButton btn31 = new ClickButton();
		btn31.setName("新闻公告");
		btn31.setType("click");
		btn31.setKey("news");
		Menu menu = new Menu();
		menu.setButton(new Button[] { mainBtn1 ,btn21,btn31});

		return menu;
	}

	public static void main(String[] args) {
		// 第三方用户唯一凭证
		String appId = f.getAppId();
		// 第三方用户唯一凭证密钥
		String appSecret = f.getAppSecret();

		// 调用接口获取凭证
		Token token = CommonUtil.getToken(appId, appSecret);

		if (null != token) {
			// 创建菜单
			boolean result = MenuUtil.createMenu(getMenu(), token.getAccessToken());

			// 判断菜单创建结果
			if (result)
				log.info("菜单创建成功！");
			else
				log.info("菜单创建失败！");
		}
	}
}
