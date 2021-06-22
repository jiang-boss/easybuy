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
	<script type="text/javascript" src="static/js/lrscroll_1.js"></script>
	<script type="text/javascript" src="static/js/n_nav.js"></script>
    
    <link rel="stylesheet" type="text/css" href="static/css/ShopShow.css" />
    <link rel="stylesheet" type="text/css" href="static/css/MagicZoom.css" />
    <script type="text/javascript" src="static/js/MagicZoom.js"></script>
    
    <script type="text/javascript" src="static/js/num.js">
    	var jq = jQuery.noConflict();
    </script>
        
    <script type="text/javascript" src="static/js/p_tab.js"></script>
    <script type="text/javascript" src="static/js/shade.js"></script>
        <script type="text/javascript">
            $(function (){
                $("#addcarp").click(function (){
                    var id=$(this).attr("productID")
                    //这里能得到需要添加的数量
                    var num=parseInt($(".n_ipt").val());
                    // alert(id)
                    if (num==1){
                        $.getJSON("${pageScope.basepath}client/cartServlet","action=addProductAjax&id="+id,function (data){
                            //局部刷新购物车中的数量
                            $("#countspan").text(data.totalCount+"件")
                            $("#clientCar").text("")//先把上面的商品项清空再把写上去
                            $.each(data.cartMaps,function (i,n){
                                // alert(n.name)//得到商品的名称
                                $("#clientCar").append("<li><div class='img'><a href='#'><img src='files/"+n.fileName+"' width='58' height='58'/></a></div> " +
                                    "<div class='name'><a href='#'>"+n.name+"</a></div>"+"<div class='price'><font color='#ff4e00'>￥"+n.price+"</font>X"+n.count+"</div>"+"</li>")
                            })
                            $(".priceTotal").text(data.totalPrice)
                            //设置弹窗中的显示
                            $("#span1").text(data.Species);
                            $("#span2").text(data.totalCount);
                            $("#span3").text(data.totalPrice)
                        })
                    }else{
                        $.getJSON("${pageScope.basepath}client/cartServlet","action=addProductAjax2&id="+id+"&num="+num,function (data){
                            //局部刷新购物车中的数量
                            $("#countspan").text(data.totalCount+"件")
                            $("#clientCar").text("")//先把上面的商品项清空再把写上去
                            $.each(data.cartMaps,function (i,n){
                                // alert(n.name)//得到商品的名称
                                $("#clientCar").append("<li><div class='img'><a href='#'><img src='files/"+n.fileName+"' width='58' height='58'/></a></div> " +
                                    "<div class='name'><a href='#'>"+n.name+"</a></div>"+"<div class='price'><font color='#ff4e00'>￥"+n.price+"</font>X"+n.count+"</div>"+"</li>")
                            })
                            $(".priceTotal").text(data.totalPrice)
                            //设置弹窗中的显示
                            $("#span1").text(data.Species);
                            $("#span2").text(data.totalCount);
                            $("#span3").text(data.totalPrice)
                        })
                    }
                    ShowDiv_1("MyDiv1","fade1")
                })
            })
        </script>
    
<title>尤洪</title>
</head>
<body>
<!--Begin Header Begin-->
    <%@include file="/common/backend/header.jsp"%>
