<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 22498
  Date: 2021/5/24
  Time: 16:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--Begin Header Begin-->
<c:if test="${sessionScope.login==null}">
    <div class="soubg">
        <div class="sou">
        <span class="fr">
                   <span class="fl">你好，请<a href="frontdesk/User/Login.jsp">登录</a>&nbsp;&nbsp;
                       <a href="frontdesk/User/Regist.jsp" style="color:#ff4e00;">免费注册</a>&nbsp;|&nbsp;
                <a href="frontdesk/User/Login.jsp">我的订单</a>&nbsp;|</span>
                <span class="ss">
            	<div class="ss_list">
                	<a href="frontdesk/User/Login.jsp">收藏夹</a>
                    <div class="ss_list_bg">
                    	<div class="s_city_t"></div>
                        <div class="ss_list_c">
                        	<ul>
                            	<li><a href="#">我的收藏夹</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="ss_list">
                	<a href="frontdesk/User/Login.jsp">客户服务</a>
                    <div class="ss_list_bg">
                    	<div class="s_city_t"></div>
                        <div class="ss_list_c">
                        	<ul>
                            	<li><a href="#">客户服务</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="ss_list">
                	<a href="frontdesk/User/Login.jsp">网站导航</a>
                    <div class="ss_list_bg">
                    	<div class="s_city_t"></div>
                        <div class="ss_list_c">
                        	<ul>
                            	<li><a href="#">网站导航</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </span>
            <span class="fl">|&nbsp;关注我们：</span>
            <span class="s_sh"><a href="#" class="sh1">新浪</a><a href="#" class="sh2">微信</a></span>
            <span class="fr">|&nbsp;<a href="#">手机版&nbsp;<img src="static/images/s_tel.png" align="absmiddle" /></a></span>
        </span>
        </div>
    </div>
</c:if>

<c:if test="${sessionScope.login!=null}">
    <div class="soubg">
        <div class="sou">
        <span class="fr">
            <c:if test="${sessionScope.login.type==0}">
                <span class="fl">
                    <div class="ss_list">
                         你好;<a>${sessionScope.login.loginName}</a>
                        <div class="ss_list_bg">
                    	<div class="s_city_t"></div>
                        <div class="ss_list_c">
                        	<ul>
                            	<li><a href="frontdesk/Member/Member_User.jsp">我的信息</a></li>
                                <li><a href="userservlet?action=logOut">退出登录</a></li>
                            </ul>
                        </div>
                    </div>
                    </div>
                    &nbsp;&nbsp;<a href="frontdesk/User/Regist.jsp" style="color:#ff4e00;">免费注册</a>&nbsp;|&nbsp;
                <a href="client/clientOrderServlet?action=findMyOrder&userId=${sessionScope.login.id}">我的订单</a>&nbsp;|</span>
                <span class="ss">
            	<div class="ss_list">
                	<a href="frontdesk/Member/Member_Collect.jsp">收藏夹</a>
                    <div class="ss_list_bg">
                    	<div class="s_city_t"></div>
                        <div class="ss_list_c">
                        	<ul>
                            	<li><a href="#">我的收藏夹</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="ss_list">
                	<a href="#">客户服务</a>
                    <div class="ss_list_bg">
                    	<div class="s_city_t"></div>
                        <div class="ss_list_c">
                        	<ul>
                            	<li><a href="#">客户服务</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="ss_list">
                	<a href="#">网站导航</a>
                    <div class="ss_list_bg">
                    	<div class="s_city_t"></div>
                        <div class="ss_list_c">
                        	<ul>
                            	<li><a href="#">网站导航</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </span>
            </c:if>

            <c:if test="${sessionScope.login.type==1}">
                       <span class="fl">
                    <div class="ss_list">
                         你好;<a>${sessionScope.login.loginName}</a>
                        <div class="ss_list_bg">
                    	<div class="s_city_t"></div>
                        <div class="ss_list_c">
                        	<ul>
                            	<li><a href="backend/user/userInfo.jsp">我的信息</a></li>
                                <li><a href="userservlet?action=logOut">退出登录</a></li>
                            </ul>
                        </div>
                    </div>
                    </div>
                    &nbsp;&nbsp;<a href="frontdesk/User/Regist.jsp" style="color:#ff4e00;">免费注册</a>&nbsp;|&nbsp;
                <a href="backend/user/userInfo.jsp">后台管理</a>&nbsp;|</span>
                <span class="ss">
                <div class="ss_list">
                	<a href="frontdesk/User/Login.jsp">客户服务</a>
                    <div class="ss_list_bg">
                    	<div class="s_city_t"></div>
                        <div class="ss_list_c">
                        	<ul>
                            	<li><a href="#">客户服务</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="ss_list">
                	<a href="frontdesk/User/Login.jsp">网站导航</a>
                    <div class="ss_list_bg">
                    	<div class="s_city_t"></div>
                        <div class="ss_list_c">
                        	<ul>
                            	<li><a href="#">网站导航</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </span>
            </c:if>
            <span class="fl">|&nbsp;关注我们：</span>
            <span class="s_sh"><a href="#" class="sh1">新浪</a><a href="#" class="sh2">微信</a></span>
            <span class="fr">|&nbsp;<a href="#">手机版&nbsp;<img src="static/images/s_tel.png" align="absmiddle" /></a></span>
        </span>
        </div>
    </div>
</c:if>
<!--End Header End-->
