<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

 <%@ include file="/includes/taglibs.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户中心页面</title>
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>  
<script type="text/javascript">
    var navIndex=3;    
    $(document).ready(function(){
    	$('.select_nav a').click(function(){
    		$(this).siblings().slideToggle('slow')
    		}
    	);
    	$(function(){
    		var num=0;
    		var timer=null;
    		timer=setInterval(function(){
    			num++;
    			$('.red_bar').css('width',num);
    			var zi=$('.view strong').text();
    			if(zi=='低' && num==40){
    				clearInterval(timer)	
    			}
    			if(zi=='中' && num==80){
    				clearInterval(timer)	
    			}
    			if(zi=='高' && num==120){
    				clearInterval(timer)			
    			}
    		},20)

    		$('.sec li').mouseover(function(e){
    			$(this).addClass('bac_org').siblings().removeClass('bac_org');
    			});
    	    });	
    		$('.msg_nav').eq(1).mouseover(function(e){
    			$('.bac_change_1').css('background-image','url("<%=path%>/img/tubiao10.png")');
    			
    			}).mouseout(function(e){
    			$('.bac_change_1').css('background-image','url("<%=path%>/img/tubiao9.png")');   			
    			});
    		$('.msg_nav').eq(2).mouseover(function(e){
    			$('.bac_change_2').css('background-image','url("<%=path%>/img/tubiao11.png")');
    			
    			}).mouseout(function(e){
    			$('.bac_change_2').css('background-image','url("<%=path%>/img/tubiao12.png")');
    			
    			});	
    		
    		$('.msg_nav').eq(3).mouseover(function(e){
    			$('.bac_change_3').css('background-image','url("<%=path%>/img/tubiao2.png")');
    			
    			}).mouseout(function(e){
    			$('.bac_change_3').css('background-image','url("<%=path%>/img/tubiao3.png")');
    			
    			});	
    	
    	
         $(".ren_right").click(function(){
             var a=$(this).parent().parent().children('.yincang').slideToggle();        
        	 var text=$(this).text()

        	 if(text=="认证"){
        		 $(this).text("取消认证")
        	 }else if(text=="取消认证"){
        	     $(this).text("认证")
        	 }else if(text=="验证"){
        		 $(this).text("取消验证")
        	 }else if(text=="取消验证"){     		 
        		 $(this).text("验证")    		 
        	 }else if(text=="修改"){
        		 $(this).text("取消修改")
        	 }else if(text=="取消修改"){     		 
        		 $(this).text("修改")	 
        	 }else if(text=="设置"){
        		 $(this).text("取消设置")
        	 }else if(text=="取消设置"){     		 
        		 $(this).text("设置")
        		 
        	 } 
         });
         
    	   	 
         $('.aa').click(function(){
        	 var aa_text=$('.aa').text();   
             if(aa_text=="采用上传认证"){
            	 $('.hide_car').css("display","block")
            	 $('.aa').text('采用接口认证');
             }else if(aa_text=="采用接口认证"){
            	 $('.hide_car').css("display","none")
            	 $('.aa').text('采用上传认证');
            	 
             }
         })
         
         
         
});
        
</script>

<script language="javascript" type="text/javascript">  
provinceArray = new Array("北京市","上海市","天津市","重庆市","河北省","山西省","内蒙古自治区","辽宁省","吉林省","黑龙江省","江苏省","浙江省","安徽省","福建省","江西省","山东省","河南省","湖北省","湖南省","广东省","广西壮族自治区","海南省","四川省","贵州省","云南省","西藏自治区","陕西省","甘肃省","宁夏回族自治区","青海省","新疆维吾尔族自治区","香港特别行政区","澳门特别行政区","台湾省","其它");  
  
