<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <%--   静态引入base标签--%>
  <%@include file="/common/front/baseAndjs.jsp" %>
<%--  <script src="${ctx}/statics/js/backend/backend.js"></script>--%>
    <script type="text/javascript" src="static/js/jquery-1.11.1.min_044d0927.js"></script>
    <script type="text/javascript" src="static/js/jquery.bxslider_e88acd1b.js"></script>
    <script type="text/javascript" src="static/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="static/js/menu.js"></script>

    <script type="text/javascript" src="static/js/select.js"></script>
</head>

<body>
<%@include file="/common/backend/header.jsp"%>
<%@ include file="/common/backend/searchBar.jsp" %>
<!--End Header End-->


<div class="i_bg bg_color">
  <!--Begin 用户中心 Begin -->
  <div class="m_content">
    <%@ include file="/common/backend/leftBar.jsp"%>


    <div class="m_right" id="content">
      <p></p>
      <div class="mem_tit">订单明细列表</div>
      <table border="0" class="order_tab" style="width:930px; text-align:center; margin-bottom:30px;" cellspacing="0" cellpadding="0">
        <tbody>
        <tr>
          <td width="20%">商品名称</td>
          <td width="20%">商品图片</td>
          <td width="25%">数量</td>
          <td width="25%">价格</td>
        </tr>
        <c:forEach items="${requestScope.detail}" var="temp">
          <c:if test="${temp.id==requestScope.id}">
            <tr>
              <td>
                <a href="" target="_blank">
                    ${temp.name}
                </a>
              </td>
              <td>
                <img src="files/${temp.fileName}" width="50" height="50">
              </td>
              <td>${temp.quantity}件</td>
              <td>￥${temp.cost}</td>
            </tr>
          </c:if>
        </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
  <%@ include file="/common/front/footer.jsp" %>
</div>
</body>
</html>


