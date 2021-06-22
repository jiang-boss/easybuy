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
	<script type="text/javascript" src="static/js/select.js"></script>
	<script type="text/javascript" src="static/js/lrscroll.js"></script>
    <script type="text/javascript" src="static/js/iban.js"></script>
    <script type="text/javascript" src="static/js/fban.js"></script>
    <script type="text/javascript" src="static/js/f_ban.js"></script>
    <script type="text/javascript" src="static/js/mban.js"></script>
<%--    <script type="text/javascript" src="static/js/bban.js"></script>--%>
<%--    <script type="text/javascript" src="static/js/hban.js"></script>--%>
<%--    <script type="text/javascript" src="static/js/tban.js"></script>--%>
	<script type="text/javascript" src="static/js/lrscroll_1.js"></script>
<title>尤洪</title>
    <script type="text/javascript">
        $(function (){
            $("#loginName").blur(function (){
                $("#errormsg").text("")
                $("#loginName").css("border","")
                var usernamepat=/^\w{5,12}$/;
                var loginName=this.value;
                if (loginName==""){
                    $("#errormsg").text("用户名不能为空！")
                    return false;
                }else if (!usernamepat.test(loginName)){
                    $("#errormsg").text("用户名不合法必须是5到十二位的长度")
                    return false;
                }else {
                    $.getJSON("http://localhost:8080/yimaiwang/userservlet","action=ajaxExitUsername&username="+loginName,function (data){
                        if(data.exitname==true){
                            $("#errormsg").text("用户名已经存在！")
                            return false;
                        }
                        else {
                            $("#errormsg").text("")
                            alert("dsds")
                            $("#loginName").css("border","solid green 1px")
                        }
                    })
                }

            })
            $("#code_img").click(function (){
                this.src="${basePath}kaptchaServlet?d="+new Date();
            })


            $("#pwd1").blur(function (){
                var passwordpat=/^(?![0-9]+$)(?![a-z]+$)(?![A-Z]+$)(?!([^(0-9a-zA-Z)])+$).{6,20}$/
                var password=$("#pwd1").val();
                if(password==""){
                    $("#userpwd").text("密码不能为空！")
                    return false;
                }else
                if (!passwordpat.test(password)){
                    $("#userpwd").text("密码包含 数字,英文,字符中的两种以上，长度6-20")
                    return false;
                }
                $("#userpwd").text("")
                $("#pwd1").css("border","solid green 1px")
            })

            $("#pwd2").blur(function (){
                var password=$("#pwd1").val();
                var password2=$("#pwd2").val();

                if (password2==""){
                    $("#userped2").text("请输入确认密码")
                    return false;
                }
                if (password!=password2){
                    $("#userped2").text("两次密码不一致")
                    return false;
                }
                $("#userped2").text("")
                $("#pwd2").css("border","solid green 1px")
            })

            $("#trueName").blur(function (){

                var truereg=/^[\u4E00-\u9FA5]{2,10}(·[\u4E00-\u9FA5]{2,10}){0,2}$/
                var username=$("#trueName").val();
                if(username==""){
                    $("#username").text("不能为空")
                    return false;
                }else if (!truereg.test(username)){
                    $("#username").text("请输入真实的姓名")
                    return  false
                }
                $("#username").text("")
                $("#trueName").css("border","solid green 1px")

            })
            $("#shenfenzhen").blur(function (){
                var identyCodereg=/^[1-9]\d{5}(18|19|20|(3\d))\d{2}((0[1-9])|(1[0-2]))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/
                var identyCode=$("#shenfenzhen").val();
                if (identyCode==""){
                    $("#identity").text("不能为空！")
                    return false;

                }else if(!identyCodereg.test(identyCode)){
                    $("#identity").text("身份证的格式错误！")
                    return false
                }
                $("#identity").text("")
                $("#shenfenzhen").css("border","solid green 1px")
            })
            $(".l_email").blur(function (){
                var EmailCodereg=/^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/
                var eamilCode=$("#youxiang").val();
                if (eamilCode==""){
                    $("#email").text("邮箱不能为空")
                    return false
                }else if(!EmailCodereg.test(eamilCode)){
                    $("#email").text("请输入真确的邮箱格式！")
                    return false
                }
                $("#email").text("")
                $(".l_email").css("border","solid green 1px")
            })
            $(".l_tel").blur(function (){
                var phoneCodereg=/^(13[0-9]|14[01456879]|15[0-35-9]|16[2567]|17[0-8]|18[0-9]|19[0-35-9])\d{8}$/
                var phoneCode=$("#shouji").val();
                if (phoneCode==""){
                    $("#telephone").text("号码不能为空！")
                    return false
                }else if (!phoneCodereg.test(phoneCode)){
                    $("#telephone").text("请输入真确的电话号码格式！")
                    return false
                }
                $("#telephone").text("")
                $(".l_tel").css("border","solid green 1px")
            })

            //给注册按钮绑定提交事件
            $(".log_btn").click(function (){
                return checkloginName()&&checkpwd()&&checkrepwd()&&checkuserName()&&checkindentyCode()&&checkEmailCode()&&checkphoneCode()&&checkyanzhenCode()&&checkchose();

            })
            /*(**************************************************/
            //登录名的验证
            function checkloginName(){
                var usernamepat=/^\w{5,12}$/;
                var loginName=$("#loginName").val()
                alert(loginName)
                if (loginName==""){
                    $("#errormsg").text("用户名不能为空！")
                    return false;
                }else if (!usernamepat.test(loginName)){
                    $("#errormsg").text("用户名不合法必须是5到十二位的长度")
                    return false;
                }
                $("#errormsg").text("")
                return true;
            }
            function checkpwd(){
                var passwordpat=/^(?![0-9]+$)(?![a-z]+$)(?![A-Z]+$)(?!([^(0-9a-zA-Z)])+$).{6,20}$/
                var password=$("#pwd1").val();
                if(password==""){
                    $("#userpwd").text("密码不能为空！")
                    return false;
                }else
                if (!passwordpat.test(password)){
                    $("#userpwd").text("密码包含 数字,英文,字符中的两种以上，长度6-20")
                    return false;
                }
                $("#userpwd").text("")
                return true;
            }
            function checkrepwd(){
                var password=$("#pwd1").val();
                var password2=$("#pwd2").val();
                alert(password2)
                if (password2==""){
                    $("#userped2").text("请输入确认密码")
                    return false;
                }
                if (password!=password2){
                    $("#userped2").text("两次密码不一致")
                    return false;
                }
                $("#userped2").text("")
                return true;
            }
            function checkuserName(){
                var truereg=/^[\u4E00-\u9FA5]{2,10}(·[\u4E00-\u9FA5]{2,10}){0,2}$/
                var username=$("#trueName").val();
                if(username==""){
                    $("#username").text("不能为空")
                    return false;
                }else if (!truereg.test(username)){
                    $("#username").text("请输入真实的姓名")
                    return  false
                }
                $("#username").text("")
                return true;
            }
            function checkindentyCode(){
                var identyCodereg=/^[1-9]\d{5}(18|19|20|(3\d))\d{2}((0[1-9])|(1[0-2]))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/
                var identyCode=$("#shenfenzhen").val();
                alert(identyCode)
                if (identyCode==""){
                    $("#identity").text("不能为空！")
                    return false;

                }else if(!identyCodereg.test(identyCode)){
                    $("#identity").text("身份证的格式错误！")
                    return false
                }
                $("#identity").text("")
                return true;
            }
            function checkEmailCode(){
                var EmailCodereg=/^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/
                var eamilCode=$("#youxiang").val();
                alert(eamilCode)
                if (eamilCode==""){
                    $("#email").text("邮箱不能为空")
                    return false
                }else if(!EmailCodereg.test(eamilCode)){
                    $("#email").text("请输入真确的邮箱格式！")
                    return false
                }
                $("#email").text("")
                return true;
            }
            function checkphoneCode(){
                var phoneCodereg=/^(13[0-9]|14[01456879]|15[0-35-9]|16[2567]|17[0-8]|18[0-9]|19[0-35-9])\d{8}$/
                var phoneCode=$("#shouji").val();
                if (phoneCode==""){
                    $("#telephone").text("号码不能为空！")
                    return false
                }else if (!phoneCodereg.test(phoneCode)){
                    $("#telephone").text("请输入真确的电话号码格式！")
                    return false
                }
                $("#telephone").text("")
                return true;
            }
            function checkyanzhenCode(){
                var yanzhenCode=$("#yanzhen").val();
                if (yanzhenCode==""){
                    $("#codeerr").val("验证ma不能为空！")
                    return false
                }
                $("#codeerr").text("")
                return true;
            }
            function checkchose(){
                var istrue=$("#check").is(":checked")
                if(!istrue==true){
                    $("#checkerr").text("请勾选用户协议")
                    return  false
                }
                $("#checkerr").text("")
                return true;
            }
        })
    </script>