//定义 城市 数据数组  
cityArray = new Array();   
cityArray[0] = new Array("北京市","东城|西城|崇文|宣武|朝阳|丰台|石景山|海淀|门头沟|房山|通州|顺义|昌平|大兴|平谷|怀柔|密云|延庆");   
cityArray[1] = new Array("上海市","黄浦|卢湾|徐汇|长宁|静安|普陀|闸北|虹口|杨浦|闵行|宝山|嘉定|浦东|金山|松江|青浦|南汇|奉贤|崇明");   
cityArray[2] = new Array("天津市","和平|东丽|河东|西青|河西|津南|南开|北辰|河北|武清|红挢|塘沽|汉沽|大港|宁河|静海|宝坻|蓟县");   
cityArray[3] = new Array("重庆市","万州|涪陵|渝中|大渡口|江北|沙坪坝|九龙坡|南岸|北碚|万盛|双挢|渝北|巴南|黔江|长寿|綦江|潼南|铜梁 |大足|荣昌|壁山|梁平|城口|丰都|垫江|武隆|忠县|开县|云阳|奉节|巫山|巫溪|石柱|秀山|酉阳|彭水|江津|合川|永川|南川");   
cityArray[4] = new Array("河北省","石家庄|邯郸|邢台|保定|张家口|承德|廊坊|唐山|秦皇岛|沧州|衡水");   
cityArray[5] = new Array("山西省","太原|大同|阳泉|长治|晋城|朔州|吕梁|忻州|晋中|临汾|运城");   
cityArray[6] = new Array("内蒙古自治区","呼和浩特|包头|乌海|赤峰|呼伦贝尔盟|阿拉善盟|哲里木盟|兴安盟|乌兰察布盟|锡林郭勒盟|巴彦淖尔盟|伊克昭盟");   
cityArray[7] = new Array("辽宁省","沈阳|大连|鞍山|抚顺|本溪|丹东|锦州|营口|阜新|辽阳|盘锦|铁岭|朝阳|葫芦岛");   
cityArray[8] = new Array("吉林省","长春|吉林|四平|辽源|通化|白山|松原|白城|延边");   
cityArray[9] = new Array("黑龙江省","哈尔滨|齐齐哈尔|牡丹江|佳木斯|大庆|绥化|鹤岗|鸡西|黑河|双鸭山|伊春|七台河|大兴安岭");   
cityArray[10] = new Array("江苏省","南京|镇江|苏州|南通|扬州|盐城|徐州|连云港|常州|无锡|宿迁|泰州|淮安");   
cityArray[11] = new Array("浙江省","杭州|宁波|温州|嘉兴|湖州|绍兴|金华|衢州|舟山|台州|丽水");   
cityArray[12] = new Array("安徽省","合肥|芜湖|蚌埠|马鞍山|淮北|铜陵|安庆|黄山|滁州|宿州|池州|淮南|巢湖|阜阳|六安|宣城|亳州");   
cityArray[13] = new Array("福建省","福州|厦门|莆田|三明|泉州|漳州|南平|龙岩|宁德");   
cityArray[14] = new Array("江西省","南昌市|景德镇|九江|鹰潭|萍乡|新馀|赣州|吉安|宜春|抚州|上饶");   
cityArray[15] = new Array("山东省","济南|青岛|淄博|枣庄|东营|烟台|潍坊|济宁|泰安|威海|日照|莱芜|临沂|德州|聊城|滨州|菏泽");   
cityArray[16] = new Array("河南省","郑州|开封|洛阳|平顶山|安阳|鹤壁|新乡|焦作|濮阳|许昌|漯河|三门峡|南阳|商丘|信阳|周口|驻马店|济源");   
cityArray[17] = new Array("湖北省","武汉|宜昌|荆州|襄樊|黄石|荆门|黄冈|十堰|恩施|潜江|天门|仙桃|随州|咸宁|孝感|鄂州");  
cityArray[18] = new Array("湖南省","长沙|常德|株洲|湘潭|衡阳|岳阳|邵阳|益阳|娄底|怀化|郴州|永州|湘西|张家界");   
cityArray[19] = new Array("广东省","广州|深圳|珠海|汕头|东莞|中山|佛山|韶关|江门|湛江|茂名|肇庆|惠州|梅州|汕尾|河源|阳江|清远|潮州|揭阳|云浮");   
cityArray[20] = new Array("广西壮族自治区","南宁|柳州|桂林|梧州|北海|防城港|钦州|贵港|玉林|南宁地区|柳州地区|贺州|百色|河池");   
cityArray[21] = new Array("海南省","海口|三亚");   
cityArray[22] = new Array("四川省","成都|绵阳|德阳|自贡|攀枝花|广元|内江|乐山|南充|宜宾|广安|达川|雅安|眉山|甘孜|凉山|泸州");   
cityArray[23] = new Array("贵州省","贵阳|六盘水|遵义|安顺|铜仁|黔西南|毕节|黔东南|黔南");   
cityArray[24] = new Array("云南省","昆明|大理|曲靖|玉溪|昭通|楚雄|红河|文山|思茅|西双版纳|保山|德宏|丽江|怒江|迪庆|临沧");  
cityArray[25] = new Array("西藏自治区","拉萨|日喀则|山南|林芝|昌都|阿里|那曲");   
cityArray[26] = new Array("陕西省","西安|宝鸡|咸阳|铜川|渭南|延安|榆林|汉中|安康|商洛");   
cityArray[27] = new Array("甘肃省","兰州|嘉峪关|金昌|白银|天水|酒泉|张掖|武威|定西|陇南|平凉|庆阳|临夏|甘南");   
cityArray[28] = new Array("宁夏回族自治区","银川|石嘴山|吴忠|固原");   
cityArray[29] = new Array("青海省","西宁|海东|海南|海北|黄南|玉树|果洛|海西");   
cityArray[30] = new Array("新疆维吾尔族自治区","乌鲁木齐|石河子|克拉玛依|伊犁|巴音郭勒|昌吉|克孜勒苏柯尔克孜|博尔塔拉|吐鲁番|哈密|喀什|和田|阿克苏");   
cityArray[31] = new Array("香港特别行政区","香港特别行政区");   
cityArray[32] = new Array("澳门特别行政区","澳门特别行政区");   
cityArray[33] = new Array("台湾省","台北|高雄|台中|台南|屏东|南投|云林|新竹|彰化|苗栗|嘉义|花莲|桃园|宜兰|基隆|台东|金门|马祖|澎湖");   
cityArray[34] = new Array("其它","北美洲|南美洲|亚洲|非洲|欧洲|大洋洲");  
  
