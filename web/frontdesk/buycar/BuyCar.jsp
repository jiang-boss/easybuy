<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%--   静态引入base标签--%>
    <%@include file="/common/front/baseAndjs.jsp"%>
    <script type="text/javascript" src="static/js/jquery-1.11.1.min_044d0927.js"></script>
    <script type="text/javascript" src="static/js/jquery.bxslider_e88acd1b.js"></script>
    <script type="text/javascript" src="static/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="static/js/menu.js"></script>
	<script type="text/javascript" src="static/js/n_nav.js"></script>
    <script type="text/javascript" src="static/js/num.js">
    </script>
    <script type="text/javascript" src="static/js/shade.js"></script>

    <script type="text/javascript">
        $(function (){
            // alert(dsdsd)
            $(".deleteCart").click(function (){
                return  confirm("你确定删除该商品吗？")
            })
            //这里处理商品数量的操作
            $(document).on("click",".car_btn_2",function (){
            // })
            // $(".car_btn_2").click(function (){

                var obj=$(this).parent().find("input:first-child").next()
                var num=parseInt(obj.val())
                obj.val(num+1)
                obj.change();
            })
            $(document).on("click",".car_btn_1",function (){

            // })
            // $(".car_btn_1").click(function (){
                var obj=$(this).parent().find("input:first-child").next()
                var num=parseInt($(this).parent().find("input:first-child").next().val())
                if (num<=0){
                    obj.val(0);
                }else {
                    obj.val(num-1);
                }
                obj.change();
            })
            $(document).on("change",".car_ipt",function (){
            //
            // })
            // $(".car_ipt").change(function (){

                //这里处理修改商品数量的操作
                var id=$(this).attr("productId")
                var num=$(this).val();
                // alert(id)
                // alert(count);
                // location.href="http://localhost:8080/yimaiwang/client/cartServlet?action=updateCartItem&id="+id+"&count="+count;
                //这里发送ajax请求异步刷新
                    $.getJSON("${pageScope.basepath}client/cartServlet","action=addProductAjax3&id="+id+"&num="+num,function (data){
                        //局部刷新购物车中的数量
                        $("#countspan").text(data.totalCount+"件")
                        $("#clientCar").text("")//先把上面的商品项清空再把写上去
                        $("#tbodyid").text("")
                        $.each(data.cartMaps,function (i,n){
                            // alert(n.name)//得到商品的名称
                            $("#clientCar").append("<li><div class='img'><a href='#'><img src='files/"+n.fileName+"' width='58' height='58'/></a></div> " +
                                "<div class='name'><a href='#'>"+n.name+"</a></div>"+"<div class='price'><font color='#ff4e00'>￥"+n.price+"</font>X"+n.count+"</div>"+"</li>")
                            var car_tr= $("<tr class='car_tr'></tr>");

                            var one=$("<td></td>").append("<input class='check_item' value='"+n.id+"'  thisPrice='"+n.price+"' speice='"+data.Species+"'  type='checkbox'/>")

                            var two=$("<td style='text-align: center'><div class='c_s_img''><img src='files/"+n.fileName+"'  width='60' height='73' /></div></td>")

                            var three=$("<td align='center'></td>")
                                .append("<div class='c_num'><input type='button' value=''  class='car_btn_1' /><input type='text' value='"+n.count+"' productId='"+n.id+"' class='car_ipt' /> <input type='button' value='' class='car_btn_2' /></div>")

                            var four=$(" <td  align='center' style='color:#ff4e00;'>"+n.totalPrice+"</td>")
                            var five=$("<td align='center'>26R</td>")
                            var six=$("<td align='center'></td>").append("<a class='deleteCart'>删除</a>&nbsp; &nbsp;<a href='#'>加入收藏</a>")
                            car_tr.append(one).append(two).append(three).append(four).append(five).append(six).appendTo($("#tbodyid"))
                        })
                        $(".priceTotal").text(data.totalPrice)
                        $("#totala").text(data.totalPrice)
                        //设置弹窗中的显示
                        // $("#span1").text(data.Species);
                        // $("#span2").text(data.totalCount);
                        // $("#span3").text(data.totalPrice)
                    })
            })
            //**********************************判断全选全不选的操作
            $("#clearCart").click(function (){
                // alert($(this).prop("checked"))
                $(".check_item").prop("checked",$(this).prop("checked"))
                if ($(this).prop("checked")){
                    $("#totalb").text($("#totala").text())
                }else {
                    $("#totalb").text("0")
                }
            })
            $(document).on("click",".check_item",function (){
            // })
            // $(".check_item").click(function (){
                // alert($(this).prop("checked"))
                var  flag=$(".check_item:checked").length==$(".check_item").attr("speice")
                $("#clearCart").prop("checked",flag)
                var totalPrice=0
                $.each($(".check_item:checked"),function (){
                 totalPrice+=parseInt($(this).attr("thisPrice"))
                })

                $("#totalb").text(totalPrice)
            })
        })
    </script>
<title>尤洪</title>
</head>
<body>  
<!--Begin Header Begin-->
<%@include file="/common/backend/header.jsp"%>
<%@include file="/common/front/searchBar.jsp"%>
<!--End Header End-->
<!--Begin Menu Begin-->
<%@include file="/common/front/menu.jsp"%>
<!--End Menu End-->
<div class="i_bg">  
    <div class="content mar_20">
    	<img src="static/images/img1.jpg" />
    </div>
    <!--Begin 第一步：查看购物车 Begin -->
    <div class="content mar_20">
    	<table border="0" class="car_tab" style="width:1200px; margin-bottom:50px;" cellspacing="0" cellpadding="0">
          <tr>
              <th></th>
            <td class="car_th" width="490">商品名称</td>
