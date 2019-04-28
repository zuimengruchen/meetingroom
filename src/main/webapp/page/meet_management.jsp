<%@ page language="java" contentType="text/html; charset=UTF-8"

pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
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
            <a href="#">首页</a><span>&nbsp&nbsp >&nbsp&nbsp  </span><a href="#">会议室管理</a><span>&nbsp&nbsp >&nbsp&nbsp  </span><a href="#">会议室维护</a>
        </div>
        <hr>

        <div class="card-header bg-light">
            <div class="row">

                <div class="col-md-12">
                    <div >
                        <form class="navbar-form navbar-right">
                            <a href="${pageContext.request.contextPath }/page/meet_management/meet_manager_add.jsp" class="btn btn-primary">添加会议室</a>
                            <a class="btn btn-primary" href="javascript:void(0);" id="delSelected">删除选中</a>
                        </form>
                    </div>
                    <div >
                        <table class="table table-bordered" id="meetRoomList">
                            <tr class="active">
                                <th class="active">
                                    <input type="checkbox"  id="firstCb"  />
                                </th>
                                <th class="text-center">名称</th>
                                <th class="text-center">类型</th>
                                <th class="text-center">容纳人数</th>
                                <th class="text-center">地址</th>
                                <th class="text-center">呼叫地址</th>
                                <th class="text-center">管理员</th>
                                <th class="text-center">是否启用</th>
                                <th class="text-center">操作</th>
                            </tr>
                            <c:forEach items="${meetRoomList}" var="list">
                                <tr class="active">
                                    <td class="active">
                                        <input type="checkbox" name="uid"  value="" id="'${list.roomId}'" />
                                    </td>
                                    <td><u><a href="#" style="color: #0c87eb"  class="text-center">${list.roomName}</a></u></td>
                                    <td class="text-center">${list.roomType}</td>
                                    <td class="text-center">${list.personCount}</td>
                                    <td class="text-center">${list.roomAreaName}</td>
                                    <td class="text-center">${list.callIp}</td>
                                    <td class="text-center">${list.manager}</td>
                                    <td class="text-center"><a href="#">启用</a></td>
                                    <!--<td>xx</td>-->
                                    <td class="text-center">
                                        <form class="navbar-form">
                                            <a href="${pageContext.request.contextPath}/meet/findOne?roomId=${list.roomId}" class="btn btn-default" >修改</a>
                                            <a href="${pageContext.request.contextPath}/meet/delete?roomId=${list.roomId}" class="btn btn-danger" >删除</a>
<%--
                                            <a class="btn btn-default btn-sm" href="javascript:deleteRoom(${list.roomId});">删除</a>
--%>
                                            <%--<a class="btn btn-default btn-sm" href="javascript:deleteRoom(${list.roomId});">删除1</a>--%>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>

                        </table>
                    </div>
                    <div>
                        <div class="box-border pull-right">
                            <ul class="pagination">
                                <li><a href="#" aria-label="Previous">首页</a></li>
                                <li><a href="#">上一页</a></li>
                                <li><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">下一页</a></li>
                                <li><a href="#" aria-label="Next">尾页</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>

<%--<c:if test="${pb.currentPage == 1}">
<li class="disabled">
</c:if>

<c:if test="${pb.currentPage != 1}">
<li>
</c:if>--%>

<script>
    function deleteRoom(id){
        //alert(1);
        //用户安全提示
        if(confirm("您确定要删除吗？")){
            //访问路径
            location.href="${pageContext.request.contextPath}/meet/delete?roomId="+id;
        }
    }

    window.onload = function(){
        //给删除选中按钮添加单击事件
        document.getElementById("delSelected").click = function(){
            if(confirm("您确定要删除选中条目吗？")){

                var flag = false;
                //判断是否有选中条目
                var cbs = document.getElementsByName("uid");
                for (var i = 0; i < cbs.length; i++) {
                    if(cbs[i].checked){
                        //有一个条目选中了
                        flag = true;
                        break;
                    }
                }
                if(flag){//有条目被选中
                    //表单提交
                    document.getElementById("form").submit();
                }
            }
        };
        //1.获取第一个cb
        document.getElementById("firstCb").onclick = function(){
            //2.获取下边列表中所有的cb
            var cbs = document.getElementsByName("uid");
            //3.遍历
            for (var i = 0; i < cbs.length; i++) {
                //4.设置这些cbs[i]的checked状态 = firstCb.checked
                cbs[i].checked = this.checked;
            }
        };

    }
 </script>
</html>
