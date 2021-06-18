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
            <div class="mem_tit">
            	<span class="fr" style="font-size:12px; color:#55555; font-family:'宋体'; margin-top:5px;">共发现4件</span>我的收藏
            </div>
           	<table border="0" class="order_tab" style="width:930px;" cellspacing="0" cellpadding="0">
              <tr>                                                                                                                                       
                <td align="center" width="420">商品名称</td>
                <td align="center" width="180">价格</td>
                <td align="center" width="270">操作</td>
              </tr>
              <tr>
                <td style="font-family:'宋体';">
                	<div class="sm_img"><img src="static/images/simg.jpg" width="48" height="48" /></div>法颂浪漫梦境50ML 香水女士持久清新淡香 送2ML小样3只
                </td>
                <td align="center">￥456.00</td>
                <td align="center"><a href="#">关注</a>&nbsp; &nbsp; <a href="#" style="color:#ff4e00;">加入购物车</a>&nbsp; &nbsp; <a href="#">删除</a></td>
              </tr>
              <tr>
                <td style="font-family:'宋体';">
                	<div class="sm_img"><img src="static/images/simg.jpg" width="48" height="48" /></div>法颂浪漫梦境50ML 香水女士持久清新淡香 送2ML小样3只
                </td>
                <td align="center">￥456.00</td>
                <td align="center"><a href="#">关注</a>&nbsp; &nbsp; <a href="#" style="color:#ff4e00;">加入购物车</a>&nbsp; &nbsp; <a href="#">删除</a></td>
              </tr>
              <tr>
                <td style="font-family:'宋体';">
                	<div class="sm_img"><img src="static/images/simg.jpg" width="48" height="48" /></div>法颂浪漫梦境50ML 香水女士持久清新淡香 送2ML小样3只
                </td>
                <td align="center">￥456.00</td>
                <td align="center"><a href="#">关注</a>&nbsp; &nbsp; <a href="#" style="color:#ff4e00;">加入购物车</a>&nbsp; &nbsp; <a href="#">删除</a></td>
              </tr>
              <tr>
                <td style="font-family:'宋体';">
                	<div class="sm_img"><img src="static/images/simg.jpg" width="48" height="48" /></div>法颂浪漫梦境50ML 香水女士持久清新淡香 送2ML小样3只
                </td>
                <td align="center">￥456.00</td>
                <td align="center"><a href="#">关注</a>&nbsp; &nbsp; <a href="#" style="color:#ff4e00;">加入购物车</a>&nbsp; &nbsp; <a href="#">删除</a></td>
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
