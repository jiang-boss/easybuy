<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%--   静态引入base标签--%>
    <%@include file="/common/front/baseAndjs.jsp" %>

        <script type="text/javascript" src="static/js/jquery-1.8.2.min.js"></script>
        <script type="text/javascript" src="static/js/menu.js"></script>

        <script type="text/javascript" src="static/js/select.js"></script>

<%--    <link type="text/css" rel="stylesheet" href="${ctx}/statics/css/style.css" />--%>
</head>
<body>
<%@include file="/common/backend/header.jsp"%>
<%@ include file="/common/backend/searchBar.jsp" %>
<div class="i_bg bg_color">
    <!--Begin 用户中心 Begin -->
	<div class="m_content">
        <%@ include file="/common/backend/leftBar.jsp"%>
        <div class="m_right">
            <p></p>
            <div class="mem_tit">资讯列表</div>
            <table border="0" class="order_tab" style="width:930px; text-align:center; margin-bottom:30px;" cellspacing="0" cellpadding="0">
                <tbody>
                <tr>
                    <td width="20%">文章标题</td>
                    <td width="25%">创建时间</td>
                </tr>
                <c:forEach items="${requestScope.pages.items}" var="news">
                    <tr>
                        <td><a href="manager/newsservlet?action=getOneNews&id=${news.id}">${news.title}</a></td>
                        <td>${news.createTime}</td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
            <%@ include file="/common/front/pages_nav.jsp" %>
        </div>
    </div>
    <%@ include file="/common/front/footer.jsp" %>
</div>
</body>

</html>
