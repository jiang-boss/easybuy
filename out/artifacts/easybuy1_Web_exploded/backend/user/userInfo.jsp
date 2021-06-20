<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <%@include file="/common/front/baseAndjs.jsp"%>
<%--    <script src="${ctx}static/js/backend/backend.js"></script>--%>

    <script type="text/javascript" src="static/js/jquery-1.11.1.min_044d0927.js"></script>
    <script type="text/javascript" src="static/js/jquery.bxslider_e88acd1b.js"></script>
    <script type="text/javascript" src="static/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="static/js/menu.js"></script>

    <script type="text/javascript" src="static/js/select.js"></script>
    <title></title>
</head>

<body>
<%@ include file="/common/front/header.jsp"%>
<%@ include file="/common/backend/searchBar.jsp" %>
<!--End Header End-->
<div class="i_bg bg_color">
    <!--Begin 用户中心 Begin -->
    <div class="m_content">
        <%@ include file="/common/backend/leftBar.jsp"%>
        <div class="m_right" id="content">
            <div class="m_des">
                <table border="0" style="width:870px; line-height:22px;" cellspacing="0" cellpadding="0">
                    <tr valign="top">
                        <td width="115"><img src="static/images/user.jpg" width="90" height="90" /></td>
                        <td>
                            <div class="m_user">${sessionScope.login.loginName}</div><br />
                            <p>
                                性别:
                                <c:if test="${not empty sessionScope.login}">
                                    <c:choose>
                                        <c:when test="${sessionScope.login.sex==1}">男</c:when>
                                        <c:otherwise>女</c:otherwise>
                                    </c:choose>
                                </c:if>
                                <br /><br />
                                邮箱：${sessionScope.login.email}
                                <br /><br />
                                电话:${sessionScope.login.mobile}<br /><br />
                            </p>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <%@ include file="/common/front/footer.jsp" %>
</div>
</body>
</html>

















