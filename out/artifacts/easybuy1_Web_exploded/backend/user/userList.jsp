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
    <script type="text/javascript">
        $(function (){
            $(".delete").click(function (){
                return confirm("你确定删除 "+$(this).parent().parent().find("td:first-child").text()+" 吗？")
            })
        })
    </script>
    <title></title>
</head>
<body>
<!--End Header End-->
<%@include file="/common/front/header.jsp"%>
<%@ include file="/common/backend/searchBar.jsp" %>
<div class="i_bg bg_color">
    <!--Begin 用户中心 Begin -->
    <div class="m_content">
        <%@ include file="/common/backend/leftBar.jsp" %>
        <div class="m_right" id="content">
            <div class="mem_tit">用户列表</div>
            <p align="right">
                <a href="backend/user/toUpdateUser.jsp?method=adduser&pageNum=${requestScope.pages.pageTotal}"  class="add_b">添加用户</a>
                <br>
            </p>
            <br>
            <table border="0" class="order_tab" style="width:930px; text-align:center; margin-bottom:30px;"
                   cellspacing="0" cellpadding="0">
                <tbody>
                <tr>
                    <td width="10%">用户名称</td>
                    <td width="10%">真实姓名</td>
                    <td width="5%">性别</td>
                    <td width="5%">类型</td>
                    <td width="5%" colspan="2">操作</td>
                </tr>
                <c:forEach items="${requestScope.pages.items}" var="users">
                    <tr>
                        <td>${users.loginName}</td>
                        <td>${users.userName}</td>
                        <td>
                            <c:choose>
                                <c:when test="${users.sex==1}">
                                    男
                                </c:when>
                                <c:otherwise>
                                    女
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${users.type==1}">
                                    管理员
                                </c:when>
                                <c:otherwise>
                                    用户
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <a href="manager/manageruserServlet?action=finduser&method=updateuser&username=${users.userName}&pageNum=${requestScope.pages.pageNum}">修改</a>
                        </td>
                        <td>
                           	 <a class="delete" href="manager/manageruserServlet?action=deleteuser&id=${users.id}&pageNum=${requestScope.pages.pageNum}">删除</a>
                        </td>
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


