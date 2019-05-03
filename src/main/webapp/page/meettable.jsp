<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%@ page isELIgnored="false"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Carbon - Admin Template</title>
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
            <div class="text-left">
                <a href="#">首页</a><span>&nbsp&nbsp >&nbsp&nbsp  </span><a
                    href="#">我的会议</a><span>&nbsp&nbsp >&nbsp&nbsp  </span><a href="#">我的预定会议</a>
                <button class="btn btn-primary" style="float: right;margin-right: 10px" id="delSelected">取消选中</button>
            </div>
        </div>
        <hr>

        <div class="card-header bg-light">
            <div class="row">
                <div class="col-md-12">
                    <form action="${pageContext.request.contextPath }/meetroom/myappointmeet" method="post">
                        <input type="text" class="form-control" style="width: 200px;float: left;margin: 5px" placeholder="搜索" name="meetName">
                        <button type="submit" class="btn btn-default" style="width: 60px;float: left;margin: 5px">搜索</button>
                    </form>
                    <form method="post" action="${pageContext.request.contextPath}/"><%--批量取消会议--%>
                       <%-- <input type="text" class="form-control" style="width: 200px;float: left;margin: 5px" placeholder="搜索">
                        <button type="submit" class="btn btn-default" style="width: 60px;float: left;margin: 5px">搜索</button>--%>

                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th class="active text-center"> <input type="checkbox" id="firstCb"/></th>
                            <th class="text-center">会议名称</th>
                            <th class="text-center">会议类型</th>
                            <th class="text-center">开始时间</th>
                            <th class="text-center">会议室</th>
                            <th class="text-center">距离开会时间:</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${pageInfo.list}" var="list">
                            <c:if test="${list.state==1}">
                                <tr>
                                    <td class="active">
                                        <center><input type="checkbox" name="id" value="${list.id}"/></center>
                                    </td>
                                    <td>
                                        <a href="${pageContext.request.contextPath }/addUser/finduser?meetid=${list.id}"  style="color: #0c87eb">${list.meetName}</a>

                                    </td>
                                    <td class="text-center">${list.meetType}</td>
                                    <td class="text-center">${list.meetDate}</td>
                                    <td class="text-center">${list.meetRoomName}</td>
                                    <td class="text-center" style="color: red"><span></span></td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                    </form>
                    <%--分页查询--%>
                    <div class="form-group form-inline">
                        <div class="form-group form-inline">
                            总共${pageInfo.pages}页，共${pageInfo.total} 条数据。 每页 10 条
                        </div>&nbsp;&nbsp;
                        <ul class="pagination">
                            <li>
                                <a href="${pageContext.request.contextPath}/meetroom/myappointmeet?page=1&size=${pageInfo.pageSize}"
                                   aria-label="Previous">首页</a>
                                <%-- <a href="${pageContext.request.contextPath}/mail/findPage?page=1&size=${pageInfo.pageSize}" aria-label="Previous">首页</a> --%>
                            </li>
                            <c:if test="${pageInfo.pageNum!=1}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/meetroom/myappointmeet?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">&laquo;</a>
                                </li>
                            </c:if>
                            <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
                                <li>
                                    <a href="${pageContext.request.contextPath}/meetroom/myappointmeet?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a>
                                </li>
                            </c:forEach>
                            <c:if test="${pageInfo.pages!=pageInfo.pageNum}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/meetroom/myappointmeet?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">&raquo;</a>
                                </li>
                            </c:if>
                            <li>
                            <li>
                                <a href="${pageContext.request.contextPath}/meetroom/myappointmeet?page=${pageInfo.pages}&size=${pageInfo.pageSize}"
                                   aria-label="Next">尾页</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<script>
    function deleteRoom(id) {
        //alert(1);
        //用户安全提示
        if (confirm("您确定要取消吗？")) {
            alert("取消成功!");
            //访问路径
           // location.href = "${pageContext.request.contextPath}/meet/delete?roomId=" + id;
        }
    }

    window.onload = function () {
        //给删除选中按钮添加单击事件
        document.getElementById("delSelected").onclick = function () {
            if (confirm("您确定要删除选中条目吗？")) {

                var flag = false;
                //判断是否有选中条目
                var cbs = document.getElementsByName("id");
                for (var i = 0; i < cbs.length; i++) {
                    if (cbs[i].checked) {
                        //alert(cbs[i]);
                        //有一个条目选中了
                        flag = true;
                        break;
                    }
                }
                if (flag) {//有条目被选中
                    //表单提交
                    document.getElementById("form").submit();
                }
            }
        };
        //1.获取第一个cb
        document.getElementById("firstCb").onclick = function () {
            //2.获取下边列表中所有的cb
            var cbs = document.getElementsByName("id");
            //3.遍历
            for (var i = 0; i < cbs.length; i++) {
                //4.设置这些cbs[i]的checked状态 = firstCb.checked
                cbs[i].checked = this.checked;
            }
        };

    }
</script>
<script type="text/javascript">
    var time_now_server,time_now_client,time_end,time_server_client;

    time_end=new Date("2019/04/21 12:11:55").getTime();//结束的时间

    time_now_server=new Date().getTime();//开始的时间

    setTimeout("show_time()",1000);
    // setTimeout("show_time('timer1')",1000);
    // setTimeout("show_time('timer2')",1000);

    function show_time() {
        var timer = document.getElementById("timer");
        var hourid = document.getElementById("hour");
        if(!timer){
            return ;
        }
        timer.innerHTML =time_now_server;

        var time_now,time_distance,str_time;
        var int_day,int_hour,int_minute,int_second;
        var time_now=new Date().getTime();
        time_distance=time_end-time_now;
        if(time_distance>0) {
            int_day=Math.floor(time_distance/86400000);
            time_distance-=int_day*86400000;
            int_hour=Math.floor(time_distance/3600000);
            time_distance-=int_hour*3600000;
            int_minute=Math.floor(time_distance/60000);
            time_distance-=int_minute*60000;
            int_second=Math.floor(time_distance/1000);

            if(int_hour < 10)
            int_hour="0"+int_hour;
            if(int_minute<10)
                int_minute="0"+int_minute;
            if(int_second<10)
                int_second="0"+int_second;

            var str_time="";
            if (int_day>0)
                str_time+=int_day+"天  ";
            if (int_hour>=0)
                str_time+=int_hour+":";
            if (int_minute>=0)
                str_time+=int_minute+":";
            if (int_second>=0)
                str_time+=int_second;
            //str_time=int_day+"天  "+int_hour+":"+int_minute+":"+int_second;
            timer.innerHTML=str_time;
            setTimeout("show_time()",1000);
        } else {
            timer.innerHTML ="会议已开始";
            var result = window.confirm('是否开始会议?');
            if (result){
                alert("会议开始!");
            }
        }
    }
</script>
</html>
