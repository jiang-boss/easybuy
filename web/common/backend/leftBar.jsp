<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="m_left">
    <div class="left_n">管理中心</div>
    <div class="left_m">
        <div class="left_m_t t_bg1">订单中心</div>
        <ul>
<%--            <li><a href="backend/order/orderDetailList.jsp">详细订单</a></li>--%>
            <li><a href="manager/orderServlet?action=page">全部订单</a></li>
        </ul>
    </div>
    <div class="left_m">
        <div class="left_m_t t_bg2">会员中心</div>

        <ul>
            <li><a href="backend/user/userInfo.jsp">用户信息</a></li>
<%--            <li><a href="backend/user/toUpdateUser.jsp?method=adduser&pageNum=">添加用户</a></li>--%>
            <li><a href="manager/manageruserServlet?action=page">用户列表</a></li>
        </ul>
    </div>

    <div class="left_m">
        <div class="left_m_t t_bg2">商品管理</div>
        <ul>
            <li><a href="manager/productServlet?action=page">商品管理</a></li>
            <li><a href="manager/categoryServlet?action=findCategory1&method=addproduct">商品上架</a></li>
            <li><a href="manager/categoryServlet?action=page">分类管理</a></li>
        </ul>
    </div>
    <div class="left_m">
        <div class="left_m_t t_bg2">资讯中心</div>
        <ul>
            <li><a href="manager/newsservlet?action=page">资讯列表</a></li>
        </ul>
    </div>
</div>