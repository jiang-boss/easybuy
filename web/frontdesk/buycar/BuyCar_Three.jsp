<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%--   静态引入base标签--%>
    <%@include file="/common/front/baseAndjs.jsp"%>
        <script type="text/javascript" src="static/js/jquery-1.11.1.min_044d0927.js"></script>
        <script type="text/javascript" src="static/js/jquery.bxslider_e88acd1b.js"></script>
        <script type="text/javascript" src="static/js/jquery-1.8.2.min.js"></script>
        <script type="text/javascript" src="static/js/menu.js"></script>
        <script type="text/javascript" src="static/js/n_nav.js"></script>
    <script type="text/javascript" src="static/js/num.js">
    	var jq = jQuery.noConflict();
    </script>
    <script type="text/javascript" src="static/js/shade.js"></script>
    
<title>尤洪</title>
</head>
<body>
<script type="text/javascript" language="JavaScript">


    $(function (){
        $("#pay").click(function (){
            //这里发送给支付宝的支付接口
            var orderNum=$("#orderNum").text();
            var allPrice=$("#allPrice").text();

            location.href="${basepath}/client/payServlet?action=doPay&orderNum="+orderNum+"&allPrice="+allPrice+"&orderName=${sessionScope.login.loginName}&orderBody=${sessionScope.orderInfo.createTime}";

        })
    })
</script>
<!--Begin Header Begin-->
<%@include file="/common/backend/header.jsp"%>
<%@include file="/common/front/searchBar.jsp"%>
<!--End Header End-->

<!--Begin Menu Begin-->
<%@include file="/common/front/menu.jsp"%>
<!--End Menu End-->


<div class="i_bg">  
    <div class="content mar_20">
    	<img src="static/images/img3.jpg" />
    </div>
    <!--Begin 第三步：提交订单 Begin -->
    <div class="content mar_20">
        <!--Begin 支付宝支付 Begin -->
    	<div class="warning">        	
            <table border="0" style="width:1000px; text-align:center;" cellspacing="0" cellpadding="0">
              <tr height="35">
                <td style="font-size:18px;">
                	感谢您在本店购物！您的订单已提交成功，请记住您的订单号: <font id="orderNum" color="#ff4e00">${sessionScope.orderInfo.serialNumber}</font>
                </td>
              </tr>
              <tr>
                <td style="font-size:14px; font-family:'宋体'; padding:10px 0 20px 0; border-bottom:1px solid #b6b6b6;">
                	您选定的配送方式为: <font color="#ff4e00">申通快递</font>； &nbsp您选定的支付方式为: <font color="#ff4e00">支付宝</font>； &nbsp; &nbsp;您的应付款金额为: ￥<font id="allPrice" color="#ff4e00">${sessionScope.orderInfo.cost}</font>
                </td>
              </tr>
              <tr>
                <td>
                	<div class="btn_u" style="margin:0 auto; padding:0 20px; width:120px;"><a id="pay">立即使用支付宝支付</a></div>
                	<a href="#">首页</a> &nbsp; &nbsp; <a href="#">用户中心</a>
                </td>
              </tr>
            </table>        	
        </div>
        <!--Begin 支付宝支付 Begin -->
    </div>
	<!--End 第三步：提交订单 End-->
    <!--Begin Footer Begin -->
    <%@include file="/common/front/footer.jsp"%>
    <!--End Footer End -->    
</div>
</body>
<!--[if IE 6]>
<script src="//letskillie6.googlecode.com/svn/trunk/2/zh_CN.js"></script>
<![endif]-->
</html>
