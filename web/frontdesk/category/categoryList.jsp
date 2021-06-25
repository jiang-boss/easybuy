<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%--   静态引入base标签--%>
    <%@include file="/common/front/baseAndjs.jsp" %>
<%--        <link rel="stylesheet" href="static/bootstrap-3.4.1-dist/css/bootstrap.min.css"/>--%>
        <script type="text/javascript" src="static/js/jquery-1.11.1.min_044d0927.js"></script>
        <script type="text/javascript" src="static/js/jquery.bxslider_e88acd1b.js"></script>
        <script type="text/javascript" src="static/js/jquery-1.8.2.min.js"></script>
        <script type="text/javascript" src="static/js/menu.js"></script>
<%--        <script type="text/javascript" src="static/js/shade.js"></script>--%>
    <script type="text/javascript" src="static/js/lrscroll_1.js"></script>
    <script type="text/javascript" src="static/js/n_nav.js"></script>
<%--        <script type="text/javascript" src="static/jquery-3.6.0.js"></script>--%>
<%--        <script type="text/javascript" src="static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>--%>

        <title>尤洪</title>
    <script type="text/javascript">
        $(function (){
            $(".j_car").click(function (){
                <%--alert("${pageScope.basepath}")--%>
                alert("添加商品成功！")
                //这里发送请求给服
                var id=$(this).attr("cartItemid")
                $.getJSON("${pageScope.basepath}client/cartServlet","action=addProductAjax&id="+id,function (data){
                    //局部刷新购物车中的数量
                    $("#countspan").text(data.totalCount+"件")
                    $("#clientCar").text("")//先把上面的商品项清空再把写上去
                    $.each(data.cartMaps,function (i,n){
                        // alert(n.name)//得到商品的名称
                        $("#clientCar").append("<li><div class='img'><a href='#'><img src='files/"+n.fileName+"' width='58' height='58'/></a></div> " +
                            "<div class='name'><a href='#'>"+n.name+"</a></div>"+"<div class='price'><font color='#ff4e00'>￥"+n.price+"</font>X"+n.count+"</div>"+"</li>")
                    })
                    $(".priceTotal").text(data.totalPrice)
                })
            })
        })
    </script>
</head>
<body>
<!--Begin Header Begin-->
<%@include file="/common/backend/header.jsp" %>
<%@include file="/common/front/searchBar.jsp" %>
<!--End Header End-->
<!--Begin Menu Begin-->
<%@include file="/common/front/menu.jsp" %>
<!--End Menu End-->

<div class="i_bg">

    <div class="content mar_20">
        <div class="l_history">
            <div class="his_t">
                <span class="fl">浏览历史</span>
                <span class="fr"><a href="#">清空</a></span>
            </div>
            <ul>
                <li>
                    <div class="img"><a href="#"><img src="static/images/his_1.jpg" width="185" height="162"/></a></div>
                    <div class="name"><a href="#">Dior/迪奥香水2件套装</a></div>
                    <div class="price">
                        <font>￥<span>368.00</span></font> &nbsp; 18R
                    </div>
                </li>
                <li>
                    <div class="img"><a href="#"><img src="static/images/his_2.jpg" width="185" height="162"/></a></div>
                    <div class="name"><a href="#">Dior/迪奥香水2件套装</a></div>
                    <div class="price">
                        <font>￥<span>768.00</span></font> &nbsp; 18R
                    </div>
                </li>
            </ul>
        </div>
        <div class="l_list">
            <div class="list_t">
            	<span class="fl list_or">
                	<a href="#" class="now">默认</a>
                    <a href="#">
                    	<span class="fl">销量</span>                        
                        <span class="i_up">销量从低到高显示</span>
                        <span class="i_down">销量从高到低显示</span>                                                     
                    </a>
                    <a href="#">
                    	<span class="fl">价格</span>                        
                        <span class="i_up">价格从低到高显示</span>
                        <span class="i_down">价格从高到低显示</span>     
                    </a>
                    <a href="#">新品</a>
                </span>
                <span class="fr">共发现${requestScope.pages.pageTotalCount}件</span>
            </div>
            <div class="list_c">
                <ul class="cate_list">
                    <c:forEach items="${requestScope.pages.items}" var="product">
                        <li>
                            <div class="img"><a href="client/clientServlet?action=findProductDetail&id=${product.id}"><img src="files/${product.fileName}" width="210" height="185"/></a>
                            </div>
                            <div class="price">
                                <font>￥<span>${product.price}</span></font> &nbsp 26R
                            </div>
                            <div class="name"><a href="#">${product.name}</a></div>
                            <div class="carbg">
                                <a href="#" class="ss">收藏</a>
                                <a class="j_car" id="addCart" cartItemid="${product.id}">加入购物车</a>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
                <%@include file="/common/front/pages_nav.jsp"%>
            </div>
        </div>
    </div>
    <!--Begin Footer Begin -->
    <%@include file="/common/front/footer.jsp" %>
    <!--End Footer End -->
</div>
<div class="modal fade" id="addSuccess" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            添加商品成功
        </div>
    </div>
</div>
</body>

<!--[if IE 6]>
<script src="//letskillie6.googlecode.com/svn/trunk/2/zh_CN.js"></script>
<![endif]-->
</html>