</head>
<body>  
<!--Begin Header Begin-->
<div class="soubg">
	<div class="sou">
        <span class="fr">
        	<span class="fl">你好，请<a href="frontdesk/User/Login.jsp">登录</a>&nbsp; <a href="frontdesk/User/Regist.jsp" style="color:#ff4e00;">免费注册</a>&nbsp; </span>
            <span class="fl">|&nbsp;关注我们：</span>
            <span class="s_sh"><a href="#" class="sh1">新浪</a><a href="#" class="sh2">微信</a></span>
            <span class="fr">|&nbsp;<a href="#">手机版&nbsp;<img src="static/images/s_tel.png" align="absmiddle" /></a></span>
        </span>
    </div>
</div>
<!--End Header End-->
<!--Begin Login Begin-->
<div class="log_bg">
    <div class="top">
        <div class="logo"><a href="index.jsp"><img src="static/images/logo.png" /></a></div>
    </div>r
	<div class="regist">
    	<div class="log_img"><img src="static/images/l_img.png" width="611" height="425" /></div>
		<div class="reg_c">
        	<form action="userservlet" method="post">
                <input type="hidden" name="action" value="regist" />
                <input type="hidden" name="type" value="0"/>
            <table border="0" style="width:420px; font-size:14px; margin-top:20px;" cellspacing="0" cellpadding="0">
              <tr height="50" valign="top">
              	<td width="95">&nbsp;</td>
                <td>
                	<span class="fl" style="font-size:24px;">注册</span>
                    <span class="fr"  >已有商城账号，<a href="frontdesk/User/Login.jsp" style="color:#ff4e00;">我要登录</a></span>
                </td>
              </tr>
                <tr height="50">
                <td align="right"><font color="#ff4e00">*</font>登录用户名 &nbsp;</td>
                <td><input style="" type="text" value="${requestScope.loginName}" name="loginName" class="l_user" id="loginName"/><br/><span style="color: red" id="errormsg"></span></td>

               </tr>
                <tr height="50">
                    <td align="right"><font color="#ff4e00">*</font>&nbsp;密码 &nbsp;</td>
                    <td><input type="password" value="" name="password" class="l_pwd" id="pwd1"/><br/><span style="color: red"  id="userpwd"></span></td>
                </tr>
                <tr height="50">
                    <td align="right"><font color="#ff4e00">*</font>&nbsp;确认密码 &nbsp;</td>
                    <td><input type="password" value="" name="confirmPassword" class="l_pwd" id="pwd2"/><br/><span style="color: red"  id="userped2"></span></td>
                </tr>
                <tr height="50">
                    <td align="right"><font color="#ff4e00">*</font>&nbsp;真实姓名 &nbsp;</td>
                    <td><input type="text" value="${requestScope.user}" name="userName" id="trueName" class="l_user"/><br/><span style="color: red" id="username"></span></td>
                </tr>
                <tr height="50">
                    <td align="right"><font color="#ff4e00">*</font>&nbsp;性别 &nbsp;</td>
                    <td>
                        <input type="radio" name="sex" value="1" checked="checked">&nbsp;男&nbsp;&nbsp;
                        <input type="radio" name="sex" value="0">&nbsp;女
                    </td>
                </tr>
                <tr height="50">
                    <td align="right">&nbsp;身份证号 &nbsp;</td>
                    <td><input type="text" value="" name="identityCode" class="l_user" id="shenfenzhen" /><br/><span style="color: red"  id="identity"></span></td>
                </tr>
                <tr height="50">
                    <td align="right">&nbsp;邮箱 &nbsp;</td>
                    <td><input type="text" value="${requestScope.email}" name="email" id="youxiang" class="l_email"/><br/><span style="color: red"  id="email"></span></td>
                </tr>
                <tr height="50">
                    <td align="right">&nbsp;手机 &nbsp;</td>
                    <td><input type="text" value="${requestScope.tel}" name="mobile" class="l_tel" id="shouji"/><br/><span style="color: red"  id="telephone"></span></td>
                </tr>
              <tr height="50">
                <td align="right"> <font color="#ff4e00">*</font>&nbsp;验证码 &nbsp;</td>
                <td>
                    <input type="text" value="" name="code" class="l_ipt" id="yanzhen" />
