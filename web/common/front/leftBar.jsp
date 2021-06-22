<%--
  Created by IntelliJ IDEA.
  User: 22498
  Date: 2021/5/25
  Time: 17:31>
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="m_left">
    <div class="left_n">管理中心</div>
    <div class="left_m">
        <div class="left_m_t t_bg1">我的管理</div>
        <ul>
            <li><a href="frontdesk/Member/Member_User.jsp">用户信息</a></li>
            <li><a href="client/clientOrderServlet?action=findMyOrder&userId=${sessionScope.login.id}">我的订单</a></li>
            <li><a href="frontdesk/Member/Member_Address.jsp">收货地址</a></li>
            <li><a href="#">跟踪订单</a></li>
            <li><a href="frontdesk/Member/Member_Collect.jsp">我的收藏</a></li>
        </ul>
    </div>

</div>
</%--
Created by IntelliJ IDEA.
User: 22498
Date: 2021/5/25
Time: 17:31>