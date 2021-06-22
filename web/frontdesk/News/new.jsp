<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%--   静态引入base标签--%>

    <%@include file="/common/front/baseAndjs.jsp" %>
<%--        <link rel="stylesheet" href="static/bootstrap-3.4.1-dist/css/bootstrap.min.css"/>--%>

    <script type="text/javascript" src="static/js/jquery-1.8.2.min.js"></script>

<%--    <script type="text/javascript" src="static/js/menu.js"></script>--%>

<%--    <script type="text/javascript" src="static/js/select.js"></script>--%>
        <script type="text/javascript" src="static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>

    <%--    <link type="text/css" rel="stylesheet" href="${ctx}/statics/css/style.css" />--%>
</head>
<body>
<%@include file="/common/backend/header.jsp"%>
<%@ include file="/common/backend/searchBar.jsp" %>
<div class="i_bg bg_color">
    <!--Begin 用户中心 Begin -->
    <div class="m_content">
<%--        <%@ include file="/common/backend/leftBar.jsp"%>--%>
        <div class="m_right">
            <p></p>
            <div class="mem_tit">资讯列表</div>
            <script type="text/javascript">
                $(function (){
                    $(".collapse").collapse();
                })
            </script>
            <table border="0" class="order_tab" style="width:930px; text-align:center; margin-bottom:30px;" cellspacing="0" cellpadding="0">
                <tbody>
                <tr>
                    <td width="20%">文章标题</td>
                    <td width="25%">文章内容</td>
                </tr>
                <c:forEach items="${sessionScope.newsList}" var="news">
                    <tr>
                        <td>${news.title}</td>
                        <td>${news.content}</td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
<%--            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">--%>
<%--                <div class="panel panel-default">--%>
<%--                    <div class="panel-heading" role="tab" id="headingOne">--%>
<%--                        <h4 class="panel-title">--%>
<%--                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">--%>
<%--                                Collapsible Group Item #1--%>
<%--                            </a>--%>
<%--                        </h4>--%>
<%--                    </div>--%>
<%--                    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">--%>
<%--                        <div class="panel-body">--%>
<%--                            Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="panel panel-default">--%>
<%--                    <div class="panel-heading" role="tab" id="headingTwo">--%>
<%--                        <h4 class="panel-title">--%>
<%--                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">--%>
<%--                                Collapsible Group Item #2--%>
<%--                            </a>--%>
<%--                        </h4>--%>
<%--                    </div>--%>
<%--                    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">--%>
<%--                        <div class="panel-body">--%>
<%--                            Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="panel panel-default">--%>
<%--                    <div class="panel-heading" role="tab" id="headingThree">--%>
<%--                        <h4 class="panel-title">--%>
<%--                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">--%>
<%--                                Collapsible Group Item #3--%>
<%--                            </a>--%>
<%--                        </h4>--%>
<%--                    </div>--%>
<%--                    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">--%>
<%--                        <div class="panel-body">--%>
<%--                            Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <%@ include file="/common/front/pages_nav.jsp" %>--%>
        </div>
    </div>
    <%@ include file="/common/front/footer.jsp" %>
</div>
</body>

</html>