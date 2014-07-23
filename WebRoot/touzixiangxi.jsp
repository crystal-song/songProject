<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>投资详细页面</title>
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
<!-- top start  -->
<%@ include file="/includes/header.jsp" %>
<!-- top end  -->
<div class="clear"></div>
<!-- banner start -->
<%@ include file="/includes/banner.jsp" %>
<!-- banner end  -->
<div class="clear"></div>
<div class="one"></div>
<div class="clear"></div>

<div class="xx">
	<div class="xx_fra">
    	<div class="xx_left">
        	<div class="xx_one">
            	<div class="xxo_bor">
                	<div class="xxo_left"><img src="<%=path%>/images/sy_64.jpg"></div>
                    <div class="xxo_right">
                    	<div class="xxo_one">
                        	<div class="xxo_font">项目名称：<span class="ckxq_red">${product1.projectName}</span></div>
                            <div class="xxo_font">企业编号：${product1.enterpriseNumber}</div>
                            <div class="xxo_font">信用等级：<img src="<%=path%>/images/xx_06.jpg"><span style="padding-left:160px;">分享到：<img src="<%=path%>/images/xx_09.jpg">&nbsp;<img src="<%=path%>/images/xx_11.jpg">&nbsp;<img src="<%=path%>/images/xx_13.jpg"></span></div>
                        </div>
                        <div class="xx_font">年化收益：<span class="ckxq_red1">${product1.yearIncome}</span>&nbsp;还款日期:<span class="ckxq_red1">${product1.repaymentTime}</span>&nbsp;还款方式：<span class="zi14">${product1.repaymentWay}</span></div>
                    </div>
                </div>
                <div class="clear"></div>
                <div class="tzxx">
                	<div class="tzxx_left">
                    	担保机构:<span class="cu">河南诺亚投资担保有限公司</span><br>
100%本息保障<br>
距离企业还款结项还有300天<br>
企业生产经营正常，还款正常
                    </div>
                    <div class="tzxx_right">
                    	融资金额:<span class="cu">${product1.financingMoney}万</span><br>
融资进度：<span class="cu">${product1.financingProgress}</span><br>
<img src="<%=path%>/images/sy_71.jpg"><br>
融资金额:<span class="cu hong">1000万</span><br>
融资进度：<span class="cu hong">1000万</span>
                    </div>
                </div>
            </div>
            <div class="clear_height"></div>
            <div class="wenzi">
            	<div class="wz_one">项目描述</div>
                <div class="wz_nr">${product1.companyProfile}</div>
                <div class="wz_one">担保机构简介及担保意见</div>
                <div class="wz_nr"><span class="cu">担保机构简介：</span>中鸿基融资担保有限公司成立于2009年7月，注册资本3亿元，并于2012年7月经北京市金融局审核，取得五年期《融资性担保机构经营许可证》。目前与农业银行、民生银行、浦发银行、兴业银行、南京银行、天津银行等多家银行保持着良好的合作关系，获得多家银行授信累计超过15亿元。 鉴于中鸿基担保在业内的快速发展、团队的业务能力及广泛影响力，交通银行、招商银行、中信银行、广发银行等银行已向中鸿基提出合作意向，相关的合作内容正在洽谈中。目前，"中鸿基"已成为北京担保业内的知名品牌。<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cu">担保机构意见：</span>借款企业为担保公司历史优质客户，企业及法人信用状况良好。企业近年度固定资产投入逐步加大，同时根据经营中新增订单状况了解，企业呈规模化快速发展上升趋势，企业订单增加量大，毛利率高，且融资渠道较为灵活，在落实各项反担保措施情况下能有效约束其还款意愿，故担保公司愿为本项目做担保。</div>
				<div class="wz_one">资金运转</div>
                <div class="wz_nr"><span class="cu">资金用途：</span>本次所需资金主要用于借款企业补充企业流动资金使用。借款企业业务规模较大，订单量逐年增加，对流动资金需求量较大。同时要预留部分流动资金以备后续经营不时之需。虽然企业自身准备了相应的资金，但仍需融资部分款项以作周转之用。<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cu">还款来源：</span>借款企业为担保公司历史优质客户，企业及法人信用状况良好。企业近年度固定资产投入逐步加大，同时根据经营中新增订单状况了解，企业呈规模化快速发展上升趋势，企业订单增加量大，毛利率高，且融资渠道较为灵活，在落实各项反担保措施情况下能有效约束其还款意愿，故担保公司愿为本项目做担保。</div>
				<div class="wz_one">风险控制措施</div>
                <div class="wz_nr"><span class="cu">担保机构：</span>中鸿基融资担保有限公司<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cu">抵押物信息：</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;1、 借款企业法定代表人夫妻无限连带责任；<br>
