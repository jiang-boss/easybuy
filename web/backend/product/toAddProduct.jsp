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
            // cate2();
            // cate3();
            $("#productCategoryLevel1").change(function (){
                // var categoryid=$(".select1").
                $("#productCategoryLevel3").html("")
                $("#productCategoryLevel3").append("<option selected=selected>请选择...</option>")
                cate2();
                // cate3()
            })
            $("#productCategoryLevel2").change(function (){
                cate3();
            })
            // $("#productCategoryLevel3").change(function (){
            //     var categoryid=$(this).children('option:selected').val();
            //     window.location.href="manager/categoryServlet?action=findCategory3&categoryName="+categoryname;
            // })
            function cate2(){
                var categoryid=$("#productCategoryLevel1").children('option:selected').val();
                $.ajax({
                    async:false,
                    url:"manager/categoryServlet",
                    data:"action=ajaxCategory2&categoryid="+categoryid,
                    type:"get",
                    dataType:"json",
                    success:function (resp){
                        // alert(resp.cate2)
                        $("#productCategoryLevel2").html("")
                        $("#productCategoryLevel2").append("<option selected=selected>请选择...</option>")
                        $.each(resp.cate2,function (i,n){
                            $("#productCategoryLevel2").append("<option value="+n.id+">"+n.name+"</option>")
                            // .append("<td>"+n.id+"</td>").append("<td>"+n.name+"</td>").append("<td>"+n.age+"</td>").append("</option>")
                        })
                    }
                })
            }
            function cate3(){
                var categoryid=$("#productCategoryLevel2 option:selected").val()
                $.ajax({
                    async:false,
                    url:"manager/categoryServlet",
                    data:"action=ajaxCategory3&categoryid="+categoryid,
                    type:"get",
                    dataType:"json",
                    success:function (resp){
                        // alert(resp.cate2)
                        $("#productCategoryLevel3").html("")
                        $("#productCategoryLevel3").append("<option selected=selected>请选择...</option>")
                        $.each(resp.cate3,function (i,n){
                            $("#productCategoryLevel3").append("<option value="+n.id+">"+n.name+"</option>")
                            // .append("<td>"+n.id+"</td>").append("<td>"+n.name+"</td>").append("<td>"+n.age+"</td>").append("</option>")
                        })
                    }
                })
            }
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
        <%@ include file="/common/backend/leftBar.jsp" %>
        <div class="m_right" id="content">
             <div class="mem_tit">
                 <c:if test="${param.method=='addproduct'}">
                     添加商品
                 </c:if>
                 <c:if test="${param.method=='updateproduct'}">
                     修改商品
                 </c:if>
            </div>
            <br>
            <form action="manager/productServlet" method="get">
                <input type="hidden" name="action" value="${param.method}" />
                <input  type="hidden" name="pageNum" value="${param.pageNum}"/>
                <input  type="hidden" name="id" value="${requestScope.product.id}"/>
                <input  type="hidden" name="fileName" value="${requestScope.product.fileName}"/>
            <table border="0" class="add_tab" style="width:930px;" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="135" align="right">一级分类</td>
                    <td colspan="3" style="font-family:'宋体';">
                        <select class="jj" name="categoryLevel1Id"  style="background-color:#f6f6f6;" id="productCategoryLevel1" >
<%--                            判断request域中是否有需要被修改的商品  --%>
                            <c:if test="${empty requestScope.product}">
                                <option value="" selected="selected">请选择...</option>
                            </c:if>
                            <c:if test="${not empty requestScope.product}">
                                <option selected hidden value="${requestScope.threecate.oneId}">${requestScope.threecate.cateOne}</option>
                            </c:if>
