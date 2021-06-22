<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%--   静态引入base标签--%>
    <%@include file="/common/front/baseAndjs.jsp"%>
        <link rel="stylesheet" href="static/bootstrap-3.4.1-dist/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="static/css/city-picker.css"/>
        <script type="text/javascript" src="static/jquery-3.6.0.js"></script>
    <%--        <script type="text/javascript" src="static/js/jquery-1.11.1.min_044d0927.js"></script>--%>
<%--        <script type="text/javascript" src="static/js/jquery.bxslider_e88acd1b.js"></script>--%>
<%--        <script type="text/javascript" src="static/js/jquery-1.8.2.min.js"></script>--%>
        <script type="text/javascript" src="static/js/menu.js"></script>
	<script type="text/javascript" src="static/js/n_nav.js"></script>
    <script type="text/javascript" src="static/js/select.js"></script>
    <script type="text/javascript" src="static/js/shade.js"></script>
        <script type="text/javascript" src="static/jquery-3.6.0.js"></script>
        <script type="text/javascript" src="static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="static/cityjs/city-picker.data.js"></script>
        <script type="text/javascript" src="static/cityjs/city-picker.js"></script>
        <script type="text/javascript" src="static/cityjs/main.js"></script>
        <style type="text/css">
            .city-picker-span{
                /*width: 100%;!important;*/
            }
            .city-picker-dropdown {
                width: 100%;
            }
        </style>
<title>尤洪</title>
</head>
<body style="font-size: 12px">
<!--Begin Header Begin-->
<%@include file="/common/backend/header.jsp"%>
<%@include file="/common/front/searchBar.jsp"%>
<!--End Header End-->

<!--Begin Menu Begin-->
<%@include file="/common/front/menu.jsp"%>
<!--End Menu End-->

<div class="i_bg">  
    <div class="content mar_20">
    	<img src="static/images/img2.jpg" />
    </div>
    <!--Begin 第二步：确认订单信息 Begin -->
    <div class="content mar_20">
    	<div class="two_bg">
        	<div class="two_t">
            	<span class="fr"><a href="frontdesk/buycar/BuyCar.jsp">修改</a></span>商品列表
            </div>
            <table border="0" class="car_tab" style="width:1110px;" cellspacing="0" cellpadding="0">
              <tr>
                <td class="car_th" width="550">商品名称</td>
<%--                <td class="car_th" width="140">属性</td>--%>
                <td class="car_th" width="150">购买数量</td>
                <td class="car_th" width="130">小计</td>
                <td class="car_th" width="140">返还积分</td>
              </tr>
<%--                <c:forEach items="${sessionScope.cart.cartItemMap}" var="Item">--%>
                    <c:forEach items="${sessionScope.proChecks}" var="Item">
                    <tr class="car_tr">
                        <td style="text-align: center">
                            <div  class="c_s_img"><img src="files/${Item.value.fileName}" width="73" height="73" /></div>
                            <span  style="font-size: 15px;">${Item.value.name}</span>
                        </td>