<%--                    <a href="#" style="font-size:12px; font-family:'宋体';">换一张</a>--%>
                    <img id="code_img"  alt="" src="kaptchaServlet" style="float: right; margin-right: 50px;width: 110px;height: 40px"><br/><span style="color: red" id="codeerr">${requestScope.msg}</span>
                </td>
              </tr>
              <tr>
              	<td>&nbsp;</td>
                <td style="font-size:12px; padding-top:20px;">
                	<span style="font-family:'宋体';" class="fl">
                    	<label class="r_rad"><input type="checkbox" id="check"/></label><label class="r_txt">我已阅读并接受《用户协议》<span style="color: red" id="checkerr"></span></label>
                    </span>
                </td>
              </tr>
              <tr height="60">
              	<td>&nbsp;</td>
                <td><input type="submit" value="立即注册" class="log_btn" /></td>
              </tr>
            </table>
            </form>
        </div>
    </div>
</div>
<!--End Login End-->
<!--Begin Footer Begin-->
<div class="btmbg">
    <div class="btm">
        备案/许可证编号：蜀ICP备12009302号-1-www.dingguagua.com   Copyright © 2015-2018 尤洪商城网 All Rights Reserved. 复制必究 , Technical Support: Dgg Group <br />
        <img src="static/images/b_1.gif" width="98" height="33" /><img src="static/images/b_2.gif" width="98" height="33" />
        <img src="static/images/b_3.gif" width="98" height="33" /><img src="static/images/b_4.gif" width="98" height="33" />
        <img src="static/images/b_5.gif" width="98" height="33" /><img src="static/images/b_6.gif" width="98" height="33" />
    </div>    	
</div>
<!--End Footer End -->
</body>
<!--[if IE 6]>
<script src="//letskillie6.googlecode.com/svn/trunk/2/zh_CN.js"></script>
<![endif]-->
</html>