<%--                                   遍历传过来的一级分类的选项--%>
                            <c:forEach items="${requestScope.cate1}" var="temp">
                            <option class="select1" value="${temp.id}">${temp.name}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td width="135" align="right">二级分类</td>
                    <td>
                        <select class="jj" name="categoryLevel2Id" style="background-color:#f6f6f6;" id="productCategoryLevel2">
                            <c:if test="${empty requestScope.product}">
                                <option value="" selected="selected">请选择...</option>
                            </c:if>
                            <c:if test="${not empty requestScope.product}">
                                <option value="${requestScope.threecate.twoId}" selected hidden>${requestScope.threecate.cateTwo}</option>
                            </c:if>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td width="135" align="right">三级分类</td>
                    <td>
                        <select class="jj" name="categoryLevel3Id" style="background-color:#f6f6f6;" id="productCategoryLevel3">
                            <c:if test="${empty requestScope.product}">
                                <option value="" selected="selected">请选择...</option>
                            </c:if>
                            <c:if test="${not empty requestScope.product}">
                                <option value="${requestScope.threecate.threeId}" selected hidden>${requestScope.threecate.cateThree}</option>
                            </c:if>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td width="135" align="right">商品名称</td>
                    <td>
                        <input type="text" value="${product.name}" class="add_ipt" name="name" id="name"/>（必填）
                        <input type="hidden" name="id" value="${product.id}" id="id">
                    </td>
                </tr>
                <tr>
                    <td width="135" align="right">商品图片</td>
                    <td>

                        <c:if test="${requestScope.product.fileName==null}">
                            <img id="fileImg" style="display: none" src="" width="50" height="50"/>
                        </c:if>
<%--                        <input type="file" id="file"  class="text" name="fileName"  /><span></span>--%>
                        <c:if test="${requestScope.product.fileName!=null}">
                            <img id="fileImg" src="files/${requestScope.product.fileName}" width="50" height="50"/>
                        </c:if>
                        <input type="button" value="选择文件" onclick="javascript:$('input[name=\'file\']').click();" />
<%--                        <input name="fileName" id="lololo" readonly />--%>
                        <input type="file" id="filesAdd" name="file" style="border: hidden; display: none;" onchange="javascript:$('input[name=\'fileName\']').val(this.files[0].name);" />
                    </td>
                </tr>
                <tr>
                    <td width="135" align="right">单价</td>
                    <td>
                        <input type="text" value="${requestScope.product.price}" class="add_ipt" name="price" id="price"/>
                    </td>
                </tr>
                <tr>
                    <td width="135" align="right">库存</td>
                    <td>
                        <input type="text" value="${requestScope.product.stock}" class="add_ipt" name="stock" id="stock"/>
                    </td>
                </tr>
                <tr>
                    <td width="135" align="right">描述</td>
                    <td>
                        <textarea id="discriptionsss" name="description">${requestScope.product.description}</textarea>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <c:if test="${param.method=='addproduct'}">
                            <input type="submit" value="商品上架" class="s_btn"  id="btnadd">
                        </c:if>
                        <c:if test="${param.method =='updateproduct'}">
                            <input type="submit" value="确定修改" class="s_btn" id="btnupdate">
                        </c:if>
                    </td>
                </tr>
            </table>
            </form>
        </div>
    </div>
    <%@ include file="/common/front/footer.jsp" %>
</div>
<script type="text/javascript">
    $(function (){
        $("#btnadd").click(function (){
            // alert(($("#productCategoryLevel1").val()=="")||($("#productCategoryLevel2").val()=="")||($("#productCategoryLevel2").val()==""))
            // if (($("#productCategoryLevel1").val()=="")||($("#fileImg").val()=="")||($("#productCategoryLevel2").val()=="")||($("#productCategoryLevel2").val()=="") ||($("#name").val()=="")||($("#price").val()=="")||($("#stock").val()=="")||($("#discriptionsss").val()=="")){
                if (($("#productCategoryLevel1").val()=="")||($("#lololo").val()=="")||($("#productCategoryLevel2").val()=="") ||($("#productCategoryLevel3").val()=="") ||($("#name").val()=="")||($("#price").val()=="")||($("#stock").val()=="")||($("#discriptionsss").val()=="")){
                    alert("请填写完整的商品信息")
                return false;
            }else {
                return confirm("确认添加"+$("#name").val()+"吗?")
            }
        })
        $("#btnupdate").click(function (){
            if (($("#productCategoryLevel1").val()=="")||($("#productCategoryLevel2").val()=="") ||($("#productCategoryLevel3").val()=="") ||($("#name").val()=="")||($("#price").val()=="")||($("#stock").val()=="")||($("#discriptionsss").val()=="")){
                alert("请填写正确的商品信息")
                return false;}
            else {
                return confirm("确认修改商品吗？")
            }
        })
        $("#filesAdd").change(function (){
            $("#fileImg").show()
            $("#fileImg").attr("src",URL.createObjectURL($(this)[0].files[0]));
        })
    })
</script>
</body>
</html>