<%@include file="/common/front/searchBar.jsp"%>
<!--End Header End-->
<!--Begin Menu Begin-->
<%@include file="/common/front/menu.jsp"%>
<!--End Menu End--> 
<div class="i_bg">
	<div class="postion">
    	<span class="fl">全部 > 美妆个护 > 香水 > 迪奥 > 迪奥真我香水</span>
    </div>    
    <div class="content">
    	                    
        <div id="tsShopContainer">
            <div id="tsImgS"><a href="files/${requestScope.productDetail.fileName}" title="Images" class="MagicZoom" id="MagicZoom"><img src="files/${requestScope.productDetail.fileName}" width="390" height="390" /></a></div>
            <div id="tsPicContainer">
            </div>
            <img class="MagicZoomLoading" width="16" height="16" src="static/images/loading.gif" alt="Loading..." />
        </div>
        
        <div class="pro_des">
        	<div class="des_name">
            	<p>${requestScope.productDetail.name}</p>
                “开业巨惠，北京专柜直供”，不光低价，“真”才靠谱！
            </div>
            <div class="des_price">
            	本店价格：<b>￥${requestScope.productDetail.price}</b><br />
                消费积分：<span>28R</span>
            </div>
            <div class="des_choice">
            	<span class="fl">库存：</span>&nbsp;${requestScope.productDetail.stock}
                </ul>
            </div>
            <div class="des_share">
            	<div class="d_sh">
                	分享
                    <div class="d_sh_bg">
                    	<a href="#"><img src="static/images/sh_1.gif" /></a>
                        <a href="#"><img src="static/images/sh_2.gif" /></a>
                        <a href="#"><img src="static/images/sh_3.gif" /></a>
                        <a href="#"><img src="static/images/sh_4.gif" /></a>
                        <a href="#"><img src="static/images/sh_5.gif" /></a>
                    </div>
                </div>
                <div class="d_care"><a onclick="ShowDiv('MyDiv','fade')">关注商品</a></div>
            </div>
            <div class="des_join">
            	<div class="j_nums">
                	<input type="text" value="1" name="" class="n_ipt" />
                    <input type="button" value="" onclick="addUpdate(jq(this));" class="n_btn_1" />
                    <input type="button" value="" onclick="jianUpdate(jq(this));" class="n_btn_2" />   
                </div>
                <span class="fl"><a id="addcarp" productID="${requestScope.productDetail.id}" ><img src="static/images/j_car.png" /></a></span>
<%--                                <span class="fl"><a onclick="ShowDiv_1('MyDiv1','fade1')"><img src="static/images/j_car.png" /></a></span>--%>
            </div>            
        </div>    
        

    </div>

    <!--Begin 弹出层-收藏成功 Begin-->
    <div id="fade" class="black_overlay"></div>
    <div id="MyDiv" class="white_content">             
        <div class="white_d">
            <div class="notice_t">
                <span class="fr" style="margin-top:10px; cursor:pointer;" onclick="CloseDiv('MyDiv','fade')"><img src="static/images/close.gif" /></span>
            </div>
            <div class="notice_c">
           		
                <table border="0" align="center" style="margin-top:0px;" cellspacing="0" cellpadding="0">
                  <tr valign="top">
                    <td width="40"><img src="static/images/suc.png" /></td>
                    <td>
                    	<span style="color:#3e3e3e; font-size:18px; font-weight:bold;">您已成功收藏该商品</span><br />
                    	<a href="#">查看我的关注 >></a>
                    </td>
                  </tr>
                  <tr height="50" valign="bottom">
                  	<td>&nbsp;</td>
                    <td><a href="#" class="b_sure">确定</a></td>
                  </tr>
                </table>
                    
            </div>
        </div>
    </div>    
    <!--End 弹出层-收藏成功 End-->
    <!--Begin 弹出层-加入购物车 Begin-->
    <div id="fade1" class="black_overlay"></div>
    <div id="MyDiv1" class="white_content">             
        <div class="white_d">
            <div class="notice_t">
                <span class="fr" style="margin-top:10px; cursor:pointer;" onclick="CloseDiv_1('MyDiv1','fade1')"><img src="static/images/close.gif" /></span>
            </div>
            <div class="notice_c">
           		
                <table border="0" align="center" style="margin-top:0px;" cellspacing="0" cellpadding="0">
                  <tr valign="top">
                    <td width="40"><img src="static/images/suc.png" /></td>
                    <td >
                    	<span style="color:#3e3e3e; font-size:18px; font-weight:bold;">宝贝已成功添加到购物车</span><br />
                        购物车共有<span id="span1">${sessionScope.cart.species}</span>种宝贝（<span id="span2" >${sessionScope.cart.count}</span>件） &nbsp; &nbsp; 合计<span id="span3">${sessionScope.cart.totalPrice}</span>元
                    </td>
                  </tr>
                  <tr height="50" valign="bottom">
                  	<td>&nbsp;</td>
                    <td><a href="frontdesk/buycar/BuyCar.jsp" class="b_sure">去购物车结算</a><a href="#" class="b_buy">继续购物</a></td>
                  </tr>
                </table>
                    
            </div>
        </div>
    </div>    
    <!--End 弹出层-加入购物车 End-->

    <!--Begin Footer Begin -->
    <%@include file="/common/front/footer.jsp"%>
    <!--End Footer End -->    
</div>
</body>
<script src="static/js/ShopShow.js"></script>

<!--[if IE 6]>
<script src="//letskillie6.googlecode.com/svn/trunk/2/zh_CN.js"></script>
<![endif]-->
</html>
