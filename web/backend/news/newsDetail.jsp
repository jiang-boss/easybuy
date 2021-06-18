<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%--   静态引入base标签--%>
    <%@include file="/common/front/baseAndjs.jsp" %>
<%--    <link type="text/css" rel="stylesheet" href="${ctx}/statics/css/style.css" />--%>
        <script type="text/javascript" src="static/js/jquery-1.8.2.min.js"></script>
        <script type="text/javascript" src="static/js/menu.js"></script>
        <script type="text/javascript" src="static/js/select.js"></script>
</head>
<body>
<%@include file="/common/front/header.jsp"%>
<%@ include file="/common/backend/searchBar.jsp" %>
<div class="i_bg bg_color">
    <!--Begin 用户中心 Begin -->
	<div class="m_content">
        <%@ include file="/common/backend/leftBar.jsp"%>
		<div class="m_right">
            <p></p>
            <div class="mem_tit">${requestScope.newsOne.title}</div>
            <p style="padding:0 40px; margin:0 auto 20px auto;">
                ${requestScope.newsOne.content}
            </p>
        </div>
    </div>
	<!--End 用户中心 End--> 
    <!--Begin Footer Begin -->
    <%@ include file="/common/front/footer.jsp" %>
    <!--End Footer End -->    
</div>
</body>
</html>
