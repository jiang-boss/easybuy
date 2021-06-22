<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%--   静态引入base标签--%>
    <%@include file="/common/front/baseAndjs.jsp" %>

    <%--    <script src="static/js/backend/backend.js"></script>--%>
        <script type="text/javascript" src="static/js/jquery-1.11.1.min_044d0927.js"></script>
        <script type="text/javascript" src="static/js/jquery.bxslider_e88acd1b.js"></script>
        <script type="text/javascript" src="static/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="static/js/menu.js"></script>

    <script type="text/javascript" src="static/js/select.js"></script>
        <title>sds</title>
    <script type="text/javascript">
        $(function (){
            $("#addlogin").blur(function (){
                var username=this.value;
                $.getJSON("http://localhost:8080/yimaiwang/userservlet","action=ajaxExitUsername&username="+username,function (data){
                    if(data.exitname==true){
                        $("#errormsgs").text("用户名不可用或已经存在!")
                    }else {
                        $("#errormsgs").text("")
                    }
                })
            })
            $(".s_btn").click(function (){
                // alert($("#errormsgs").text())
                if (($("#errormsgs").val() == "") && $("#errormsgs1").text() == "" && $("#errormsgs2").text() == ""
                    && $("#errormsgname").text() == "" && $("#errorphone").text() == "" && $("#errormsgsident").text() == "" && $("#errormsgemail").text() == "") {
                    return true
                }else {
                    alert("请填写正确的用户信息！")
                    return false
                }
            })
            //判断真实姓名合不合法
            $("#addname").blur(function (){
                var username=$(this).val()
                var  usernameTest=/[\u4e00-\u9fa5]/;
                if (!usernameTest.test(username)){
                    $("#errormsgname").text("请填写正确的姓名")
                    return false;
                }else {
                    $("#errormsgname").text("")
                }
            })
            $("#addpwd").blur(function (){
                var password=this.value;
                $.getJSON("http://localhost:8080/yimaiwang/userservlet","action=ajaxExitPassword&pws="+password,function (data){
                    if(data.exitpwd==true){
                        $("#errormsgs1").text("密码不符要求，要包含数字和字母")
                    }else {
                        $("#errormsgs1").text("")
                    }
                })
            })
            $("#addrpwd").blur(function (){
                var password=$("#addpwd").val();
                var repwd=this.value;
                $.getJSON("http://localhost:8080/yimaiwang/userservlet","action=ajaxExitRpassword&pws="+password+"&rpws="+repwd,function (data){
                    if(data.exitrpwd==true){
                        $("#errormsgs2").text("")
                    }else {
                        $("#errormsgs2").text("两次输入的密码不一致")
                    }
                })
            })
            $("#identityCode").blur(function (){
                var indentity=this.value;
                var indentitytest=/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
                if (!indentitytest.test(indentity)){
                    $("#errormsgsident").text("请输入正确的身份证号码");
                    // return false;
                }else(
                    $("#errormsgsident").text("")
                )
            })
            //判断邮箱的格式正不正确
            $("#email").blur(function (){
                var email=this.value;
                var emailtest=/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
                if(!emailtest.test(email)){
                    $("#errormsgemail").text("邮箱的格式不正确");
                }else {
                    $("#errormsgemail").text("");
                }
            })
            //判断手机号
            $("#mobile").blur(function (){
                var phone=this.value;
                var phoneTest=/^1([358][0-9]|4[579]|66|7[0135678]|9[89])[0-9]{8}$/;
                if (!phoneTest.test(phone)){
                    $("#errorphone").text("请输入正确的手机号");
                }else {
                    $("#errorphone").text("")
                }
            })
        })
    </script>
</head>

<body>
<%@include file="/common/backend/header.jsp" %>
<%@ include file="/common/backend/searchBar.jsp" %>

<!--End Header End-->
<div class="i_bg bg_color">
    <!--Begin 用户中心 Begin -->
    <div class="m_content">
        <%@ include file="/common/backend/leftBar.jsp" %>
        <div class="m_right" id="content">
            <div class="mem_tit">
                <c:if test="${param.method == 'adduser'}">
                    添加用户
                </c:if>
                <c:if test="${param.method == 'updateuser'}">
                    修改用户
                </c:if>
            </div>
            <br>
            <form action="manager/manageruserServlet" method="post" id="userAdd" onsubmit="return checkUser();">
                <input type="hidden" name="action" value="${param.method}"/>
                <input type="hidden" name="pageNum" value="${param.pageNum}"/>
                <input type="hidden" name="username" value="${requestScope.user.userName}"/>
                <table border="0" class="add_tab" style="width:930px;" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="135" align="right">用户姓名</td>
                        <td colspan="3" style="font-family:'宋体';">
                            <input id="addlogin" type="text" value="${requestScope.user.loginName}" class="add_ipt" name="loginName"/>
                            <input type="hidden" value="${requestScope.user.id}" name="id">
                            <span id="errormsgs" ></span>
                        </td>
                    </tr>
                    <tr>
                        <td width="135" align="right">真实姓名</td>
                        <td>
                            <input id="addname" type="text" value="${requestScope.user.userName}" class="add_ipt" name="userName"/>
                            <span id="errormsgname" ></span>
                        </td>
                    </tr>

                    <tr>
                        <td width="135" align="right">密码</td>
                        <td>
                            <input id="addpwd" type="password" value="${requestScope.user.password}" class="add_ipt" name="password"/>
                            <span id="errormsgs1" ></span>
                        </td>
                    </tr>
                    <c:if test="${param.method =='adduser'}">
                        <tr>
                            <td width="135" align="right">确认密码</td>
                            <td>
                                <input id="addrpwd" type="password" value="" class="add_ipt" name="repPassword"/>
                                <span id="errormsgs2" ></span>
                            </td>
                        </tr>
                    </c:if>
                    <tr>
                        <td width="135" align="right">身份证号</td>
                        <td>
                            <input type="text" value="${requestScope.user.identityCode}" class="add_ipt" name="identityCode" id="identityCode"/>
                            <span id="errormsgsident" ></span>
                        </td>
                    </tr>
                    <tr>
                        <td width="135" align="right">性别</td>
                        <td>
                            <select  name="sex">
                                <option value="1">男</option>
                                <option value="0">女</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td width="135" align="right">电子邮箱</td>
                        <td>
                            <input type="text" value="${requestScope.user.email}" class="add_ipt" name="email" id="email"/>
                            <span id="errormsgemail" ></span>
                        </td>
                    </tr>
                    <tr>
                        <td width="135" align="right">手机</td>
                        <td>
                            <input type="text" value="${requestScope.user.mobile}" class="add_ipt" name="mobile" id="mobile"/>
                            <span id="errorphone" ></span>
                        </td>
                    </tr>
                    <tr>
                        <td width="135" align="right">用户类型</td>
                        <td>
                            <select name="type">
                                <option value="1">管理员</option>
                                <option value="0">普通用户</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <c:if test="${param.method =='adduser'}">
                                <input type="submit" value="添加用户" class="s_btn" onclick="addUser();">
                            </c:if>
                            <c:if test="${param.method =='updateuser'}">
                                <input type="submit" value="修改信息" class="s_btn" onclick="addUser();">
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
</script>
</body>
</html>


