<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>管理课程</title>
    <link href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/general.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top navbar-inverse">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#inner-navbar" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">管理后台</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="inner-navbar">
            <ul class="nav navbar-nav">
                <li><a href="<%=request.getContextPath()%>/secret/path/admin/overview">总览</a></li>
                <li><a href="<%=request.getContextPath()%>/secret/path/admin/add">新增文件</a></li>
                <li class="active"><a>管理课程</a></li>
                <li><a href="<%=request.getContextPath()%>/secret/path/admin/command">命令行</a> </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class="container" id="main-container" style="padding-top: 20px; padding-bottom: 20px;">
    <div>
        <div class="row">
            <div class="col-md-6">
                <h3>课程概览</h3>
                <hr class="divider">
                <form id="search-courses" class="form-inline">
                    <div class="form-group">
                        <select class="form-control" name="dept-select">
                            <c:forEach items="${dpts}" var="department">
                                <option value="${department}">${department}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-default">查询</button>
                </form>
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>课程名</th>
                        <th>学院</th>
                    </tr>
                    </thead>
                    <tbody id="table-body">
                        <c:forEach items="${courses}" var="course" varStatus="status">
                            <tr>
                                <th>${status.index + 1}</th>
                                <td>${course.courseName}</td>
                                <td>${course.department}</td>
                                <td><a href="<%=request.getContextPath()%>/secret/path/admin/deletecourse/${course.courseId}">删除</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="col-md-1"></div>
            <div class="col-md-5">
                <h3>增加课程</h3>
                <hr class="divider">
                <form method="post" action="<%=request.getContextPath()%>/secret/path/admin/addcourse">
                    <div class="form-group">
                        <label for="courseName">课程名</label>
                        <input type="text" class="form-control" id="courseName" name="courseName" placeholder="Course Name">
                    </div>
                    <div class="form-group">
                        <label for="department-choose">所属学院</label>
                        <select class="form-control" id="department-choose" name="department">
                            <c:forEach items="${dpts}" var="department">
                                <option value="${department}">${department}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-default">提交</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.1.1.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
<script>
    $(function () {
        <c:if test="${requestScope.delete_status == 'succ'}">
            alert("删除课程成功");
        </c:if>
        <c:if test="${requestScope.delete_status == 'fail-has-file'}">
           alert("该课程下有文件，不能删除");
        </c:if>
    })
</script>
</body>
</html>