&nbsp;&nbsp;&nbsp;&nbsp;2、借款企业法定代表人亲属（1人）无限连带责任；<br>
&nbsp;&nbsp;&nbsp;&nbsp;3、北京市海淀区写字楼房产一套，建筑面积136.62平方米，产权清晰，抵押手续齐全；<br>
&nbsp;&nbsp;&nbsp;&nbsp;4、北京朝阳区商业住宅房产二套，一套建筑面积147.98平方，另一套建筑面积205.94平方米，该两套抵押物总评估值1450万，曾于北京某商业银行共计办理600万元的抵押贷款，截止目前借款企业还款记录良好，本项目为全余额抵押；<br>
&nbsp;&nbsp;&nbsp;&nbsp;5、借款企业法人股东提供100%股权质押；<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cu">风险控制措施：</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;北京海淀区房产位于中关村内，紧临三环路干线，地理位置优越，交通便利，紧邻地铁4号线人民大学站，门前有多条公交线路四通八达可直达各大城区。周边配套设施齐全，边上就是中关村科技会展中心、中电信息大厦、铸诚大厦、银海大厦等写字楼,办公气氛浓厚，为众多知名企业总部的办公地点，另外商场、超市、影城等生活设施也比较齐全。该套房产评估价值530万元。<br>
&nbsp;&nbsp;&nbsp;&nbsp;提供北京朝阳区的其中一套，位于亚运村商业中心，距离森林公园和国家奥林匹克公园很近，小区环境优美，绿化面积大。20余条公交线路分布在该小区周围，临近地铁5号线大屯站。该套房产建筑面积147.98平方米，评估价值600万元，另一套房产在亚运村附近，社区占地29733平方米，总建筑面积约 18万平方米，绿地面积10850平方米，小区绿化率达到40%。周边学校、医院、邮局、商场、银行、超市等配套设备齐全。该套房产建筑面积205.94平方米，评估价值850万元。两套房产在北京某银行贷款600万元，目前房产余值850万元。<br>
&nbsp;&nbsp;&nbsp;&nbsp;除此之外，质押借款企业法人股东100%股权，该企业主要从事阀门的进出口业务， 截止2014年4月底，企业总资产为1.1亿元，具有较强的实力。借款企业法定代表夫妻承担无限连带责任，该法人代表从事本行业多年，个人名誉度较高，承担较多社会职务及个人声誉，对自身信誉重视程度较高，同时增加亲属连带责任能有效约束其还款意愿。<br>
&nbsp;&nbsp;&nbsp;&nbsp;爱投资风控专员将在贷后严审该公司资金使用、经营管理及整体运作情况，及时向风险控制部门反馈相关信息。风控部门经过整理分析，根据具体情况制定贷后监管的实施方案，通过严格的贷后监管避免风险的发生。</div>
				<div class="wz_one">企业背景</div>
                <div class="wz_nr">借款企业成立于2009年，为一家集阀门研发、设计、生产、销售、服务、进出口于一体的企业，是北京市科委认定的高新技术企业及北京市发改委批准建设的高性能阀门技术北京市工程实验室，重点扶植工业企业。借款企业目前下设5个技术研发部门，其依托国际优秀的设计理念和先进的国外技术，目前已开发出多种符合API、GB、JB、DIN、EN、BS标准要求的球阀产品，同时为了提升企业的研发力量，与国内知名大学进行合作，利用高校的学术和技术优势，研究开发具有自主知识产权的产品，目前已有三项产品获得国家专利，另有8项产品正在申请国家专利。<br>
&nbsp;&nbsp;&nbsp;&nbsp;借款企业具有上百套先进的机械设备，以及一整套先进而完善的质量控制及保证体系，具备TS生产许可证，并已通过ISO9001质量体系、ISO14001环境体系、ISO28000职业安全体系、美国石油协会API、TS特种设备和CE及各船级社体系认证。</div>
                <div class="wz_one">企业信息</div>
                <div class="wz_nr"><span class="cu">营业范围：</span>生产、销售阀门；货物进出口。<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="cu">经营状况：</span><br>&nbsp;&nbsp;&nbsp;&nbsp;借款企业主要从事阀门的生产、销售业务。重点研发生产应用于石油、天然气输送管道用的高性能大口径全焊接管线球阀，用于化工行业、煤制气、煤化工、火电等领域的硬密封耐磨球阀，用于城市供热、燃气管网系统的全焊接供热燃气球阀。产品国内外均有销售，国外销售区域有欧美、东南亚、中东、俄罗斯、非洲等国家和地区。客户主要集中在中石油、中石化等国有大型企业，是中石油天然气集团公司、中国石油化工集团公司、国家电力公司等大型国有单位认证的物资供应网络成员。<br>
&nbsp;&nbsp;&nbsp;&nbsp;2012年借款企业年营业收入为2.0853亿元，2013年借款企业营业收入已达到2.7亿元，2014年截止4月份，企业营业收入为8258万元，目前企业经营稳定，规模持续扩大，经营前景看好。</div>
            </div>
        </div>
        <!-- xx right -->
<%@ include file="/includes/xx_right.jsp" %>
    	<!-- xx right end-->
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
