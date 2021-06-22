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
<%@include file="/common/backend/header.jsp"%>
<%@include file="/common/front/searchBar.jsp"%>
<!--End Header End-->


<div class="i_bg bg_color">
    <!--Begin 用户中心 Begin -->
	<div class="m_content">
        <%--        静态包含用户的左边栏--%>
        <%@include file="/common/front/leftBar.jsp"%>


		<div class="m_right">
            <p></p>		
            
			<div class="mem_tit">
            	我的佣金
            </div>
            <table border="1" class="co_tab" style="width:930px; font-size:14px; margin-top:20px;" cellspacing="0" cellpadding="0">
              <tr>
                <td width="35%"><img src="static/images/bag.png" align="absmiddle" /> &nbsp;消费返利</td>
                <td width="65%" style="color:#ff4e00;">100R</td>
              </tr>
              <tr>
                <td width="35%"><img src="static/images/bag.png" align="absmiddle" /> &nbsp;预存返还 </td>
                <td width="65%" style="color:#ff4e00;">100R</td>
              </tr>
              <tr>
                <td width="35%"><img src="static/images/bag.png" align="absmiddle" /> &nbsp;联盟返利 </td>
                <td width="65%" style="color:#ff4e00;">1000R</td>
              </tr>
              <tr>
                <td width="35%"><img src="static/images/bag.png" align="absmiddle" /> &nbsp;可提现余额 </td>
                <td width="65%" style="color:#ff4e00;">
                	1200R
                	<span class="tx"><a href="#">提现</a></span>
                </td>
              </tr>
            </table>

            
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
