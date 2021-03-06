<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<jsp:forward page="client/clientServlet?action=ListNews"></jsp:forward>--%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%--<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />--%>
<%--	<link type="text/css" rel="stylesheet" href="static/css/style.css" />--%>
<%--    <!--[if IE 6]>--%>
<%--    <script src="static/js/iepng.js" type="text/javascript"></script>--%>
<%--        <script type="text/javascript">--%>
<%--           EvPNG.fix('div, ul, img, li, input, a');--%>
<%--        </script>--%>
<%--    <![endif]-->--%>
    
    <%@include file="/common/front/baseAndjs.jsp"%>
    <script type="text/javascript" src="static/js/jquery-1.11.1.min_044d0927.js"></script>
	<script type="text/javascript" src="static/js/jquery.bxslider_e88acd1b.js"></script>
    <script type="text/javascript" src="static/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="static/js/menu.js"></script>
	<script type="text/javascript" src="static/js/select.js"></script>
	<script type="text/javascript" src="static/js/lrscroll.js"></script>
    <script type="text/javascript" src="static/js/iban.js"></script>
    <script type="text/javascript" src="static/js/fban.js"></script>
    <script type="text/javascript" src="static/js/f_ban.js"></script>
    <script type="text/javascript" src="static/js/mban.js"></script>
    <script type="text/javascript" src="static/js/bban.js"></script>
    <script type="text/javascript" src="static/js/hban.js"></script>
    <script type="text/javascript" src="static/js/tban.js"></script>
	<script type="text/javascript" src="static/js/lrscroll_1.js"></script>

<title>尤洪</title>
</head>
<script type="text/javascript">
    $(function (){
        $("#fanren").css("display","block")
    })

</script>
<body>
<!--Begin Header Begin-->
<%--判断是用户还是管理员--%>
    <%@include file="/common/backend/header.jsp"%>