<%--                        <td align="center">颜色：灰色</td>--%>
                        <td align="center">${Item.value.count}</td>
                        <td align="center" style="color:#ff4e00;">${Item.value.totalPrice}</td>
                        <td align="center">26R</td>
                    </tr>
                </c:forEach>
              <tr>
                <td colspan="5" align="right" style="font-family:'Microsoft YaHei';">
                    商品总价${sessionScope.totalPriceCheck}； 返还积分 ${sessionScope.totalCountCheck*26}R
                </td>
              </tr>
            </table>
          <br/>
            <div class="container">
                <div class="row">
                    <%--            	<span class="fr"><a id="updateAddress"  >修改地址</a></span>确认收货地址--%>
                    <%--                        <span class="col-md-2 col-md-offset-1">确认收货地址</span>--%>
                    <div class=" col-md-2"><span class="input-lg bg-info">确认收货地址</span></div>
                    <div class="col-md-2 col-md-offset-8 ">
                        <button class="btn btn-danger"  id="updateaddress" ><span
                                class="glyphicon glyphicon-pencil">修改地址</span>
                        </button>
                    </div>
                        <%--修改的模态框--%>
                        <div class="modal fade " id="updateModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="myModalLabel">修改收货地址</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="container-fluid">
                                            <%--                         这里是地址的表单--%>
                                            <div class="row">
                                                <form class="form-horizontal" action="client/addressServlet" method="get">
                                                    <input type="hidden" name="action" value="updateAddressForm"/>
                                                    <input type="hidden" id="hideAddress" name="region" />
                                                    <input type="hidden" name="userId" value="${sessionScope.login.id}"/>
                                                    <input id="isdefau" type="hidden" name="isDefault"/>
                                                    <input id="AddressIdHide" type="hidden" name="id" value=""/>
                                                    <br/>
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">所在区域</label>
                                                        <div class="col-md-8" >
                                                            <input type="text" style="width:366.66px ;height: 34px" id="city3" class="form-control" data-toggle="city-picker" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-md-2 control-label">详细地址</label>
                                                        <div class="col-sm-8">
                                                            <input type="text" name="address"  class="form-control" id="inputAddress" placeholder="请输入详细的地址信息，如道路，门牌号，小区，楼栋，单元等信息">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">邮政编号</label>
                                                        <div class="col-sm-8">
                                                            <input type="text" name="code" class="form-control" id="inputCode" placeholder="请填写邮编">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">收货人姓名</label>
                                                        <div class="col-sm-8">
                                                            <input type="text" name="rename" class="form-control" id="inputName" placeholder="长度不超过25个字符">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">手机号码</label>
                                                        <div class="col-sm-8">
                                                            <input type="text" name="phone" class="col-lg-7 form-control" id="inputtel" placeholder="手机号必须填写">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-md-2  col-sm-offset-9">
                                                            <input type="submit" id="update_sub_address_pre"  class="btn btn-primary " value="保存">
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                            </div>
                        </div>
                </div>
            </div>
            <br/>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <table class="table table-hover table-bordered" id="chooseAddress">
                            <c:forEach items="${sessionScope.addressList}" var="address">
                                <c:if test="${address.isDefault == '1'}">
                                    <tr>
                                        <th  class="col-md-2"><span  class="glyphicon glyphicon-map-marker"  aria-hidden="true"/>送货至</th>
                                        <th><input addressid="${address.id}" class="radioss" name="radio" type="radio" checked />&nbsp;&nbsp;<span>${address.region}&nbsp;&nbsp;&nbsp; ${address.address} </span>&nbsp;<span>(${address.rename}&nbsp;收)&nbsp;&nbsp;${address.phone}</span> <span class="input-sm bg-warning col-md-offset-2">默认地址</span></th>
                                    </tr>
                                </c:if>
                                <c:if test="${address.isDefault !='1'}">
                                    <tr>
                                        <th  class="col-md-2"><span  class="glyphicon glyphicon-map-marker hide "  aria-hidden="true"/>送货至</th>
                                        <th><input  addressid="${address.id}" class="radioss" name="radio" type="radio"/>&nbsp;&nbsp;<span> ${address.region}&nbsp;&nbsp;&nbsp;       ${address.address}</span>&nbsp;<span>(${address.rename}&nbsp;收)&nbsp;&nbsp;${address.phone}</span></th>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </table>
                    </div>
                </div>
                <script type="text/javascript">
                    $(function (){
                        $(".radioss").click(function (){
                            $(".glyphicon-map-marker").addClass("hide")
                            $(this).parent().parent().find("th:first-child span").removeClass("hide",1233)
                            // alert($(this).parent().parent().find("th:first span").text())
                            // $(".glyphicon-map-marker").attr("style","display:none")
                            // if ($(this).val()=="on"){
                            //     $(this).parent().parent().find("th:first span").attr("style","display:block")
                            // }
                        })
                    })
                </script>
            </div>>
            	支付方式
            </div>
            <ul class="pay">
                <li class="checked">支付宝<div class="ch_img"></div></li>
            </ul>
            
            <table border="0" style="width:900px; margin-top:20px;" cellspacing="0" cellpadding="0">
              <tr>
                <td align="right">
                	该订单完成后，您将获得 <font color="#ff4e00">${sessionScope.totalPriceCheck}</font> 积分 ，以及价值 <font color="#ff4e00">￥0.00</font> 的红包 <br />
                    商品总价: <font color="#ff4e00">￥${sessionScope.totalPriceCheck}</font>  + 配送费用: <font color="#ff4e00">￥15.00</font>
                </td>
              </tr>
              <tr height="70">
                <td align="right">
                	<b style="font-size:14px;">应付款金额：<span style="font-size:22px; color:#ff4e00;">￥${sessionScope.totalPriceCheck+15}</span></b>
                </td>
              </tr>
              <tr height="70">
<%--                  发送给服务器生成订单--%>
                <td align="right"><a id="creatOrder"><img src="static/images/btn_sure.gif" /></a></td>
              </tr>
            </table>
        </div>
    </div>
	<!--End 第二步：确认订单信息 End-->
    <!--Begin Footer Begin -->
    <%@include file="/common/front/footer.jsp"%>
    <!--End Footer End -->    
</div>
</body>
<script type="text/javascript">
    $(function (){

        $("#creatOrder").click(function (){
            // var address=$("#userAddress").text()
            var  address=$(".radioss:checked").parent().find("span:first-of-type").text()
            // alert(address)
            location.href="${pageScope.basepath}client/clientOrderServlet?action=createOrder&address="+address;
        })
        $("#updateaddress").click(function (){
            // alert($(".radioss:checked").attr("addressid"))
            //弹出模态框就将地址 这里获取数据
            var  id=$(".radioss:checked").attr("addressid")
            $.ajax({
                url:"client/addressServlet",
                data:"action=updateAddress&id="+id,
                type:"get",
                dataType:"json",
                success:function (resq){
                    // alert(resq.address)
                    // alert(resq.region)
                    $("<span>").addClass("select-item").append(resq.region)
                    // $(".title").text(resq.region)
                    $("#inputCode").val(resq.code)
                    $("#inputAddress").val(resq.address)
                    $("#inputName").val(resq.rename)
                    $("#inputtel").val(resq.phone)
                    $("#AddressIdHide").val(resq.id)
                    $("#isdefau").val(resq.isDefault)
                }
            })
            // $('#updateModal2').                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         modal({
            //     backdrop:'static'
            // })
            $("#updateModal2").modal({
                backdrop:"static"
            })
        })
        $("#update_sub_address_pre").click(function (){
            //将弹出的 信息添加至提交参数中
            // alert($(".title").text())
            $("#hideAddress").val($(".title").text())
        })
    })
</script>

</html>
