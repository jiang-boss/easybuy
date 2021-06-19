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
    </script>
    <script type="text/javascript" src="static/js/shade.js"></script>

    <script type="text/javascript">
        $(function (){
            // alert(dsdsd)
            $(".deleteCart").click(function (){
                return  confirm("你确定删除该商品吗？")
            })
            //这里处理商品数量的操作
            $(".car_btn_2").click(function (){
                var obj=$(this).parent().find("input:first-child").next()
                var num=parseInt(obj.val())
                obj.val(num+1);
                obj.change();
            })
            $(".car_btn_1").click(function (){
                var obj=$(this).parent().find("input:first-child").next()
                var num=parseInt($(this).parent().find("input:first-child").next().val())
                if (num<=0){
                    obj.val(0);
                }else {
                    obj.val(num-1);
                }
                obj.change();
            })
            $(".car_ipt").change(function (){
                //这里处理修改商品数量的操作
                var id=$(this).attr("productId")
                var count=$(this).val();
                // alert(id)
                // alert(count);
                location.href="http://localhost:8080/yimaiwang/client/cartServlet?action=updateCartItem&id="+id+"&count="+count;
            })
        })
    </script>
<title>尤洪</title>
</head>
<body>  
<!--Begin Header Begin-->
<%@include file="/common/front/header.jsp"%>
<%@include file="/common/front/searchBar.jsp"%>
<!--End Header End-->


<!--Begin Menu Begin-->
<%@include file="/common/front/menu.jsp"%>
<!--End Menu End-->

<div class="i_bg">  
    <div class="content mar_20">
    	<img src="static/images/img1.jpg" />
    </div>
    <!--Begin 第一步：查看购物车 Begin -->
    <div class="content mar_20">
    	<table border="0" class="car_tab" style="width:1200px; margin-bottom:50px;" cellspacing="0" cellpadding="0">
          <tr>
            <td class="car_th" width="490">商品名称</td>
<%--            <td class="car_th" width="140">属性</td>--%>
            <td class="car_th" width="150">购买数量</td>
            <td class="car_th" width="130">小计</td>
            <td class="car_th" width="140">返还积分</td>
            <td class="car_th" width="150">操作</td>
          </tr>
            <c:if test="${empty sessionScope.cart.cartItemMap}">
                <tr>
                    <td><div><img src="files/cartempty.gif" width="400" height="300"/></div></td>
                    <td><a href="index.jsp" style="font-size: 25px">购物车为空 快去添加商品吧！！！</a></td>
                </tr>
            </c:if>
            <c:if test="${not empty sessionScope.cart.cartItemMap}">

                <c:forEach items="${sessionScope.cart.cartItemMap}" var="items" >
                    <tr class="car_tr">
                        <td style="text-align: center">
                            <div class="c_s_img"><img src="files/${items.value.fileName}" width="60" height="73" /></div>
                            ${items.value.name}
                        </td>
                        <td align="center">
                            <div class="c_num">
                                <input type="button" value=""  class="car_btn_1" />
                                <input type="text" value="${items.value.count}" productId="${items.value.id}" class="car_ipt" />
                                <input type="button" value=""  class="car_btn_2" />
                            </div>
                        </td>
                        <td align="center" style="color:#ff4e00;">${items.value.totalPrice}</td>
                        <td align="center">26R</td>
<%--                        q清空商品项--%>
                        <td align="center"><a class="deleteCart"  href="client/cartServlet?action=deleteCartItem&id=${items.value.id}">删除</a>&nbsp; &nbsp;<a href="#">加入收藏</a></td>
                    </tr>
                </c:forEach>

          <tr height="70">
          	<td colspan="6" style="font-family:'Microsoft YaHei'; border-bottom:0;">
            	<label class="r_rad"><input type="checkbox" name="clear" checked="checked" /></label><label class="r_txt">清空购物车</label>
                <span class="fr">商品总价：<b style="font-size:22px; color:#ff4e00;">${sessionScope.cart.totalPrice}</b></span>
            </td>
          </tr>
          <tr valign="top" height="150">
          	<td colspan="6" align="right">
            	<a href="index.jsp"><img src="static/images/buy1.gif" /></a>&nbsp; &nbsp; <a href="frontdesk/buycar/BuyCar_Two.jsp"><img src="static/images/buy2.gif" /></a>
            </td>
          </tr>
            </c:if>
        </table>
    </div>
	<!--End 第一步：查看购物车 End-->
    <!--Begin 弹出层-删除商品 Begin-->
    <div id="fade" class="black_overlay"></div>
    <div id="MyDiv" class="white_content">             
        <div class="white_d">
            <div class="notice_t">
                <span class="fr" style="margin-top:10px; cursor:pointer;" onclick="CloseDiv('MyDiv','fade')"><img src="static/images/close.gif" /></span>
            </div>
            <div class="notice_c">
                <table border="0" align="center" style="font-size:16px;" cellspacing="0" cellpadding="0">
                  <tr valign="top">
                    <td>您确定要把该商品移除购物车吗？</td>
                  </tr>
                  <tr height="50" valign="bottom">
                    <td><a href="#" class="b_sure">确定</a><a href="#" class="b_buy">取消</a></td>
                  </tr>
                </table>
            </div>
        </div>
    </div>    
    <!--End 弹出层-删除商品 End-->
    <!--Begin Footer Begin -->
    <%@include file="/common/front/footer.jsp"%>
    <!--End Footer End -->
</div>
</body>
<!--[if IE 6]>
<script src="//letskillie6.googlecode.com/svn/trunk/2/zh_CN.js"></script>
<![endif]-->
</html>
