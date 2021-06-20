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
    <%--    <script type="text/javascript" src="static/js/select.js"></script>--%>

    <script type="text/javascript">
        $(function (){
            //这里给选择框绑定事件
            $("#changecate").change(function (){
                var type=$(this).val();
                // alert(type)
                //判断选择的 分类的级别
                // category1();
                if(type==1){
                    $("#categoryone").hide();
                    $("#categorytwo").hide()
                    $("#forms").append("<input type='hidden' name='parentId' value='0'>")
                }else if(type==2){
                    $("#categorytwo").hide();
                    $("#categoryone").show()
                    category1(); //显示所有的一级分类

                }else {
                    $("#categoryone").show();
                    $("#categorytwo").show();
                    category1();//显示所有的一级目录
                }
                //显示全部一级分类的选项
                function  category1(){
                    $("#productCategoryLevel1").text("")
                    $("#productCategoryLevel1").append("<option selected disabled hidden>请选择...</option>")
                    $.ajax({
                        async:false,
                        url:"manager/categoryServlet",
                        data:"action=ajaxType2",
                        type:"get",
                        dataType:"json",
                        success:function (resp){
                            $.each(resp.allOneCategory,function (i,n){
                                if (type==2){
                                    //如果点击添加的是二级分类 就给一级分类的值当成添加二级分类的parentId值
                                    $("#productCategoryLevel1").attr("name","parentId")
                                    $("#productCategoryLevel1").append("<option value="+n.id+">"+n.name+"</option>")
                                }
                                else {
                                    $("#productCategoryLevel1").append("<option value="+n.id+">"+n.name+"</option>")
                                }
                            })
                        }
                    })
                }
            })
            //给一级分类的改变绑定事件
            $("#productCategoryLevel1").change(function (){
                //当前选择的分类的id 一级分类的id  通过这个id 查找对应的二级分类
                var id=$("#productCategoryLevel1").val();
                // alert(id)
                $.ajax({
                    async:false,
                    url:"manager/categoryServlet",
                    data:"action=ajaxCategory2&categoryid="+id,
                    type:"get",
                    dataType:"json",
                    success:function (resp){
                        // alert(resp.cate2)
                        $("#productCategoryLevel2").html("")
                        $("#productCategoryLevel2").append("<option selected=selected>请选择...</option>")
                        $.each(resp.cate2,function (i,n){
                            //将得到的二级分类的列表填写
                            $("#productCategoryLevel2").attr("name","parentId")
                            $("#productCategoryLevel2").append("<option  value="+n.id+">"+n.name+"</option>")
                            // .append("<td>"+n.id+"</td>").append("<td>"+n.name+"</td>").append("<td>"+n.age+"</td>").append("</option>")
                        })
                    }
                })
            })

            //给提交按钮绑定事件
            $("#subbtn").click(function (){
               if( ($("#changecate").val())==0){
                   alert("请添加分类信息!")
                   return false;
               }
            })
        })
    </script>
</head>
<body>
<%@include file="/common/front/header.jsp" %>
<%@ include file="/common/backend/searchBar.jsp" %>
<!--End Header End-->
<div class="i_bg bg_color">
    <!--Begin 用户中心 Begin -->
    <div class="m_content">
        <%@ include file="/common/backend/leftBar.jsp" %>
        <div class="m_right" id="content">
            <div class="mem_tit">
                添加分类
            </div>
            <br>
            <div id="addProductCategory">
                <form action="manager/categoryServlet?action=addCategory" method="post" id="forms">
                    <input type="hidden" name="iconClass" value=""/>
                    <table border="0" class="add_tab" style="width:930px;" cellspacing="0" cellpadding="0">

                        <tr>
                            <td width="135" align="right">分类级别</td>
                            <td colspan="3" style="font-family:'宋体';">
                                <select name="type" id="changecate" class="jj" style="background-color:#f6f6f6;">
                                    <option value="0" selected="selected">请选择...</option>
                                    <option value="1">一级分类</option>
                                    <option value="2">二级分类</option>
                                    <option value="3">三级分类</option>
                                </select>
                            </td>
                        </tr>
                        <tr  id="categoryone" style="display: none">
                            <td width="135" align="right">一级分类</td>
                            <td colspan="3" style="font-family:'宋体';">
                                <select  id="productCategoryLevel1" value="0" class="jj" name="" style="background-color:#f6f6f6;" >
<%--                                    <option value="" selected disabled hidden >请选择...</option>--%>
                                </select>
                            </td>
                        </tr>
                        <tr id="categorytwo" style="display: none">
                            <td width="135" align="right">二级分类</td>
                            <td>
                                <select class="jj" name="productCategoryLevel2" style="background-color:#f6f6f6;"
                                        id="productCategoryLevel2">
                                    <option value="" >请选择...</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">分类名称</td>
                            <td style="font-family:'宋体';">
                                <input type="text" name="name" value="" class="add_ipt" id="name"/>（必填）
                                <input type="hidden" name="id" value="" id="id">
                            </td>
                        </tr>
                    </table>
                    <p align="right">
                        <br>
<%--                        <a href="" class="add_b">确认添加</a>--%>
                        <input style="float: right;margin-right: 40px" type="submit" class="s_btn" id="subbtn"></input>
                    </p>
                </form>
            </div>
        </div>
    </div>
    <%@ include file="/common/front/footer.jsp" %>
</div>

</body>
</html>
