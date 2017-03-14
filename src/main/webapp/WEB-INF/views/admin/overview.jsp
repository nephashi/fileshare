<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>交大研究生课件分享站——让找资源更轻松！</title>
    <!-- Bootstrap -->
    <link href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/general.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
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
                <li class="active"><a href="#">总览</a></li>
                <li><a href="<%=request.getContextPath()%>/secret/path/admin/add">新增文件</a></li>
                <li><a href="<%=request.getContextPath()%>/secret/path/admin/courses">管理课程</a></li>
                <li><a href="<%=request.getContextPath()%>/secret/path/admin/command">命令行</a> </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class="container" id="main-container" style="padding-top: 20px; padding-bottom: 20px;">
    <div class="form-group" id="departments">
        <c:forEach items="${departments}" var="department">
            <label class="radio-inline">
                <input type="radio" name="departmentOptions" id="departmentOptions1" value="${department}"> <span>${department}</span>
            </label>
        </c:forEach>
    </div>
    <div class="form-group" id="courses">

    </div>
    <div>
        <table class="table table-striped">
            <thead>
            <tr>
                <th>#</th>
                <th>文件标题</th>
                <th>大小</th>
                <th>所属课程</th>
                <th>所属学院</th>
                <th>授课教师</th>
            </tr>
            </thead>
            <tbody id="table-body">
            </tbody>
        </table>
    </div>
</div>
<div id="courseTemplate" style="display: none">
    <label class="radio-inline">
        <input type="radio" name="courseOptions"> <span class="course-span"></span>
    </label>
</div>
<div id="tableElementTemplate" style="display: none">
    <table>
        <tr>
            <th name="listId"></th>
            <td name="fileName"></td>
            <td name="size"></td>
            <td name="courseName"></td>
            <td name="department"></td>
            <td name="teacher"></td>
            <td style="display: none"><a name="edit" onclick="editFunc()">编辑</a></td>
            <td><a name="delete" onclick="deleteFunc(this)">删除</a></td>
        </tr>
    </table>
</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.1.1.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
<script>
    $(function () {
        <c:if test="${requestScope.upload_status == 'succ'}">
            alert("上传成功");
        </c:if>
        <c:if test="${requestScope.upload_status == 'fail'}">
            alert("上传失败：服务器错误");
        </c:if>
        <c:if test="${requestScope.upload_status == 'param-error'}">
            alert("上传失败：表单数据不足");
        </c:if>
        $('input[name="departmentOptions"]').each(function (index) {
            var func = showCoursesData;
            var department = $(this).attr('value');
            var url = "<%=request.getContextPath()%>/ajax/course/"+department;
            $(this).on('click', function () {
                $('#courses').empty();
                $.ajax({
                    method: "Get",
                    url: url,
                    success: func
                });
            });
        });
    });

    function showCoursesData(data) {
        var courses = data;
        for(var i = 0; i < courses.length; i++) {
            var course = courses[i];
            var labelObj = $("label",$("#courseTemplate")).clone();
            var radioObj = $('input[name="courseOptions"]',labelObj);
            var spanObj = $('.course-span',labelObj);
            radioObj.attr("id", "courseOption" + (i + 1));
            radioObj.attr("value", course.courseId);
            spanObj.text(course.courseName);
            labelObj.appendTo("#courses")
        }
        var btn=$("<button class='btn btn-success'type='button' id='submit-button' style='margin-left: 25px'>筛选文件</button>");
        $("#courses").append(btn);
        addBtnEvent();
    }

    function addBtnEvent() {
        var func = showTableData;
        $("#submit-button").on('click', function () {
            var courseid = $("input[name='courseOptions']:checked").val();
            if(typeof(courseid)=="undefined") {
                alert("请选择课程");
                return;
            }
            var url = "<%=request.getContextPath()%>/ajax/file/"+courseid;
            $("#table-body").empty();
            $.ajax({
                method: "Get",
                url : url,
                success: function (data) {
                    if(data.length == 0) {
                        alert("没有符合要求的文件！");
                    } else {
                        showTableData(data);
                    }
                }
            });
        });
    }

    function showTableData(data) {
        var files = data;
        for(var i = 0; i < files.length; i++) {
            var file = files[i];
            var trObj = $("tr",$("#tableElementTemplate")).clone();
            $('th[name="listId"]',trObj).text(i+1);
            $('td[name="fileName"]',trObj).text(file.fileName);
            $('td[name="teacher"]',trObj).text(file.teacher);
            $('td[name="size"]',trObj).text(file.size + "KB");
            $('td[name="courseName"]',trObj).text(file.course.courseName);
            $('td[name="department"]',trObj).text(file.course.department);
            $('a[name="edit"]',trObj).attr("target", file.fileId);
            $('a[name="delete"]',trObj).attr("target", file.fileId);
            trObj.appendTo("#table-body");
        }
    }
    
    function deleteFunc(obj) {
        var $this = $(obj);
        var fileId = $this.attr("target");
        var courseid = $("input[name='courseOptions']:checked").val();
        var url = "<%=request.getContextPath()%>/secret/path/admin/delete";
        $.ajax({
            method: "Post",
            url: url,
            data: {fileId: fileId, courseId: courseid},
            success: function (data) {
                $("#table-body").empty();
                if(data.status == "fail") {
                    alert("服务器异常，删除失败");
                }
                showTableData(data.files);
            }
        });
    }
</script>
</body>
</html>