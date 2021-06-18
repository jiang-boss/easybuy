<%--
  Created by IntelliJ IDEA.
  User: 22498
  Date: 2021/5/25
  Time: 10:05
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" >
</script>
<!--Begin Menu Begin-->
<div class="menu_bg">
<%--    <input type="button" id="mybtn" value="dfmskfds">--%>
    <div class="menu">
        <!--Begin 商品分类详情 Begin-->
        <div class="nav">
            <div class="nav_t">全部商品分类</div>
            <div class="leftNav">
                <ul>
<%--        varStatus下标的索引--%>
                    <c:forEach items="${sessionScope.treeCategory}" var="Tree1" varStatus="count0">
                        <li>
                            <div class="fj">
                                <span class="n_img"><span></span><img src="static/images/nav1.png"/></span>
                                <span class="fl">${Tree1.name}</span>
                            </div>
                            <div class="zj" style="top:-${(count0.count-1) * 40}px">
                                    <div class="zj_l">
                                        <c:forEach items="${Tree1.child}" var="Tree2">
                                        <div class="zj_l_c">
                                            <h2>${Tree2.name}</h2>
                                            <c:forEach items="${Tree2.child}" var="Tree3">
<%--                                                将三级分类的id转给服务器以便查找下面的商品--%>
                                                <a class="tree3id" href="client/clientServlet?action=pagecategory&id=${Tree3.id}" >${Tree3.name}</a>
                                            </c:forEach>
                                        </div>
                                        </c:forEach>
                                        <div class="zj_r">
                                            <a href="#"><img src="static/images/n_img1.jpg" width="236"
                                                             height="200"/></a>
                                            <a href="#"><img src="static/images/n_img2.jpg" width="236"
                                                             height="200"/></a>
                                        </div>
                                    </div>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <!--End 商品分类详情 End-->
        <ul class="menu_r">
            <li><a href="index.jsp">首页</a></li>
            <c:forEach items="${sessionScope.treeCategory}" var="tree">
                <li><a href="#${tree.id}">${tree.name}</a></li>
            </c:forEach>
        </ul>
        <div class="m_ad">618大放送！</div>
    </div>
</div>
<!--End Menu End-->
