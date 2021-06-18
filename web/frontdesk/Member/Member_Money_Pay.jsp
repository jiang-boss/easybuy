<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%--   静态引入base标签--%>
    <%@include file="/common/front/baseAndjs.jsp"%>
        
    <script type="text/javascript" src="static/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="static/js/menu.js"></script>
        
	<script type="text/javascript" src="static/js/select.js"></script>
        
    
<title>尤洪</title>
</head>
<body>  
<!--Begin Header Begin-->
<%@include file="/common/front/header.jsp"%>
<%@include file="/common/front/searchBar.jsp"%>
<!--End Header End--> 
<div class="i_bg bg_color">
    <!--Begin 用户中心 Begin -->
	<div class="m_content">
        <%--        静态包含用户的左边栏--%>
        <%@include file="/common/front/leftBar.jsp"%>

		<div class="m_right">
            <p></p>		
            
			<table border="0" class="ma_tab" style="width:930px; margin-top:50px;" cellspacing="0" cellpadding="0">
              <tr>
                <td align="right" width="130" style="padding-right:30px;">您的充值金额为</td>                                                                       
                <td>￥ 999.00</td>
              </tr>
              <tr>
                <td align="right" style="padding-right:30px;">您选择的支付方式为</td>
                <td>支付宝</td>
              </tr>
              <tr>
                <td align="right" style="padding-right:30px;">支付手续费用为</td>
                <td>￥ 0.00</td>
              </tr>
              <tr valign="top">
                <td align="right" style="padding-right:30px;">支付方式描述</td>
                <td>
                	支付宝网站(www.alipay.com) 是国内先进的网上支付平台。<br />
                    支付宝收款接口：在线即可开通，<font color="#ff4e00">零预付，免年费，</font>单笔阶梯费率，无流量限制。<br />
                    <a href="#" style="color:#ff4e00;">立即在线申请</a>
                </td>
              </tr>
			</table>
            
            <p align="center">
            	<input type="submit" value="立即使用支付宝支付" class="btn_tj" />
            </p>
			


            
        </div>
    </div>
	<!--End 用户中心 End--> 
    <!--Begin Footer Begin -->
    <%@include file="/common/front/footer.jsp"%>
    <!--End Footer End -->    
</div>

</body>


<!--[if IE 6]>
<script src="//letskillie6.googlecode.com/svn/trunk/2/zh_CN.js"></script>
<![endif]-->
</html>
