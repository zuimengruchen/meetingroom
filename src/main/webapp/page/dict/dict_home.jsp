<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page isELIgnored="false" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>会议管理系统</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath }/vendor/simple-line-icons/css/simple-line-icons.css">
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
            <a href="#">首页</a><span>&nbsp&nbsp >&nbsp&nbsp  </span>
            <a href="#">系统管理</a><span>&nbsp&nbsp >&nbsp&nbsp  </span><a href="#">字典管理</a>
        </div>
        <hr>
        <div class="card-header bg-light">
            <div class="row">
                <div class="col-md-12">
                    <div>
                        <form class="navbar-form navbar-right">
                            <a href="${pageContext.request.contextPath }/page/dict/dict_add.jsp"
                               class="btn btn-primary">添加字典</a>
                        </form>
                    </div>
                    <div class="text-center">
                        <table class="table table-bordered text-center">
                            <thead>
                            <tr class="text-center">
                                <th class="active text-center">
                                    <input type="checkbox" id="firstCb" />
                                </th>
                                <th width="100px" class="col-md-2 text-center">名称</th>
                                <th width="100px" class="col-md-2 text-center">字典编码</th>
                                <th width="100px" class="col-md-2 text-center">详情</th>
                                <th width="100px" class="col-md-2 text-center">备注</th>
                                <th class="col-md-3 text-center">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${pageInfo.list}" var="list">
                                <tr>
                                    <td class="active">
                                        <input type="checkbox" name="uid" id="'${list.dictId}'" value=""/>
                                    </td>
                                    <td>${list.name}</td>
                                    <td>${list.code}</td>
                                    <td>${list.description}</td>
                                    <td>${list.pid}</td>
                                    <td class="text-center">
                                        <form class="navbar-form">
                                            <a href="${pageContext.request.contextPath}/dict/findOne?dictId=${list.dictId}"
                                               class="btn btn-default btn-sm">修改</a>
                                           <%-- <a href="${pageContext.request.contextPath}/dict/delete?dictId=${list.dictId}"
                                               class="btn btn-danger">删除</a>--%>
                                            <a class="btn btn-danger btn-sm"
                                               href="javascript:deleteDict(${list.dictId});">删除</a>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <script>
                            function deleteDict(id) {
                            alert(id);
                            //用户安全提示
                            if (confirm("您确定要删除吗？")) {
                                //访问路径
                                location.href = "${pageContext.request.contextPath}/dict/delete?dictId=" + id;
                            }
                        }
                        </script>

                        <div>
                            <div class="pull-left">
                                <div class="form-group form-inline">
                                    总共${pageInfo.pages}页，共${pageInfo.total} 条数据。 每页
                                    <select id="changePageSize" onchange="changePageSize()">
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                    </select> 条
                                </div>
                            </div>
                            <div>
                                <ul class="pagination">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/dict/findPage?page=1&size=${pageInfo.pageSize}"
                                           aria-label="Previous">首页</a>
                                        <%-- <a href="${pageContext.request.contextPath}/dict/findPage?page=1&size=${pageInfo.pageSize}" aria-label="Previous">首页</a> --%>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/dict/findPage?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">&laquo;</a>
                                    </li>
                                    <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
                                        <li>
                                            <a href="${pageContext.request.contextPath}/dict/findPage?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a>
                                        </li>
                                    </c:forEach>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/dict/findPage?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">&raquo;</a>
                                    </li>
                                    <li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/dict/findPage?page=${pageInfo.pages}&size=${pageInfo.pageSize}"
                                           aria-label="Next">尾页</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

<script type="text/javascript">


    /*$(document).ready(function () {
        $.ajax({
            type: "GET",//请求方式
            url: "../../dict/findPage",//访问url
            dataType:"json",//服务器返回的数据类型
        })
    });*/

    function changePageSize() {
        //获取下拉框的值
        var pageSize = $("#changePageSize").val();

        //向服务器发送请求，改变没页显示条数
        //location.href = "${pageContext.request.contextPath}/dict/findPage?page=1&size=" + pageSize;
    }

    $("#selectAll").click(function () {
        var clicks = $(this).is(':checked');
        if (!clicks) {
            $("#dataList td input[type='checkbox']").iCheck("uncheck");
        } else {
            $("#dataList td input[type='checkbox']").iCheck("check");
        }
        $(this).data("clicks", !clicks);
    });


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
        document.getElementById("delSelected").onclick = function(){
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
