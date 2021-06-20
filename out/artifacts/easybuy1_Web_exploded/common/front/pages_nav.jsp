<%--
  Created by IntelliJ IDEA.
  User: 22498
  Date: 2021/5/25
  Time: 16:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="pages">
    <c:if test="${requestScope.pages.pageNum>1}">
        <a href="${requestScope.pages.uri}&pageNum=1&id=${requestScope.id}" class="p_pre">首页</a>
        <a href="${requestScope.pages.uri}&pageNum=${requestScope.pages.pageNum-1}&id=${requestScope.id}" class="p_pre">上一页</a>
    </c:if>

    <c:choose>
        <%--判断分页情况--%>
        <c:when test="${requestScope.pages.pageTotal<=5}">
            <c:set var="begin" value="1"/>
            <c:set var="end" value="${requestScope.pages.pageTotal}" />
        </c:when>
<%--        第二种当分页大于五页  里面也有三种情况--%>
        <c:when test="${requestScope.pages.pageTotal>5}">
            <c:choose>
                <c:when test="${requestScope.pages.pageNum<=3}">
                    <c:set var="begin" value="1"/>
                    <c:set var="end" value="5"/>
                </c:when>
                <c:when test="${requestScope.pages.pageNum>requestScope.pages.pageTotal-2}">
                    <c:set var="begin" value="${requestScope.pages.pageTotal-4}"/>
                    <c:set var="end" value="${requestScope.pages.pageTotal}"/>
                </c:when>
                <c:otherwise>
                    <c:set var="begin" value="${requestScope.pages.pageNum-2}"/>
                    <c:set var="end" value="${requestScope.pages.pageNum+2}"/>
                </c:otherwise>
            </c:choose>
        </c:when>
    </c:choose>

    <c:forEach begin="${begin}" end="${end}" var="number">
        <c:if test="${number==requestScope.pages.pageNum}">
            <a href="${requestScope.pages.uri}&pageNum=${number}&id=${requestScope.id}" class="cur">${number}</a>
        </c:if>
        <c:if test="${number!=requestScope.pages.pageNum}">
            <a href="${requestScope.pages.uri}&pageNum=${number}&id=${requestScope.id}">${number}</a>
        </c:if>
    </c:forEach>

    <c:if test="${requestScope.pages.pageNum<requestScope.pages.pageTotal}">
        <a href="${requestScope.pages.uri}&pageNum=${requestScope.pages.pageNum+1}&id=${requestScope.id}" class="p_pre">下一页</a>
        <a href="${requestScope.pages.uri}&pageNum=${requestScope.pages.pageTotal}&id=${requestScope.id}" class="p_pre">尾页</a>
    </c:if>
</div>