<%@include file="/common/front/searchBar.jsp"%>
<!--End Header End-->
<!--Begin Menu 三级分类菜单Begin-->
<%@include file="/common/front/menu.jsp"%>
<%--<jsp:include page="/common/front/menu.jsp">--%>
<!--End Menu End-->
<div class="i_bg bg_color">
	<div class="i_ban_bg">
		<!--Begin Banner Begin-->
    	<div class="banner">
            <div class="top_slide_wrap">
                <ul class="slide_box bxslider">
                    <li><img src="static/images/ban1.jpg" width="740" height="401" /></li>
                    <li><img src="static/images/ban1.jpg" width="740" height="401" /></li>
                    <li><img src="static/images/ban1.jpg" width="740" height="401" /></li>
                </ul>
                <div class="op_btns clearfix">
                    <a href="#" class="op_btn op_prev"><span></span></a>
                    <a href="#" class="op_btn op_next"><span></span></a>
                </div>
            </div>
        </div>
        <script type="text/javascript">
        //var jq = jQuery.noConflict();
        (function(){
            $(".bxslider").bxSlider({
                auto:true,
                prevSelector:jq(".top_slide_wrap .op_prev")[0],nextSelector:jq(".top_slide_wrap .op_next")[0]
            });
        })();
        </script>
        <!--End Banner End-->
        <div class="inews">
        	<div class="news_t">
            	<span class="fr"><a href="frontdesk/News/new.jsp">更多 ></a></span>新闻资讯
            </div>
            <ul style="overflow-y: scroll">
                <c:forEach items="${sessionScope.newsList}" var="news">
                <li><span>[ 特惠 ]</span><a href="#">${news.title}</a></li>
                </c:forEach>
            </ul>

            <div class="charge_t">
            	话费充值<div class="ch_t_icon"></div>
            </div>
            <form>
            <table border="0" style="width:205px; margin-top:10px;" cellspacing="0" cellpadding="0">
              <tr height="35">
                <td width="33">号码</td>
                <td><input type="text" value="" class="c_ipt" /></td>
              </tr>
              <tr height="35">
                <td>面值</td>
                <td>
                	<select class="jj" name="city">
                      <option value="0" selected="selected">100元</option>
                      <option value="1">50元</option>
                      <option value="2">30元</option>
                      <option value="3">20元</option>
                      <option value="4">10元</option>
                    </select>
                    <span style="color:#ff4e00; font-size:14px;">￥99.5</span>
                </td>
              </tr>
              <tr height="35">
                <td colspan="2"><input type="submit" value="立即充值" class="c_btn" /></td>
              </tr>
            </table>
            </form>
        </div>
    </div>
    <!--Begin 热门商品 Begin-->
    <div class="content mar_10">
    	<div class="h_l_img">
        	<div class="img"><img src="static/images/l_img.jpg" width="188" height="188" /></div>
            <div class="pri_bg">
                <span class="price fl">￥53.00</span>
                <span class="fr">16R</span>
            </div>
        </div>
        <div class="hot_pro">
        	<div id="featureContainer">
                <div id="feature">
                    <div id="block">
                        <div id="botton-scroll">
                            <ul class="featureUL">
                                <li class="featureBox">

                                    <div class="box">
                                    	<div class="h_icon"><img src="static/images/hot.png" width="50" height="50" /></div>
                                        <div class="imgbg">
                                        	<a href="#"><img src="static/images/hot1.jpg" width="160" height="136" /></a>
                                        </div>
                                        <div class="name">
                                        	<a href="#">
                                            <h2>德国进口</h2>
                                            德亚全脂纯牛奶200ml*48盒
                                            </a>
                                        </div>
                                        <div class="price">
                                            <font>￥<span>189</span></font> &nbsp; 26R
                                        </div>
                                    </div>
                                </li>
                                <li class="featureBox">
                                    <div class="box">
                                        <div class="h_icon"><img src="static/images/hot.png" width="50" height="50" /></div>
                                        <div class="imgbg">
                                        	<a href="#"><img src="static/images/hot2.jpg" width="160" height="136" /></a>
                                        </div>
                                        <div class="name">
                                        	<a href="#">
                                            <h2>iphone 6S</h2>
                                            Apple/苹果 iPhone 6s Plus公开版
                                            </a>
                                        </div>
                                        <div class="price">
                                            <font>￥<span>5288</span></font> &nbsp; 25R
                                        </div>
                                    </div>
                                </li>
                                <li class="featureBox">
                                    <div class="box">
                                        <div class="h_icon"><img src="static/images/hot.png" width="50" height="50" /></div>
                                        <div class="imgbg">
                                        	<a href="#"><img src="static/images/hot3.jpg" width="160" height="136" /></a>
                                        </div>
                                        <div class="name">
                                        	<a href="#">
                                            <h2>倩碧特惠组合套装</h2>
                                            倩碧补水组合套装8折促销
                                            </a>
                                        </div>
                                        <div class="price">
                                            <font>￥<span>368</span></font> &nbsp; 18R
                                        </div>
                                    </div>
                                </li>
                                <li class="featureBox">
                                    <div class="box">
                                        <div class="h_icon"><img src="static/images/hot.png" width="50" height="50" /></div>
                                        <div class="imgbg">
                                        	<a href="#"><img src="static/images/hot4.jpg" width="160" height="136" /></a>
                                        </div>
                                        <div class="name">
                                        	<a href="#">
                                            <h2>品利特级橄榄油</h2>
                                            750ml*4瓶装组合 西班牙原装进口
                                            </a>
                                        </div>
                                        <div class="price">
                                            <font>￥<span>280</span></font> &nbsp; 30R
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <a class="h_prev" href="#">Previous</a>
                    <a class="h_next" href="">Next</a>
                </div>
            </div>
        </div>
    </div>

    <div class="content mar_20">
    	<img src="static/images/mban_1.jpg" width="1200" height="110" />
    </div>

    <c:forEach items="${sessionScope.treeCategory}" var="tree1">
	<!--Begin 进口 生鲜 Begin-->
    <div class="i_t mar_10">
    	<span class="floor_num">1F</span>
    	<span id="${tree1.id}" class="fl">${tree1.name}</span>
        <span class="i_mores fr">
            <c:forEach items="${tree1.child}" var="tree2">
                <a href="#">${tree2.name}</a>&nbsp; &nbsp; &nbsp;
            </c:forEach>
        </span>
    </div>
    <div class="content">
    	<div class="fresh_left">
        	<div class="fre_ban">
            	<div id="imgPlay1">
                    <ul class="imgs" id="actor1">
