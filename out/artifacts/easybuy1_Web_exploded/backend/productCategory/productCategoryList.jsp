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

<%--  <script type="text/javascript" src="static/js/select.js"></script>--%>
  <script type="text/javascript">
    $(function (){
      //给单选按钮绑定事件 进行下方修改的操作
      $(".selects").click(function (){
        $("#addProductCategory").show(500)
        var type=$(this).val()//单选选中分类的type
        var parentId=$(this).attr("parentId");//单选当前父类的id
        var category=$(this).parent().next().next().text()//单选选中当前分类的类别
        var name=$(this).parent().next().text();
         var name1=$(this).parent().next().next().next().text()//当分类父类的 名称
       // alert($(this).parent().next().next().text());
          var cateid=$(this).attr("cateid")//当前分类的id值
        $("#name").val(name)
        $("#type").text("")
        $("#type").append("<option disabled selected >"+category+"</option>") //显示当前的分类级别

        $("#productCategoryLevel1").text("")
        $("#productCategoryLevel2").text("")

        allcotegory();//先显示全部的一级目录
        if (type==1){
          $("#category1").hide();
          $("#category2").hide();
        }else if(type==2){
          //点击二级目录的相关操作
          $("#category1").show();
          $("#category2").hide();
          // $("#productCategoryLevel1").append("<option disabled selected hidden>"+ name1+ "</option>")
          catetype2()
        }else {
          //处理三级的目录的操作
          $("#category1").show();
          $("#category2").show()
          $("#productCategoryLevel2").append("<option disabled selected hidden>"+ name1+ "</option>")
          catetype3();
        }
        function catetype2(){
          //处理修改二级份分类
          $.ajax({
            async:false,
            url:"manager/categoryServlet",
            data:"action=ajaxType2&id="+cateid,
            type:"get",
            dataType:"json",
            success:function (resp){
              $("#productCategoryLevel1").text("")
              $("#productCategoryLevel1").append("<option disabled selected hidden>"+ name1+ "</option>")
              $.each(resp.allOneCategory,function (i,n){
                $("#productCategoryLevel1").append("<option value="+n.id+">"+n.name+"</option>")
              })
            }
          })
        }
        /*处理点击修改三级分类的选择 */
        function  catetype3(){
          //得到当前父类id 用id 查找一级目录的名称
          // $("#productCategoryLevel1").text("")
          $.ajax({
            async:false,
            url:"manager/categoryServlet",
            data:"action=ajaxType3&id="+parentId,
            type:"get",
            dataType:"json",
            success:function (resp){
              $("#productCategoryLevel1").append("<option disabled selected hidden value="+resp.category1.id+">"+resp.category1.name+"</option>")
              // alert(resp.category1.name)
            }
          })
        }

        //显示所有的一级分类
        function allcotegory(){
          $.ajax({
            async:false,
            url:"manager/categoryServlet",
            data:"action=ajaxType2",
            type:"get",
            dataType:"json",
            success:function (resp){
              $.each(resp.allOneCategory,function (i,n){
                $("#productCategoryLevel1").append("<option value="+n.id+">"+n.name+"</option>")
              })
            }
          })
        }
        // window.location.href="manager/categoryServlet?action=findCategory&id="+type;
      })

      //点击一级分分类显示当前选择的 一级分类下面的子分类
      $("#productCategoryLevel1").change(function (){
        // var nowid=$(this).val()//得到当前一级分类的id值
        //调用ajax进行显示二级分类
        cate2();
      })
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
            })
          }
        })
      }

      //判断是否删除
      $(".deletecategory").click(function (){
        return confirm("确认删除此分类信息么？");
      })
    })
  </script>
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
      <div class="mem_tit">分类列表</div>
      <p align="right">
        <a href="backend/productCategory/toAddProductCategory.jsp" class="add_b">添加分类</a>
<%--        <a href="manager/categoryServlet?action=addCategory" class="add_b">添加分类</a>--%>
        <br>
      </p>
      <br>
      <table border="0" class="order_tab" style="width:930px; text-align:center; margin-bottom:30px;" cellspacing="0" cellpadding="0">
        <tbody>
        <tr>
          <td width="5%">选择</td>
          <td width="20%">分类名称</td>
          <td width="25%">分类级别</td>
          <td width="25%">父级分类</td>
          <td width="25%" >操作</td>
        </tr>
        <c:forEach items="${requestScope.pages.items}" var="categorys">
          <tr>
            <td width="5%"><input class="selects" type="radio" cateid="${categorys.id}" parentid="${categorys.parentId}"  value="${categorys.type}" name="select"/></td>
            <td id="tdCate">${categorys.name}</td>
            <td id="choosecate">
            <c:choose>
               <c:when test="${categorys.type==1}">一级分类</c:when>
               <c:when test="${categorys.type==2}">二级分类</c:when>
               <c:when test="${categorys.type==3}">三级分类</c:when>
            </c:choose>
            </td>
            <td>
                <c:if test="${categorys.parentId==0}">
                  无
                </c:if>
                <c:forEach items="${requestScope.parentType}" var="parentTypes">
                <c:if test="${categorys.parentId!=0&&categorys.parentId==parentTypes.parentId&&categorys.id==parentTypes.id}">
                      ${parentTypes.parentName}
                </c:if>
                </c:forEach>
            </td>
            <td><a class="deletecategory" href="manager/categoryServlet?action=deletecategory&id=${categorys.id}&pageNum=${requestScope.pages.pageNum}">删除</a></td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
      <%@ include file="/common/front/pages_nav.jsp" %>
<%--       ********************************************************************************************************************88--%>
      <div id="addProductCategory" style="display: none">
        <form action="manager/categoryServlet?action=updateCategory" method="post">
        <table border="0" class="add_tab" style="width:930px;" cellspacing="0" cellpadding="0">
          <tr>
            <td width="135" align="right">分类级别</td>
            <td colspan="3" style="font-family:'宋体';" >
              <select class="jj" name="type" style="background-color:#f6f6f6;" id="type" disabled="disabled">
                <option value="" >请选择...</option>
              </select>
            </td>
          </tr>
          <tr id="category1">
            <td width="135" align="right">一级分类</td>
            <td colspan="3" style="font-family:'宋体';">
              <select class="jj" name="productCategoryLevel1" style="background-color:#f6f6f6;"  id="productCategoryLevel1">
                <option value="0" selected="selected">请选择...</option>
                <option value=""></option>
              </select>
            </td>
          </tr>
          <tr id="category2">
            <td width="135" align="right">二级分类</td>
            <td>
              <select class="jj" name="productCategoryLevel2" style="background-color:#f6f6f6;" id="productCategoryLevel2">
                <option value="0" selected="selected" >请选择...</option>
                  <option value=""></option>
              </select>
            </td>
          </tr>
          <tr>
            <td align="right">分类名称</td>
            <td style="font-family:'宋体';">
              <input type="text" value="" class="add_ipt" id="name"/>（必填）
              <input type="hidden" name="id" value="${productCategory.id}" id="id">
            </td>
          </tr>
        </table>
        <p align="right">
          <input style="float: right;margin-right: 40px" type="submit" class="s_btn"></input>
        </p>
        </form>
      </div>
    </div>
  </div>
  <%@ include file="/common/front/footer.jsp" %>
</div>
</body>
</html>


