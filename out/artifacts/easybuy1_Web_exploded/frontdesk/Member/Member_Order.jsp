<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%--   静态引入base标签--%>
    <%@include file="/common/front/baseAndjs.jsp"%>

    <script type="text/javascript" src="static/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="static/js/menu.js"></script>

    <script type="text/javascript" src="static/js/select.js"></script>
    <title>尤洪</title>
</head>
<body>
<!--Begin Header Begin-->
<%@include file="/common/backend/header.jsp"%>
<%@include file="/common/front/searchBar.jsp"%>
<!--End Header End-->
<div class="i_bg bg_color">
    <!--Begin 用户中心 Begin -->
    <div class="m_content">
        <%--        静态包含用户的左边栏--%>
        <%@include file="/common/front/leftBar.jsp"%>

        <div class="m_right">
            <p></p>
            <div class="mem_tit">我的订单</div>
            <table border="0" class="order_tab" style="width:930px; text-align:center; margin-bottom:30px;"
                   cellspacing="0" cellpadding="0">
                <tr>
                    <td width="20%">订单号</td>
                    <td width="25%">下单时间</td>
                    <td width="15%">订单总金额</td>
                    <td width="25%">收货地址</td>
                    <td width="15%">操作</td>
                </tr>
                <c:forEach items="${requestScope.orderList}" var="order_item">
                    <tr>
                        <td><font color="#ff4e00">${order_item.serialNumber}</font></td>
                        <td>${order_item.createTime}</td>
                        <td>${order_item.cost}</td>
                        <td>${order_item.userAddress}</td>
                        <td>取消订单</td>
                    </tr>
                </c:forEach>
            </table>


            <div class="mem_tit">合并订单</div>
            <table border="0" class="order_tab" style="width:930px;" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="135" align="right">主订单</td>
                    <td width="220">
                        <select class="jj" name="order1">
                            <option value="0" selected="selected">请选择...</option>
                            <option value="1">2015092626589</option>
                            <option value="2">2015092626589</option>
                            <option value="3">2015092626589</option>
                            <option value="4">2015092626589</option>
                        </select>
                    </td>
                    <td width="135" align="right">从订单</td>
                    <td width="220">
                        <select class="jj" name="order2">
                            <option value="0" selected="selected">请选择...</option>
                            <option value="1">2015092626589</option>
                            <option value="2">2015092626589</option>
                            <option value="3">2015092626589</option>
                            <option value="4">2015092626589</option>
                        </select>
                    </td>
                    <td>
                        <div class="btn_u"><a href="#">合并订单</a></div>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td colspan="4" style="font-family:'宋体'; padding:20px 10px 50px 10px;">
                        订单合并是在发货前将相同状态的订单合并成一新的订单。 <br/>
                        收货地址，送货方式等以主定单为准。
                    </td>
                </tr>
            </table>


        </div>
    </div>
    <!--End 用户中心 End-->


    <!--Begin Footer Begin -->
    <%@include file="/common/front/footer.jsp" %>
    <!--End Footer End -->
</div>

</body>


<!--[if IE 6]>
<script src="//letskillie6.googlecode.com/svn/trunk/2/zh_CN.js"></script>
<![endif]-->
</html>