function initProvince(){  
document.all.selProvince.length = 0 ;   
for(i=0; i<provinceArray.length; i++){  
   document.all.selProvince.options[i] = new Option(provinceArray[i],provinceArray[i]);  
}  
getCity(document.all.selProvince.options[0].value)  
}  
  
function getCity(currProvince)  
{  
    //当前 所选择 的 省  
    var currProvincecurrProvince = currProvince;  
    var i,j,k;  
    //清空 城市 下拉选单  
    document.all.selCity.length = 0 ;   
    for (i = 0 ;i <cityArray.length;i++)  
      {     
          //得到 当前省 在 城市数组中的位置  
          if(cityArray[i][0]==currProvince)  
            {     
                //得到 当前省 所辖制的 地市  
                tmpcityArray = cityArray[i][1].split("|")  
                  for(j=0;j<tmpcityArray.length;j++)  
                  {  
                    //填充 城市 下拉选单  
                    document.all.selCity.options[document.all.selCity.length] = new Option(tmpcityArray[j],tmpcityArray[j]);   
                  }  
            }   
      }   
}  
</script>











</head>

<body onload="initProvince()">
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->
<div class="clear"></div>
<div class="one"></div>
<div class="clear_height"></div>
<div class="msg_con">
   <div class="msg_left">
       <div class="msg_left_top">
           <div class="name">
                 <div class="pic">
                   <h3></h3>
                 </div>
                 <span><strong>liuxiaoyan..</strong></span>
           </div>
           <div class="left_btm">
                  <span class="sp1"><a href="#" title="您还未实名认证，请点击"></a></span>
                  <span class="sp2"><a href="#" title="您还未绑定手机，请点击"></a></span>
                  <span class="sp3"><a href="#" title="您还未验证邮箱，请点击"></a></span>
                  <span class="sp4"><a href="#" title="您还未设置支付密码，请点击"></a></span>
                  <span class="sp5"><a href="<%=path%>/anquanshezhi.jsp" title="您未注册易宝支付账号，点击注册"></a></span>         
           </div>
           <div class="loadbar">
             <div class="red_bar"></div>
           </div>
           <div class="view">
             <span>安全等级：<strong>低</strong></span>
             <a href="#">[提升]</a>
           </div>
       </div>
       <div class="msg_left_cent">
          <a class="msg_nav" href="<%=path%>/user-info.jsp">
               <i style="background:url(<%=path%>/img/tubiao5.png) no-repeat"></i>
               <span>账户主页</span>
          </a>
          <div class="select_nav">
              <a  class="msg_nav">
                <i class="bac_change_1"></i>
                <span>资产管理</span>
              </a>
              <ul style="display:block">
                  <li><a href="<%=path%>/zichan.jsp">资产统计</a></li>
                  <li><a href="<%=path%>/chongzhi.jsp">充值</a></li>
                  <li><a href="<%=path%>/tixian.jsp">提现</a></li>
              </ul>
          </div>
          <div class="select_nav">
              <a  class="msg_nav">
	              <i class="bac_change_2"></i>
	              <span>消息管理</span>
              </a>
              <ul style="display:none">
                  <li><a  href="<%=path%>/zhanneitongzhi.jsp">站内信息</a></li>                   
              </ul>
          </div>
          <div class="select_nav">
              <a class="msg_nav" style="margin-bottom: 0px;">
                  <i class="bac_change_3"></i>
                  <span>账户管理</span>
              </a>
              <ul style="display:none">
                  <li><a href="<%=path%>/user-info.jsp">个人信息</a></li>
                  <li><a href="<%=path%>/anquanshezhi.jsp">安全设置</a></li>
                  <li style="border-bottom:0"><a href="<%=path%>/tongzhishezhi.jsp">通知设置</a></li>
              </ul>
          </div>    
       </div>     
   </div>
   <div class="msg_right">
       <div class="msg_main">
           <div class="msg_title">
             <h2>提&nbsp;&nbsp;&nbsp;&nbsp;现</h2>
           </div>
           <div class="user_con02" >
             <p style="display:none">添加银行卡</p>
             <ul class="post_car" style="display:none">
             <li><span class="ti_wh">持卡人</span><span>aaa</span></li>
	         <li><span class="ti_wh">银行</span>
		             <span>
		               <select>
		                    <option value="300">工商银行</option>
							<option value="302">建设银行</option>
							<option value="303">农业银行</option>
							<option value="466">招商银行</option>
							<option value="517">邮政储蓄银行</option>
							<option value="469">民生银行</option>
							<option value="472">中信银行</option>
							<option value="467">平安银行</option>
							<option value="301">中国银行</option>
							<option value="463">交通银行</option>
							<option value="468">兴业银行</option>
							<option value="515">北京银行</option>
							<option value="473">光大银行</option>
							<option value="465">广东发展银行</option>
							<option value="471">上海浦发银行</option>
							<option value="470">华夏银行</option>
							<option value="516">北京农村商业银行</option>
		               </select>
		             </span>
	             </li>            
	             <li><span class="ti_wh">卡号</span><span><input type="text"></input></span></li>
	             <li><span class="ti_wh">开户城市</span>
	                 <span>
	                   <select name="province" id="selProvince" onChange = "getCity(this.options[this.selectedIndex].value)" class="choes_pro">  
                       </select>  
				       <select name="city" id="selCity" class="choes_pro" >  
				         <option>北京</option>  
				       </select>
	                 </span>     
	             </li>
	             <li><span class="ti_wh">开户行</span><span><input type="text" ></input></span></li>
             </ul>
             <div class="w_tishi" style="display:none">
             <p>温馨提示：为确保您的资金划转安全高效，爱投资建议您完善开户行信息。 您只需在分支行框内输入分支行关键词。</p>
             <p style="padding-left:70px">比如您的开户行名称为“工商银行北京宣武门支行”，只需输入关键词“宣武”即可。如果推荐列表中没有符合关键词的信息，</p>
             <p style="padding-left:70px">请您务必在列表中选择开户城市的银行分行，如：工商银行北京市分行营业部。</p>
             </div>
             <div class="btn_tijao" style="display:none">
               <input type="submit" value="添加" class="btn_bac"></input> <input type="reset" value="取消"></input>     
             </div> 
             <p class="jine">填写提现金额</p>
              <ul class="post_car">
	             <li><span class="ti_wh">可提现金额</span><span><strong>0.00</strong><i>元</i></span></li>
		         <li><span class="ti_wh">提现金额</span>
			         <span>
			              <input type="text"></input>
			         </span>
		         </li>            
		         <li><span class="ti_wh">手续费</span><span><strong>0.00</strong><i>元</i></span></li>
		         <li><span class="ti_wh">支付密码</span>
		             <span>设置支付密码后才可以提现哦~ </span>     
		         </li>
		         <li class="post_a"><span class="ti_wh">验证码</span>
		             <span><input type="text">
		                   </input>
		                   <a></a>
		             </span>
		         </li>
             </ul>
             <div class="btn_tijao">
               <a href="<%=path%>/chongzhicheck.jsp" class="btn_back_ti">提现</a>  
             </div>
             <div class="user_bottom01" style="height:350px">
			            <h3>温馨提示:</h3>
			            <ol>
			              <li>提现手续费收取说明及提现金额的先后顺序：
			                <ol type="a">
			                 <li>已付利息（免手续费）</li>
			                 <li>到期本金（免手续费）</li>
			                 <li>充值未投资金额（收取0.5%手续费）</li>
			                </ol>		  
			              </li>
			              <li>为了您的资金安全，请确保提现银行账号的姓名和您进行实名验证的姓名一致。 </li>       
			              <li>请确保您输入的是正确的储蓄卡账号，而非信用卡账号。</li>
			              <li>您确认提现后，我们将在1个工作日(国家节假日除外)之内将钱转入您网站上填写的银行账号。规则如下：
			                 <ol type="a">
			                 <li>每个工作日17:50之前的用户提现申请，将在下个工作日进行打款操作。</li>
			                 <li>17:50之后的提现申请将同下个工作日的申请一并处理。</li>
			                </ol>         
			               </li>
			              <li>提现过程遇到问题，请联系客服，400-600-4300 </li>
			            </ol>
               </div>
	       </div>              
	   </div>
	   </div>            
   </div>           
</div>
<div class="clear_height"></div>

<!-- links start -->
<%@ include file="/includes/links.jsp" %>
<!-- links end -->
<div class="clear"></div>
<!-- footer start -->
<%@ include file="/includes/footer.jsp" %>
<!-- footer end -->
</body>
</html>