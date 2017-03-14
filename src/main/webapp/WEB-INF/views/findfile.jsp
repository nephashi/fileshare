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
            <a class="navbar-brand" href="#">研究生课件分享站</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="inner-navbar">
            <ul class="nav navbar-nav">
                <li><a href="<%=request.getContextPath()%>/index/welcome">首页</a></li>
                <li class="active"><a href="#">寻找课件</a></li>
                <li><a data-toggle="modal" data-target="#modal">上传课件</a> </li>
                <li><a href="<%=request.getContextPath()%>/login">后台入口</a> </li>
                <li><a onclick="about()">关于</a> </li>
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
            <td><a name="fileName"></a></td>
            <td name="size"></td>
            <td name="courseName"></td>
            <td name="teacher"></td>
            <td><a name="download">下载</a></td>
        </tr>
    </table>
</div>
<!-- Modal -->
<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="modalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="modalLabel">欢迎来稿</h4>
            </div>
            <div class="modal-body">
                <p>我们需要大家的力量充实本站。如果你有本站没有的资源，就发邮件给我们吧。</p>
                <p>我们希望你<strong>注明课件所对应的课程，学院和授课老师</strong>。</p>
                <p>你也可以在文件名之外，给文件起一个简短的标题。也可以给文件添加描述</p>
                <p>请发邮件给：coursewarebjtu2017@163.com。衷心感谢你的贡献。</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.1.1.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/about.js"></script>
<script>
    $(function () {
        $('input[name="departmentOptions"]').each(function (index) {
            var department = $(this).attr('value');
            var url = "<%=request.getContextPath()%>/ajax/course/"+department;
            $(this).on('click', function () {
                $('#courses').empty();
                $.ajax({
                    method: "Get",
                    url: url,
                    success:function (data) {
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
                        var btn=$("<button class='btn btn-success'type='button' id='submit-button' style='margin-left: 25px'>查找文件</button>");
                        $("#courses").append(btn);
                        addBtnEvent();
                    }
                });
            });
        });
    });
    function addBtnEvent() {
        var func = showTabelData;
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
                success: func
            });
        });
    }
    function showTabelData(data) {
        var files = data;
        if(files.length == 0) {
            alert("没有符合要求的文件！")
        }
        for(var i = 0; i < files.length; i++) {
            var file = files[i];
            var trObj = $("tr",$("#tableElementTemplate")).clone();
            $('th[name="listId"]',trObj).text(i+1);
            $('a[name="fileName"]',trObj).text(file.fileName);
            $('a[name="fileName"]',trObj).attr("href","<%=request.getContextPath()%>/getfile/info/" + file.fileId);
            $('td[name="teacher"]',trObj).text(file.teacher);
            $('td[name="size"]',trObj).text(file.size + "KB");
            $('td[name="courseName"]',trObj).text(file.course.courseName);
            $('a[name="download"]',trObj).attr("href", "<%=request.getContextPath()%>/getfile/download/" + file.fileId);
            trObj.appendTo("#table-body");
        }
    }
</script>
</body>
</html>