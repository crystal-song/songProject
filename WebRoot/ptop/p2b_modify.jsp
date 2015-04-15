<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改PtoB项目</title>


 <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
   <!--  <title>UMEDITOR 完整demo</title> -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="<%=path%>/up/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
    <link href="<%=path%>/css/style1.css" rel="stylesheet" type="text/css" />
   <script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>   
    <script type="text/javascript" charset="utf-8" src="<%=path%>/up/umeditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=path%>/up/umeditor.min.js"></script>
    <script type="text/javascript" src="<%=path%>/up/lang/zh-cn/zh-cn.js"></script>
    <script src="<%=path%>/js/uploadPreview.min.js" type="text/javascript"></script>
     <link type="text/css" href="<%=path%>/css/jquery-ui-1.8.17.custom.css" rel="stylesheet" />
     <link type="text/css" href="<%=path%>/css/jquery-ui-timepicker-addon.css" rel="stylesheet" />
	<script type="text/javascript" src="<%=path%>/js/jquery-ui-1.8.17.custom.min.js"></script>
	<script type="text/javascript" src="<%=path%>/js/jquery-ui-timepicker-addon.js"></script>
    <script type="text/javascript" src="<%=path%>/js/jquery-ui-timepicker-zh-CN.js"></script>
    <style type="text/css">
        h1{
            font-family: "微软雅黑";
            font-weight: normal;
        }
        .btn {
            display: inline-block;
            *display: inline;
            padding: 4px 12px;
            margin-bottom: 0;
            *margin-left: .3em;
            font-size: 14px;
            line-height: 20px;
            color: #333333;
            text-align: center;
            text-shadow: 0 1px 1px rgba(255, 255, 255, 0.75);
            vertical-align: middle;
            cursor: pointer;
            background-color: #f5f5f5;
            *background-color: #e6e6e6;
            background-image: -moz-linear-gradient(top, #ffffff, #e6e6e6);
            background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#ffffff), to(#e6e6e6));
            background-image: -webkit-linear-gradient(top, #ffffff, #e6e6e6);
            background-image: -o-linear-gradient(top, #ffffff, #e6e6e6);
            background-image: linear-gradient(to bottom, #ffffff, #e6e6e6);
            background-repeat: repeat-x;
            border: 1px solid #cccccc;
            *border: 0;
            border-color: #e6e6e6 #e6e6e6 #bfbfbf;
            border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
            border-bottom-color: #b3b3b3;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            border-radius: 4px;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff', endColorstr='#ffe6e6e6', GradientType=0);
            filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
            *zoom: 1;
            -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
            -moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
            box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
        }

        .btn:hover,
        .btn:focus,
        .btn:active,
        .btn.active,
        .btn.disabled,
        .btn[disabled] {
            color: #333333;
            background-color: #e6e6e6;
            *background-color: #d9d9d9;
        }

        .btn:active,
        .btn.active {
            background-color: #cccccc \9;
        }

        .btn:first-child {
            *margin-left: 0;
        }

        .btn:hover,
        .btn:focus {
            color: #333333;
            text-decoration: none;
            background-position: 0 -15px;
            -webkit-transition: background-position 0.1s linear;
            -moz-transition: background-position 0.1s linear;
            -o-transition: background-position 0.1s linear;
            transition: background-position 0.1s linear;
        }

        .btn:focus {
            outline: thin dotted #333;
            outline: 5px auto -webkit-focus-ring-color;
            outline-offset: -2px;
        }

        .btn.active,
        .btn:active {
            background-image: none;
            outline: 0;
            -webkit-box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
            -moz-box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
            box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
        }

        .btn.disabled,
        .btn[disabled] {
            cursor: default;
            background-image: none;
            opacity: 0.65;
            filter: alpha(opacity=65);
            -webkit-box-shadow: none;
            -moz-box-shadow: none;
            box-shadow: none;
        }
    </style>
    
    
    
    


  
  <script type="text/javascript" charset="utf-8">


       /*  function addOrUpdateUser() {
           

            $.post("resource/addOrUpdate", $("#form").serializeArray(), function (data) {
                $('#MyPopWindow').window('close');
                $('#hotelTable').datagrid('reload');
                $.messager.alert('提示', data.mes, 'info');
            });
        } */

        $(document).ready(function(){ 
        	
        	/* alert("ddddddddddddddddddddd"); */
        	
        	    
        	/* $('#mes').val(); */
        	if($('#mes').val()!=''){
        		alert($('#mes').val());
        	}
        	
        	if($("#enterpriseNumber").val()=="")
        	{
        		tt=new Date();
        		$("#enterpriseNumber").val("ZTH01"+tt.valueOf());
        		}
        	/* if( r!=null){
        		alert(r);
        	} */
        	    	
        	     	
        	/*  $("#file").uploadPreview({ Img: "ImgPr", Width: 120, Height: 120});
        	alert("cccccccccccccccccccccccccccc");  */
        	
        	
        });   
        
        
        /* $(function () {
        	
            $("#file").uploadPreview({ Img: "ImgPr", Width: 250, Height: 158});
            alert("cccccccccccccccccccccccccccc");
        });  */

        
    </script>
    
</head>

<body>




<div id="wrap">
<!-- header -->
 <%@ include file="/includes/manage_nav.jsp" %> 
 <!-- header end -->
    <div class="cl"></div>
  <div class="content">
  	<h2>添加/修改PtoB项目</h2>
  	
  	

  		<form  action="<%=path%>/Login/addproduct" id="form" method="post"   class="box"  style="display:'none'"   >
    	<div class="dataForm">
    <input type="hidden" name="mes" id="mes" value="${mes}" />
    <input type="hidden" name="hotPicture" id="hotPicture" value="" />
     <input type="hidden" name="projectPicture"  id="projectPicture"  value=""   />    
      <input type="hidden" name="enterpriseCertificate"  id="enterpriseCertificate"  value=""   />   
    <input type="hidden" name="enterpriseNumber"  id="enterpriseNumber"  value="${product1.enterpriseNumber}"   />     
    <input type="hidden" name="enterpriseName"  id="enterpriseName"  value="${product1.enterpriseName}"   />   
    <input type="hidden" name="targetPlatformUserNo"  id="targetPlatformUserNo"  value="${product1.targetPlatformUserNo}"   />  
    <input type="hidden" name="id" id="id" value="${product1.id}" />
    <input type="hidden" name="existType" id="existType" value="0" />
    <input type="hidden" name="financingProgress" id="financingProgress" value="${product1.financingProgress}" /> 
    <input type="hidden" name="realityMoney" id="realityMoney" value="${product1.realityMoney}" /> 
     <input type="hidden" name="projectStatus" id="projectStatus" value="${product1.projectStatus}" /> 
     <input type="hidden" name="loaned" id="loaned" value="${product1.loaned}" /> 
      <input type="hidden" name="reward" id="reward" value="${product1.reward}" /> 
     <input type="hidden" id="ishot" value="${ishotproject }"/>
        	<ul>
                <li>
                    <dd>项目名称：</dd>
                    <input type="text" name="projectName"  id="projectName"  value="${product1.projectName}"  />
                    <dt>必填项，字数请控制在14个汉字以内。</dt>
                </li>
                
                <li>
                    <dd>项目图片：</dd>
                    <dt><script type="text/plain"   id="Editor" style="width:100%;height:100px;">${product1.projectPicture}</script>  <br />尺寸：250*158</dt>  
                </li>
                <li>
                    <dd>信用等级：</dd>
                    <input type="number"  name="qualityRating"  id="qualityRating" value="${product1.qualityRating==null?1:product1.qualityRating}"      min="1" max="5" value="1" step="1" />
                    <dt></dt>
                </li>
                <li>
                    <dd>年化收益：</dd>
                    <input type="number"  name="yearIncome"  id="yearIncome"   value="${product1.yearIncome==null?10:product1.yearIncome}"   min="1" max="100" value="10" step="1" />
                    <dt>用整数表示，如12%则输入12</dt>
                </li>
              
                <li>
                    <dd>担保机构：</dd>
                    <input type="text" name="guaranteeInstitution"  id="guaranteeInstitution" value="${product1.guaranteeInstitution}"  />
                    <dt></dt>
                </li>
                 <li>
                 <input type="hidden"   id="repaymentWay1" value="${product1.repaymentWay}"  />
                    <dd>还款方式：</dd>
                    <select  name="repaymentWay"  id="repaymentWay" >
                     <option id="option1" value="1" >按月付息、到期还本</option>
                     <option id="option2"  value="2" >按季付息、到期还本</option>
                     <option id="option3" value="3" >半年付息、到期还本</option>
                     <option id="option4" value="4" >按年付息、到期还本</option>
                     <option id="option5" value="5" >到期付息、到期还本</option>
                    </select>
                </li>
                <%--  <li>
                    <dd>还款方式：</dd>
                    <input type="text" name="repaymentWay"  id="repaymentWay"  value="${product1.repaymentWay==null?'按月付息、到期还本':product1.repaymentWay}" />
                    <dt>按月付息、到期还本</dt>
                </li> --%>
                 <li>
                    <dd>开始融资时间：</dd>
                    <input type="" name="financeTimes"  id="financeTime" value="${product1.financeTime}"  class="ui_timepicker" />
                    <dt>请规范书写时间格式：如2015-01-01 00:00:00</dt>
                </li>
                  <li>
                	 <dd>还款日期：</dd>
                    <input type="" class="ui_timepicker" name="repaymentTimes"  id="repaymentTime" value="${product1.repaymentTime}"  />
                    <dt>请规范书写时间格式：如2015-01-01 00:00:00</dt>
                </li>
                <li>
                    <dd>融资金额：</dd>
                    <input type="number"  name="financingMoney"  id="financingMoney"  value="${product1.financingMoney}"    min="0" value="0" />
                    <dt>单位是<b>万元</b>。</dt>
                </li>
                <li>
                    <dd>融资周期：</dd>
                    <input type=""  name="financingPeriod"  id="financingPeriod"  value="${product1.financingPeriod}"    min="0" value="0" />
                    <dt>单位是<b>天</b>,请输入整数。</dt>
                </li>
                
               <!--  <li>
                    <dd>重点信息：</dd>
                    <textarea name="abstract" cols="" rows=""></textarea>
                    <dt>显示在项目图片下方的综合摘要信息。</dt>
                </li> -->
                 <li>
                    <dd>公司介绍：</dd>
                    <textarea    name="companyProfile"  id="companyProfile"  value=""    cols="" rows="">${product1.companyProfile}</textarea>
                    <dt></dt>
                </li>
                <li>
                    <dd>项目介绍：</dd>
                    <textarea  name="projectIntroduce"  id="projectIntroduce"   value=""   cols="" rows="">${product1.projectIntroduce}</textarea>
                    <dt></dt>
                </li>
                <li>
                    <dd>担保意见：</dd>
                    <textarea  name="collateralOpinion"  id="collateralOpinion"  value=""   cols="" rows="">${product1.collateralOpinion}</textarea>
                    <dt></dt>
                </li>
                <li>
                    <dd>担保机构介绍：</dd>
                    <textarea  name="guaranteeInstitutionIntroduce"  id="guaranteeInstitutionIntroduce"  value=""    cols="" rows="">${product1.guaranteeInstitutionIntroduce}</textarea>
                    <dt></dt>
                </li>
                <li>
                    <dd>资金用途：</dd>
                    <textarea   name="fundUse"  id="fundUse"  value=""     cols="" rows="">${product1.fundUse}</textarea>
                    <dt></dt>
                </li>
                <li>
                    <dd>偿还来源：</dd>
                    <textarea   name="repaymentSource"  id="repaymentSource"  value=""    cols="" rows="">${product1.repaymentSource}</textarea>
                    <dt></dt>
                </li>
                <li>
                    <dd>抵押物信息：</dd>
                    <textarea   name="guarantee"  id="guarantee"   value=""   cols="" rows="">${product1.guarantee}</textarea>
                    <dt></dt>
                </li>
                <li>
                    <dd>风险控制：</dd>
                    <textarea   name="riskControl"  id="riskControl"  value=""   cols="" rows="">${product1.riskControl}</textarea>
                    <dt></dt>
                </li>
                 <li>
                    <dd>营业范围：</dd>
                    <textarea   name="businessScope"  id="businessScope"  value=""    cols="" rows="">${product1.businessScope}</textarea>
                    <dt></dt>
                </li>
                 
                <li>
                    <dd>经营状况：</dd>
                    <textarea   name="stateOfOperation"  id="stateOfOperation"   value=""   cols="" rows="">${product1.stateOfOperation}</textarea>
                    <dt></dt>
                </li>
     			<li>               
      			  <dd>相关证件：</dd>
			    <dt>
				<!--style给定宽度可以影响编辑器的最终宽度-->
				<script type="text/plain"   id="myEditor" style="width:100%;height:180px;">${product1.enterpriseCertificate}</script>
				</dt> 
				<dt>请将所有相关的图片上传至此区域内！</dt>       
             
				</li>
                 <li>
                    <dd>融资方营业执照号：</dd>
                    <input type="text" name="enterpriseBusinessIicense"  id="enterpriseBusinessIicense"  value="${product1.enterpriseBusinessIicense}" />
                    <dt></dt>
                </li>
                                 <li>
                    <dd>担保方营业执照号：</dd>
                    <input type="text" name="guaranteeNumber"  id="guaranteeNumber"  value="${product1.guaranteeNumber}" />
                    <dt></dt>
                </li>
                <li>
                
                <dd>设置项目属性：</dd>
                 <p>
                      <label>
                        <input type="checkbox"  name="recommendType" id="recommendType"   value="1" />
                        <span>推荐</span></label>
                         <input type="hidden" id="recommendType1" value="${product1.recommendType }"></input>
				</p>
                    <dt></dt>
                </li>
               <!--  <li>
                    <dd>发布时间：</dd>
                    <input type="date"   />
                    <dt></dt>
                </li> -->
                 <li>
                <dd>线上/线下属性：</dd>
                 <p>
                      <label>
                        <input type="checkbox" name="buyType" id="buyType"   value="1"  />
                        <span>上线项目</span></label>
                        <input type="hidden" id="buyType1" value="${product1.buyType }"></input>
				</p>
                    <dt></dt>
                </li>              
                 <li>
                <dd>显示状态：</dd>
                 <p>
                      <label>
                        <input type="checkbox" name="line" id="line"   value="1"  onclick="checkRate();"/>
                        <span>项目可见</span></label>
                        <input type="hidden" id="line1" value="${product1.line }"></input>
				</p>
                    <dt></dt>
                </li>              
                <li>
                    <dd>平台费用：</dd>
                    <input type="number" name="platformFee"  id="platformFee" value="${product1.platformFee}"  />
                    <dt></dt>
                </li>
                <li>
                    <dd>保证金金额：</dd>
                    <input type="number" name="margin"  id="margin" value="${product1.margin}"  />
                    <dt></dt>
                </li>
              	 <dd>热门项目：</dd>
                 <p>
                      <label>
                        <input type="checkbox" name="hot" id="hot"   value="1"  />
                        <span>热门</span></label>
				</p>
                    <dt></dt>
                </li>   
                  </li> 
                  <li> <dd>热门项目图片：</dd>
					<dt>
						<script type="text/plain"   id="hotEditor" style="width:100%;height:180px;">${product1.hotPicture}</script>
					</dt> 
					<dt>请将所有相关的图片上传至此区域内！</dt>       
             
				</li>         
                <li>
                <dd></dd>
                 <input type="button"  title="提交"  onclick="getContent()"   value="提交" class="b"/>
                <dt>请仔细检查后再提交！！！</dt>
                </li>
                
            </ul>
            <p align="right"><a href="#top">↑返回顶部</a></p>
   	  </div>
   	  </form>
  </div>
  <div class="cl"></div>
</div>





<div>
     <h3 id="focush2"></h3> 
</div>
<script type="text/javascript">
$(document).ready(function(){
	if($('#recommendType1').val()==1){
		$('#recommendType').attr('checked',true);
	}
	if($('#buyType1').val()==1){
		$('#buyType').attr('checked',true);
	}
	if($('#line1').val()=='true'){
		$('#line').attr('checked',true);
	}
	if($('#ishot').val()=='true'){
		$('#hot').attr('checked',true);
	}  
	if($('#repaymentWay1').val()=='1'){
		$('#option1').attr('selected',true);
	}  
	if($('#repaymentWay1').val()=='2'){
		$('#option2').attr('selected',true);
	}  
	if($('#repaymentWay1').val()=='3'){
		$('#option3').attr('selected',true);
	}  
	if($('#repaymentWay4').val()=='4'){
		$('#option2').attr('selected',true);
	}  
	if($('#repaymentWay5').val()=='5'){
		$('#option2').attr('selected',true);
	}  
	});
	function checkRate(){
		if ($('#line').val() ==1) {
			$.ajax({
				type : 'POST',
				url : '/Login/checkRate',
				data : 'enterpriseNumber=' + $('#enterpriseNumber').val(),
				dataType : 'text',
				success : function(data) {
					if (data != '"success"') {
						alert("请添加阶梯利率以后在修改项目状态！")
						$('#line').attr('checked',false);
					}
				}
			});
		}
	}
$(function () {
    $(".ui_timepicker").datetimepicker({
        //showOn: "button",
        //buttonImage: "./css/images/icon_calendar.gif",
        //buttonImageOnly: true,
        showSecond: true,
        timeFormat: 'hh:mm:ss',
        stepHour: 1,
        stepMinute: 1,
        stepSecond: 1
    })
})

//实例化编辑器
var um1 = UM.getEditor('Editor');
var um2 = UM.getEditor('hotEditor');
var um3 = UM.getEditor('myEditor');
    function getContent() {
        var arr = [];
        var arr1 = [];
        var arr2=[];
     /*    arr.push("使用editor.getContent()方法可以获得编辑器的内容");
        arr.push("内容为："); */
        arr.push(um3.getContent());
        arr1.push(um1.getContent());
        arr2.push(um2.getContent());
      /*   alert(arr.join("\n")); */
        $("#enterpriseCertificate").val(arr.join("\n"));
        
        
       
      /*   alert(arr1.join("\n")); */
        $("#projectPicture").val(arr1.join("\n"));
        $("#hotPicture").val(arr2.join("\n"));
        if($("#projectName").val()==""){
        	alert("注意：项目名称 不得为空!");
        	return FALSE;
        }
        
        if($("#financingMoney").val()==""){
        	alert("注意：融资金额 不得为空!");
        	return FALSE;
        }
        if($("#repaymentTime").val()==""){
        	alert("注意：还款日期 不得为空!");
        	return FALSE;
        }
        if($("#financeTime").val()==""){
        	alert("注意：开始融资时间 不得为空!");
        	return FALSE;
        }
         $("#form" ).submit();  
    }
</script>


</body>
</html>

