<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%--   静态引入base标签--%>
    <%@include file="/common/front/baseAndjs.jsp"%>
    <link rel="stylesheet" href="static/bootstrap-3.4.1-dist/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="static/css/city-picker.css"/>
<%--        <link rel="stylesheet" href="static/css/main.css"/>--%>
        <script type="text/javascript" src="static/jquery-3.6.0.js"></script>
    <%--        <script type="text/javascript" src="static/js/jquery-1.11.1.min_044d0927.js"></script>--%>
    <%--        <script type="text/javascript" src="static/js/jquery.bxslider_e88acd1b.js"></script>--%>
    <%--        <script type="text/javascript" src="static/js/jquery-1.8.2.min.js"></script>--%>
    <%--    <script type="text/javascript" src="static/js/menu.js"></script>--%>
    <%--    <script type="text/javascript" src="static/js/select.js"></script>--%>
    <script type="text/javascript" src="static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="static/cityjs/city-picker.data.js"></script>
        <script type="text/javascript" src="static/cityjs/city-picker.js"></script>
        <script type="text/javascript" src="static/cityjs/main.js"></script>

        <title>尤洪</title>
</head>
<body>
<!--Begin Header Begin-->
<%@include file="/common/front/header.jsp"%>
<%@include file="/common/front/searchBar.jsp"%>


<div class="modal fade" id="update_Address" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Modal title</h4>
            </div>
            <div class="modal-body">
                ...
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>

<!--End Header End-->
<div class="i_bg bg_color">
    <!--Begin 用户中心 Begin -->
    <div class="m_content">
        <%--        静态包含用户的左边栏--%>
        <%@include file="/common/front/leftBar.jsp"%>
        <div class="m_right">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12" style="font-size: 18px">
                        <p></p>
                        <p class="bg-warning"> 收货地址</p>
                    </div>
                </div>
                <%--                         这里是地址的表单--%>
                <div class="row">
                    <form class="form-horizontal" action="client/addressServlet" method="get">
                        <input type="hidden" name="action" value="updateAddressForm"/>
                        <input type="hidden" id="hideAddress" name="region" />
                        <input type="hidden" name="userId" value="${sessionScope.login.id}"/>
                        <input type="hidden" name="isDefault" value="0"/>
                        <input id="AddressIdHide" type="hidden" name="id" value=""/>
                        <br/>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">所在区域</label>
                            <div class="col-md-8" >
                                <input type="text"  id="city3" class="form-control" data-toggle="city-picker" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">详细地址</label>
                            <div class="col-sm-8">
                                <input type="text" name="address"  class="form-control" id="inputAddress" placeholder="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">邮政编号</label>
                            <div class="col-sm-8">
                                <input type="text" name="code" class="form-control" id="inputCode" placeholder="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">收货人姓名</label>
                            <div class="col-sm-8">
                                <input type="text" name="rename" class="form-control" id="inputName" placeholder="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">手机号码</label>
                            <div class="col-sm-8">
                                <input type="text" name="phone" class="col-lg-7 form-control" id="inputtel" placeholder="">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-2  col-sm-offset-9">
                                <button id="update_sub_address"  class="btn btn-primary ">确认修改</button>
                            </div>
                        </div>
                    </form>
                </div>
                <%--                    这里是地址的表格--%>
                <div class="row">
                    <div class="col-md-12">
                        <table class="table table-bordered table-hover">
                            <tr >
                                <th>收货人</th>
                                <th>所在区域</th>
                                <th>详细地址</th>
                                <th>邮编</th>
                                <th>电话/手机</th>
                                <th style="text-align: center">操作</th>
                                <th></th>
                            </tr>
                            <c:forEach items="${sessionScope.addressList}" var="address">
                                <tr>
                                    <th>${address.rename}</th>
                                    <th>${address.region}</th>
                                    <th>${address.address}</th>
                                    <th>${address.code}</th>
                                    <th>${address.phone}</th>
                                    <th style="text-align: center">
                                        <button addressid="${address.id}" type="button" class="btn btn-info update_address">
                                            <span class="glyphicon glyphicon glyphicon-pencil"
                                                  aria-hidden="true"  ></span>修改
                                        </button>
                                        <button type="button" class="btn btn-danger">
                                            <span class="glyphicon glyphicon glyphicon-trash" aria-hidden="true"></span>删除
                                        </button>
                                    </th>
                                    <th><a class="">设为默认</a></th>
                                </tr>
                            </c:forEach>
                            <tr></tr>
                            <tr></tr>
                        </table>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!--End 用户中心 End-->
    <!--Begin Footer Begin -->
    <%@include file="/common/front/footer.jsp"%>
    <!--End Footer End -->
</div>
<script type="text/javascript">

    $(function (){
        $(".update_address").click(function (){
            var id=$(this).attr("addressid")
            // alert(id)
            // $("#update_Address").modal({
            //     backdrop:"static"
            // })
            $.ajax({
                url:"client/addressServlet",
                data:"action=updateAddress&id="+id,
                type:"get",
                dataType:"json",
                success:function (resq){
                    // alert(resq.address)
                    alert(resq.region)
                    $("#city3").attr("placeholder",resq.region)
                    $("#inputCode").attr("placeholder",resq.code)
                    $("#inputAddress").attr("placeholder",resq.address)
                    $("#inputName").attr("placeholder",resq.rename)
                    $("#inputtel").attr("placeholder",resq.phone)
                    $("#AddressIdHide").val(resq.id)

                }
            })
        })
        $("#update_sub_address").click(function (){
            //修改地址的操作
            // alert($("#city3").attr("placeholder"))
            alert($(".title").text())
            var hideAddress= $(".title").text()
            $("#hideAddress").val(hideAddress)

            $(this).submit();
        })
    })
</script>
</body>
<!--[if IE 6]>
<script src="//letskillie6.googlecode.com/svn/trunk/2/zh_CN.js"></script>
<![endif]-->
</html>
