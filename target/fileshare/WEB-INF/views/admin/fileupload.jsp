<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>新增文件</title>

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
                <li class="active"><a href="<%=request.getContextPath()%>/secret/path/admin/add">新增文件</a></li>
                <li><a href="<%=request.getContextPath()%>/secret/path/admin/courses">管理课程</a></li>
                <li><a href="<%=request.getContextPath()%>/secret/path/admin/command">命令行</a> </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class="container" id="main-container" style="padding-top: 20px; padding-bottom: 20px;">
    <form action="<%=request.getContextPath()%>/secret/path/admin/upload" method="post" enctype="multipart/form-data" style="width: 80%">
        <div class="form-group">
            <label for="inputFileName">文件名</label>
            <input type="text" class="form-control" id="inputFileName" name="fileName" placeholder="FileName" required="required">
        </div>
        <div class="form-group">
            <label for="department-choose">所属学院</label>
            <select class="form-control" id="department-choose" name="department">
                <c:forEach items="${dpts}" var="department">
                    <option value="${department}">${department}</option>
                </c:forEach>
            </select>
            <p class="help-block">你可以不管这个字段，但它会帮你筛选课程列表.</p>
        </div>
        <div class="form-group">
            <label for="course-choose">所属课程</label>
            <select class="form-control" id="course-choose" name="course">
                <c:forEach items="${courses}" var="course">
                    <option value="${course.courseId}">${course.courseName}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label for="teacher">授课老师</label>
            <input type="text" class="form-control" id="teacher" name="teacher" placeholder="Teacher" required="required">
        </div>
        <div class="form-group">
            <label for="description">文件描述</label>
            <textarea class="form-control" id="description" name="description" rows="5"></textarea>
        </div>
        <div class="form-group">
            <label for="inputFile">上传文件</label>
            <input type="file" id="inputFile" name="file" required="required">
            <p class="help-block">在这里上传文件.</p>
        </div>
        <button type="submit" class="btn btn-default">提交</button>
    </form>
    <div id="option-template">
        <option value=""></option>
    </div>
</div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.1.1.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
<script>
    $(function () {
        $("#department-choose").change(function () {
            var department = $(this).children('option:selected').val();
            var url = "<%=request.getContextPath()%>/ajax/course/"+department;
            $.ajax({
                method: "Get",
                url: url,
                success: function (data) {
                    $("#course-choose").empty();
                    var courses = data;
                    for(var i = 0; i < courses.length; i++) {
                        var course = courses[i];
                        var optionObj = $("option",$("#option-template")).clone();
                        optionObj.attr("value", course.courseName);
                        optionObj.text(course.courseName);
                        optionObj.appendTo("#course-choose");
                    }
                }
            })
        })
    })
</script>
</body>
</html>