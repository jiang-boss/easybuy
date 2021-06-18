<%--
  Created by IntelliJ IDEA.
  User: 22498
  Date: 2021/5/25
  Time: 14:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //动态的获取请求地址
    String basePath=request.getScheme()+
            "://"+request.getServerName()+
            ":"+request.getServerPort()+
            request.getContextPath()+"/";


    pageContext.setAttribute("basepath",basePath);
%>
<base href=<%=basePath%>>
<meta http-equiv="Content-Type;X-UA-Compatible" content="text/html; charset=utf-8;IE=edge" />
<link type="text/css" rel="stylesheet" href="static/css/style.css" />


<script src="static/js/iepng.js" type="text/javascript"></script>
<script type="text/javascript">
EvPNG.fix('div, ul, img, li, input, a');

</script>

