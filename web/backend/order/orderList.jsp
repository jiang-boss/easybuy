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
<%@include file="/common/front/header.jsp"%>
<%@ include file="/common/backend/searchBar.jsp" %>
<!--End Header End-->
<div class="i_bg bg_color">
  <!--Begin 用户中心 Begin -->
  <div class="m_content">
    <%@ include file="/common/backend/leftBar.jsp"%>
    <div class="m_right" id="content">
      <p></p>
      <p></p>
      <div class="mem_tit">订单列表</div>
      <table border="0" class="order_tab" style="width:930px; text-align:center; margin-bottom:30px;" cellspacing="0" cellpadding="0">
        <tbody>
        <c:forEach items="${requestScope.pages.items}" var="orders">
          <tr class="td_bg">
            <td>用户名:${orders.loginName}</td>
            <td><a href="manager/orderServlet?action=orderDetail&id=${orders.id}">订单号:${orders.serialNumber}</a></td>
            <td>地址:${orders.userAddress}</td>
            <td>￥${orders.cost}</td>
          </tr>
          <tr>
          </tr>
          <tr>
            <td colspan="4">
              <table border="0" class="order_tab" style="width:930px; text-align:center; margin-bottom:30px;" cellspacing="0" cellpadding="0">
                <tbody>
                <tr>
                  <td width="20%">商品名称</td>
                  <td width="20%">商品图片</td>
                  <td width="25%">数量</td>
                  <td width="25%">价格</td>
                </tr>
                <c:forEach items="${requestScope.orders}" var="item">
                    <c:if test="${orders.id==item.id}">
                        <tr>
                            <td>${item.name}</td>
                            <td>
                                <a href="" target="_blank">
                                    <img src="files/${item.fileName}" width="50" height="50">
                                </a>
                            </td>
                            <td>${item.quantity}件</td>
                            <td>￥${item.cost}</td>
                        </tr>
                    </c:if>
                </c:forEach>
                </tbody>
              </table>
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