<%--            <td class="car_th" width="140">属性</td>--%>
            <td class="car_th" width="150">购买数量</td>
            <td class="car_th" width="130">小计</td>
            <td class="car_th" width="140">返还积分</td>
            <td class="car_th" width="150">操作</td>
          </tr>
            <c:if test="${empty sessionScope.cart.cartItemMap}">
                <tr>
                    <td><div><img src="files/cartempty.gif" width="400" height="300"/></div></td>
                    <td><a href="index.jsp" style="font-size: 25px">购物车为空 快去添加商品吧！！！</a></td>
                </tr>
            </c:if>
            <c:if test="${not empty sessionScope.cart.cartItemMap}">
                <tbody id="tbodyid">
                <c:forEach items="${sessionScope.cart.cartItemMap}" var="items" >
                    <tr class="car_tr">
                        <td><input class="check_item" value="${items.value.id}" thisPrice="${items.value.totalPrice}" speice="${sessionScope.cart.species}" type="checkbox"/></td>
                        <td style="text-align: center">
                            <div class="c_s_img"><img src="files/${items.value.fileName}" width="60" height="73" /></div>
                            ${items.value.name}
                        </td>
                        <td align="center">
                            <div class="c_num">
                                <input type="button" value=""  class="car_btn_1" />
                                <input type="text" value="${items.value.count}" productId="${items.value.id}" class="car_ipt" />
                                <input type="button" value=""  class="car_btn_2" />
                            </div>
                        </td>

                        <td  align="center" style="color:#ff4e00;">${items.value.totalPrice}</td>


                        <td align="center">26R</td>
<%--                        q清空商品项--%>
                        <td align="center"><a class="deleteCart"  href="client/cartServlet?action=deleteCartItem&id=${items.value.id}">删除</a>&nbsp; &nbsp;<a href="#">加入收藏</a></td>
                    </tr>
                </c:forEach>
                </tbody>
                <tr height="50">
                    <td colspan="6" style="font-family:'Microsoft YaHei'; border-bottom:0;">
                        <label class="r_rad"><input id="clearCart" type="checkbox" name="clear"/></label><label
                            class="r_txt">清空购物车</label>
                        <span class="fr">商品总价:￥<b id="totala"
                                style="font-size:22px; color:#ff4e00;">${sessionScope.cart.totalPrice}</b></span>
                    </td>
                </tr>
<%--                <tr height="20">--%>
<%--                    <td colspan="6" style="font-family:'Microsoft YaHei'; border-bottom:0;">--%>
<%--                        <span class="fr">选中价格：￥<b id="totalb" style="font-size:15px; color:#ff4e00;">0</b></span>--%>
<%--                    </td>--%>
<%--                </tr>--%>
          <tr valign="top" height="150">
          	<td colspan="6" align="right">
            	<a href="index.jsp"><img src="static/images/buy1.gif" /></a>&nbsp; &nbsp; <a id="buyCar"  ><img src="static/images/buy2.gif" /></a>
            </td>
          </tr>
            </c:if>
        </table>
    </div>
	<!--End 第一步：查看购物车 End frontdesk/buycar/BuyCar_Two.jsp-->
    <!--Begin 弹出层-删除商品 Begin-->
    <div id="fade" class="black_overlay"></div>
    <div id="MyDiv" class="white_content">             
        <div class="white_d">
            <div class="notice_t">
                <span class="fr" style="margin-top:10px; cursor:pointer;" onclick="CloseDiv('MyDiv','fade')"><img src="static/images/close.gif" /></span>
            </div>
            <div class="notice_c">
                <table border="0" align="center" style="font-size:16px;" cellspacing="0" cellpadding="0">
                  <tr valign="top">
                    <td>您确定要把该商品移除购物车吗？</td>
                  </tr>
                  <tr height="50" valign="bottom">
                    <td><a href="#" class="b_sure">确定</a><a href="#" class="b_buy">取消</a></td>
                  </tr>
                </table>
            </div>
        </div>
    </div>    
    <!--End 弹出层-删除商品 End-->
    <!--Begin Footer Begin -->
    <%@include file="/common/front/footer.jsp"%>
    <!--End Footer End -->
</div>
<script type="text/javascript">
    $(function (){
        $("#buyCar").click(function (){
            if ($(".check_item:checked").length==0){
                alert("请选择要购买的商品！")
            }else{
                var productsId=""
                var productsIdNotCheck=""
                $.each($(".check_item:checked"),function (){
                    // alert($(this).val()
                    productsId+=$(this).val()+","
                })
                productsIds=productsId.substring(0,productsId.length-1)
                $.each($(".check_item:not(:checked)"),function (){
                    // alert($(this).val()
                    productsIdNotCheck+=$(this).val()+","
                })
                productsIdnot=productsIdNotCheck.substring(0,productsIdNotCheck.length-1)
                // alert(productsIds)
                // alert(productsIdnot)
                location.href="${basepath}client/clientOrderServlet?action=createOrderBach&productIds="+productsIds+"&productsIdNotCheck="+productsIdnot;
            }
        })
    })
</script>

</body>
<!--[if IE 6]>
<script src="//letskillie6.googlecode.com/svn/trunk/2/zh_CN.js"></script>
<![endif]-->
</html>
