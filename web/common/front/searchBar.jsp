<%--
  Created by IntelliJ IDEA.
  User: 22498
  Date: 2021/5/25
  Time: 9:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="top">
    <div class="logo"><a href="index.jsp"><img src="static/images/logo.png" /></a></div>
    <div class="search">
        <form action="client/clientServlet">
            <input type="text" value="" class="s_ipt" />
            <input type="submit" value="搜索" class="s_btn" />
        </form>
    </div>
    <div class="i_car">

    <c:if test="${empty sessionScope.login}">
        <div class="car_t">购物车</div>
    </c:if>

    <c:if test="${not empty sessionScope.login}">
        <div class="car_t">购物车<span id="countspan">${sessionScope.cart.count}件</span></div>
    </c:if>
        <div class="car_bg">
            <c:if test="${empty sessionScope.login}">
                <div class="un_login">还未登录！<a href="frontdesk/User/Login.jsp" style="color:#ff4e00;">马上登录</a> 查看购物车！</div>
                <!--End 购物车未登录 End-->
            </c:if>

            <c:if test="${not empty sessionScope.login}">
                <div class="un_login">用户：${sessionScope.login.loginName}</div>
<%--                登录成功也有两种判断--%>
                <c:if test="${empty sessionScope.cart.cartItemMap}">
                    <ul class="cars" id="clientCar">
                        <div style="text-align: center"><font color="#ff4e00">购物车没有商品请去添加点商品吧！！！</font></div>
                    </ul>
                    <!--Begin 购物车已登录 Begin-->
                    <div class="price_sum">共计&nbsp;<font color="#ff4e00">￥</font><span class="priceTotal">${sessionScope.cart.totalPrice}</span></div>
                    <div class="price_a"><a href="frontdesk/buycar/BuyCar.jsp">去购物车结算</a></div>
                </c:if>

                <c:if test="${not empty sessionScope.cart.cartItemMap}">
<%--                    这里是每个商品项--%>
                    <ul class="cars" id="clientCar">
                        <c:forEach items="${sessionScope.cart.cartItemMap}" var="cartItem">
                            <li>
                                <div class="img"><a href="#"><img src="files/${cartItem.value.fileName}" width="58" height="58"/></a></div>
                                <div class="name"><a href="#">${cartItem.value.name}</a></div>
                                <div class="price"><font color="#ff4e00">￥${cartItem.value.price}</font>X${cartItem.value.count}</div>
                            </li>
                        </c:forEach>
                    </ul>
                    <!--Begin 购物车已登录 Begin-->
                    <div class="price_sum">共计&nbsp;<font color="#ff4e00">￥</font><span class="priceTotal">${sessionScope.cart.totalPrice}</span></div>
                    <div class="price_a"><a href="frontdesk/buycar/BuyCar.jsp">去购物车结算</a></div>
                </c:if>
                <!--End 购物车已登录 End-->
            </c:if>
        </div>
    </div>
</div>