<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page isELIgnored="false"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>会议管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/vendor/simple-line-icons/css/simple-line-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/vendor/font-awesome/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/styles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath }/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/vendor/popper.js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath }/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/vendor/chart.js/chart.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/carbon.js"></script>
    <script src="${pageContext.request.contextPath }/js/demo.js"></script>


</head>
<body class="sidebar-fixed header-fixed">
<div class="content">
    <div class="container-fluid">
        <div class="card-header bg-light">
            <a href="#">首页</a><span>&nbsp&nbsp >&nbsp&nbsp  </span><a href="#">管理后台</a><span>&nbsp&nbsp >&nbsp&nbsp
        </span><a href="#">用户添加</a>
        </div>
        <hr>
        <div >
            <div >
                <div class="row">
                    <div class="modal-body ">
                        <form class="form-horizontal" role="form"
                              action="${pageContext.request.contextPath}/user/add"
                              method="post">

                            <div class="form-group">
                                <div ><label  for="deptname" class="col-sm-2 control-label">用户名称:</label></div>
                                <div class="col-md-6">
                                    <input type="text" id="deptname" name="username"
                                           class="form-control"  />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="deptaddr" class="col-sm-2 control-label">用户性别:</label>
                                <div class="col-md-6">
                                    <input type="text" id="deptaddr" name="sex"
                                           class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="email" class="col-sm-2 control-label">用户邮箱:</label>
                                <div class="col-md-6">
                                    <input type="text"  id="email" name="email"
                                           class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="tel" class="col-sm-2 control-label">用户电话:</label>
                                <div class="col-md-6">
                                    <input type="text"  id="tel" name="tel"
                                           class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="roomType" class="col-sm-2 control-label">用户所属分公司:</label>
                                <select  id="roomType" name="subofficeid" class="form-control"
                                         style="width: 150px;height:35px"
                                         onchange="okIS(this.options[selectedIndex].value)" >
                                    <option value="1" >武汉分部</option>
                                    <option value="2" >上海分部</option>
                                </select>

                            </div>
                            <div class="form-group">
                                <label for="roomType1" class="col-sm-2 control-label">用户所属分公司:</label>
                                <select  id="roomType1" name="deptid" class="form-control"
                                         style="width: 150px;height:35px"
                                         onchange="okIS(this.options[selectedIndex].value)" >
                                    <option value="1" >总经办</option>
                                    <option value="2" >研发部</option>
                                    <option value="3" >财务部</option>
                                    <option value="4" >市场部</option>
                                    <option value="5" >人事部</option>
                                </select>

                            </div>

                            <div class="col-sm-5 control-label">
                                <input type="submit" class="btn btn-primary" />
                                <button type="button" class="btn btn-default" onclick="history.back(-1);">取消</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<!-- 添加修改对话框开始 -->


<!-- 添加修改对话框结束 -->

</body>

<%
    if ((String)request.getAttribute("addInfo") == "success") { %>
<script>
    alert("添加成功！");
    window.location.reload();
</script>
<%}%><%
    if ((String)request.getAttribute("deleteInfo") == "success") { %>
<script>
    alert("删除成功！");
    window.location.reload();
</script>
<%}%>



</html>