<%--                        <c:forEach items="${requestScope.productList}" var="product">--%>
<%--                            <c:if test="${product.categoryLevel1Id==tree1.id}">--%>
<%--                                <li><a href="#"><img src="files/${product.fileName}" width="211" height="286" /></a></li>--%>
<%--                            </c:if>--%>
<%--                        </c:forEach>--%>
                        <li><a href="#"><img src="static/images/fre_r.jpg" width="211" height="286" /></a></li>
                        <li><a href="#"><img src="static/images/fre_r.jpg" width="211" height="286" /></a></li>
                        <li><a href="#"><img src="static/images/fre_r.jpg" width="211" height="286" /></a></li>
                    </ul>
                    <div class="prevf">上一张</div>
                    <div class="nextf">下一张</div>
                </div>
            </div>
            <div class="fresh_txt">
            	<div class="fresh_txt_c">
                    <c:forEach items="${tree1.child}" var="tree2">
                        <c:forEach items="${tree2.child}" var="tree3">
                            <a href="client/clientServlet?action=pagecategory&id=${tree3.id}">${tree3.name}</a>
                        </c:forEach>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div class="fresh_mid">
        	<ul>
                <c:forEach items="${requestScope.productList}" var="product">
                    <c:if test="${product.categoryLevel1Id==tree1.id}">
                        <li>
                            <div class="name"><a href="#">${product.name}</a></div>
                            <div class="price">
                                <font>￥<span>${product.price}</span></font> &nbsp; 26R
                            </div>
                            <div class="img"><a href="client/clientServlet?action=findProductDetail&id=${product.id}"><img src="files/${product.fileName}" width="185" height="155" /></a></div>
                        </li>
                    </c:if>
                </c:forEach>
            </ul>
        </div>
        <div class="fresh_right">
        	<ul>
            	<li><a href="#"><img src="static/images/fre_b1.jpg" width="260" height="220" /></a></li>
                <li><a href="#"><img src="static/images/fre_b2.jpg" width="260" height="220" /></a></li>
            </ul>
        </div>
    </div>
    <!--End 进口 生鲜 End-->
    </c:forEach>
    <!--Begin 猜你喜欢 Begin-->
    <div class="i_t mar_10">
    	<span class="fl">猜你喜欢</span>
    </div>
    <div class="like">
        <div id="featureContainer1">
            <div id="feature1">
                <div id="block1">
                    <div id="botton-scroll1">
                        <ul class="featureUL">
                            <li class="featureBox">
                                <div class="box">
                                    <div class="imgbg">
                                        <a href="#"><img src="static/images/hot1.jpg" width="160" height="136" /></a>
                                    </div>
                                    <div class="name">
                                        <a href="#">
                                        <h2>德国进口</h2>
                                        德亚全脂纯牛奶200ml*48盒
                                        </a>
                                    </div>
                                    <div class="price">
                                        <font>￥<span>189</span></font> &nbsp; 26R
                                    </div>
                                </div>
                            </li>
                            <li class="featureBox">
                                <div class="box">
                                    <div class="imgbg">
                                        <a href="#"><img src="static/images/hot2.jpg" width="160" height="136" /></a>
                                    </div>
                                    <div class="name">
                                        <a href="#">
                                        <h2>iphone 6S</h2>
                                        Apple/苹果 iPhone 6s Plus公开版
                                        </a>
                                    </div>
                                    <div class="price">
                                        <font>￥<span>5288</span></font> &nbsp; 25R
                                    </div>
                                </div>
                            </li>
                            <li class="featureBox">
                                <div class="box">
                                    <div class="imgbg">
                                        <a href="#"><img src="static/images/hot3.jpg" width="160" height="136" /></a>
                                    </div>
                                    <div class="name">
                                        <a href="#">
                                        <h2>倩碧特惠组合套装</h2>
                                        倩碧补水组合套装8折促销
                                        </a>
                                    </div>
                                    <div class="price">
                                        <font>￥<span>368</span></font> &nbsp; 18R
                                    </div>
                                </div>
                            </li>
                            <li class="featureBox">
                                <div class="box">
                                    <div class="imgbg">
                                        <a href="#"><img src="static/images/hot4.jpg" width="160" height="136" /></a>
                                    </div>
                                    <div class="name">
                                        <a href="#">
                                        <h2>品利特级橄榄油</h2>
                                        750ml*4瓶装组合 西班牙原装进口
                                        </a>
                                    </div>
                                    <div class="price">
                                        <font>￥<span>280</span></font> &nbsp; 30R
                                    </div>
                                </div>
                            </li>
                            <li class="featureBox">
                                <div class="box">
                                    <div class="imgbg">
                                        <a href="#"><img src="static/images/hot4.jpg" width="160" height="136" /></a>
                                    </div>
                                    <div class="name">
                                        <a href="#">
                                        <h2>品利特级橄榄油</h2>
                                        750ml*4瓶装组合 西班牙原装进口
                                        </a>
                                    </div>
                                    <div class="price">
                                        <font>￥<span>280</span></font> &nbsp; 30R
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <a class="l_prev" href="">Previous</a>
                <a class="l_next" href="">Next</a>
            </div>
        </div>
    </div>
    <!--End 猜你喜欢 End-->
    <!--Begin Footer Begin -->
    <%@include file="/common/front/footer.jsp"%>
    <!--End Footer End -->
</div>
</body>
<!--[if IE 6]>
<script src="//letskillie6.googlecode.com/svn/trunk/2/zh_CN.js"></script>
<![endif]-->
</html>

