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
  <script type="text/javascript">
    $(function (){
      $(".deletepro").click(function (){
        return confirm("你确定删除产品"+$(this).parent().parent().find("td:first-child").text()+"吗?");
      })
    })
  </script>
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
      <div class="mem_tit">商品列表</div>
      <br>
      <table border="0" class="order_tab" style="width:930px; text-align:center; margin-bottom:30px;" cellspacing="0" cellpadding="0">
        <tbody>
        <tr>
          <td width="10%">商品名称</td>
          <td width="10%">商品图片</td>
          <td width="5%">库存</td>
          <td width="10%">价格</td>
          <td width="10%" colspan="2">操作</td>
        </tr>
        <c:forEach items="${requestScope.pages.items}" var="temp">
          <tr>
            <td>${temp.name}</td>
            <td>
              <a href="client/clientServlet?action=findProductDetail&id=${temp.id}" target="_blank">
                  <img src="files/${temp.fileName}" width="50" height="50"/>
              </a>
            </td>
            <td>${temp.stock}</td>
            <td>${temp.price}</td>
            <td>
              <a href="manager/productServlet?action=findProduct&method=updateproduct&productid=${temp.id}&pageNum=${requestScope.pages.pageNum}">修改</a>
            </td>
            <td>
              <a class="deletepro" href="manager/productServlet?action=deleteProduct&id=${temp.id}&pageNum=${requestScope.pages.pageNum}">删除</a>
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


