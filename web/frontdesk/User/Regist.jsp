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
            $(".l_user").blur(function (){
                var username=this.value;
                // var usernamepat=/^\w{5,12}$/;
                // if (!usernamepat.test(username)){
                //     $("#errormsg").text("用户名不合法")
                //     return false;
                // }
                $.getJSON("http://localhost:8080/yimaiwang/userservlet","action=ajaxExitUsername&username="+username,function (data){
                    if(data.exitname==true){
                        $("#errormsg").text("用户名不可用！")
                        return false;
                    }
                    else {$("#errormsg").text("")
                    }
                })
            })
            $("#code_img").click(function (){
                this.src="${basePath}kaptchaServlet?d="+new Date();
            })
            $(".l_pwd").blur(function (){
                var password=$(".l_pwd").val();
                var passwordpat=/^\w{5,12}$/;
                if (!passwordpat.test(password)){
                    // alert("密码应该大于五个长度小于12个长度")
                    $("#userpwd").text("密码格式不正确！")
                    return false;
                }
                $("#userpwd").text("")
            })
            $("#pwd2").blur(function (){
                var password=$(".l_pwd").val();
                var repassword=$("#pwd2").val();
                // if (repassword==""){
                //     $("#userped2").text("两次输入的密码不正确1")
                //     return false;
                // }
                if (repassword!=password){
                    // alert("两次密码不正确 请重新输入");
                    $("#userped2").text("两次输入的密码不正确")
                    return false;
                }
                $("#userped2").text("")
            })
            $(".l_email").blur(function (){
                var email=$(".l_email").val();
                var eamiltest=/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
                if(!eamiltest.test(email)){
                    // alert("邮箱不符合要求")
                    $("#email").text("邮箱的格式不正确")
                    return false;
                }
                $("#email").text("")
            })
            $(".l_tel").blur(function (){
                //判断电话格式
                var tel=$(".l_tel").val();
                var telTest=/^1([358][0-9]|4[579]|66|7[0135678]|9[89])[0-9]{8}$/;
                if(!telTest.test(tel)){
                    // alert("请输入正确的电话号码")
                    $("#telephone").text("输入正确的电话号码")
                    return false;
                }
                $("#telephone").text("")
            })
            //给注册按钮绑定提交事件
            $(".log_btn").click(function (){
                var password=$("#pwd1");
                var md5pass=$.md5(password);
                $("#pwd1").val(md5pass);
                //判断验证码
                var code=$(".l_ipt").val();
                var code=$.trim(code);
                if(code==""||code==null){
                    $("#codeerr").text("验证码不能为空")
                    return  false;
                }
                $("#codeerr").text("")

                //判断是否勾选已读用户协议
                var istrue=$("#check").is(":checked")
                if(!istrue==true){
                    $("#checkerr").text("请勾选用户协议")
                    return  false
                }
                $("#checkerr").text("")
            })
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
                <td><input type="text" value="" name="loginName" class="l_user" id="user"/><br/><span style="color: red" id="errormsg"></span></td>

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
                    <td><input type="text" value="" name="userName" class="l_user"/><br/><span style="color: red" id="username"></span></td>
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
                    <td><input type="text" value="" name="identityCode" class="l_user"/><br/><span style="color: red"  id="identity"></span></td>
                </tr>
                <tr height="50">
                    <td align="right">&nbsp;邮箱 &nbsp;</td>
                    <td><input type="text" value="" name="email" class="l_email"/><br/><span style="color: red"  id="email"></span></td>
                </tr>
                <tr height="50">
                    <td align="right">&nbsp;手机 &nbsp;</td>
                    <td><input type="text" value="" name="mobile" class="l_tel"/><br/><span style="color: red"  id="telephone"></span></td>
                </tr>
              <tr height="50">
                <td align="right"> <font color="#ff4e00">*</font>&nbsp;验证码 &nbsp;</td>
                <td>
                    <input type="text" value="" name="code" class="l_ipt" />
<%--                    <a href="#" style="font-size:12px; font-family:'宋体';">换一张</a>--%>
                    <img id="code_img" alt="" src="kaptchaServlet" style="float: right; margin-right: 50px;width: 110px;height: 40px"><br/><span id="codeerr"></span>
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