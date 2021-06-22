<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%--   静态引入base标签--%>
    <%@include file="/common/front/baseAndjs.jsp"%>
        
    <script type="text/javascript" src="static/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="static/js/menu.js"></script>
        
	<script type="text/javascript" src="static/js/select.js"></script>
        
    
<title>尤洪</title>
</head>
<body>  
<!--Begin Header Begin-->
<%@include file="/common/backend/header.jsp"%>
<%@include file="/common/front/searchBar.jsp"%>
<!--End Header End--> 
<div class="i_bg bg_color">
    <!--Begin 用户中心 Begin -->
	<div class="m_content">
        <%--        静态包含用户的左边栏--%>
        <%@include file="/common/front/leftBar.jsp"%>

		<div class="m_right">
            <p></p>
            <div class="mem_tit">账户安全</div>
            <div class="m_des">
                <form>
                <table border="0" style="width:880px;"  cellspacing="0" cellpadding="0">
                  <tr height="45">
                    <td width="80" align="right">原手机 &nbsp; &nbsp;</td>
                    <td><input type="text" value="" class="add_ipt" style="width:180px;" />&nbsp; <font color="#ff4e00">*</font></td>
                  </tr>
                  <tr height="45">
                    <td align="right">新手机 &nbsp; &nbsp;</td>
                    <td><input type="text" value="" class="add_ipt" style="width:180px;" />&nbsp; <font color="#ff4e00">*</font></td>
                  </tr>
                  <tr height="50">
                    <td>&nbsp;</td>
                    <td><input type="submit" value="确认修改" class="btn_tj" /></td>
                  </tr>
                </table>
                </form>
            </div>
            
            <div class="m_des">
                <form>
                <table border="0" style="width:880px;"  cellspacing="0" cellpadding="0">
                  <tr height="45">
                    <td width="80" align="right">原邮箱 &nbsp; &nbsp;</td>
                    <td><input type="text" value="" class="add_ipt" style="width:180px;" />&nbsp; <font color="#ff4e00">*</font></td>
                  </tr>
                  <tr height="45">
                    <td align="right">新邮箱 &nbsp; &nbsp;</td>
                    <td><input type="text" value="" class="add_ipt" style="width:180px;" />&nbsp; <font color="#ff4e00">*</font></td>
                  </tr>
                  <tr height="50">
                    <td>&nbsp;</td>
                    <td><input type="submit" value="确认修改" class="btn_tj" /></td>
                  </tr>
                </table>
                </form>
            </div>
            
            <div class="m_des">
                <form>
                <table border="0" style="width:880px;"  cellspacing="0" cellpadding="0">
                  <tr height="45">
                    <td width="80" align="right">原密码 &nbsp; &nbsp;</td>
                    <td><input type="password" value="" class="add_ipt" style="width:180px;" />&nbsp; <font color="#ff4e00">*</font></td>
                  </tr>
                  <tr height="45">
                    <td align="right">新密码 &nbsp; &nbsp;</td>
                    <td><input type="password" value="" class="add_ipt" style="width:180px;" />&nbsp; <font color="#ff4e00">*</font></td>
                  </tr>
                  <tr height="45">
                    <td align="right">确认密码 &nbsp; &nbsp;</td>
                    <td><input type="password" value="" class="add_ipt" style="width:180px;" />&nbsp; <font color="#ff4e00">*</font></td>
                  </tr>
                  <tr height="50">
                    <td>&nbsp;</td>
                    <td><input type="submit" value="确认修改" class="btn_tj" /></td>
                  </tr>
                </table>
                </form>
            </div>
        </div>
    </div>
	<!--End 用户中心 End-->



    <!--Begin Footer Begin -->
    <%@include file="/common/front/footer.jsp"%>
    <!--End Footer End -->    
</div>

</body>


<!--[if IE 6]>
<script src="//letskillie6.googlecode.com/svn/trunk/2/zh_CN.js"></script>
<![endif]-->
</html>
