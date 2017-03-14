<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <style>
        dd {
            margin-bottom: 10px;
        }
    </style>
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
    <div class="container" id="main-container">
        <h2>文件详情</h2>
        <hr class="divider">
        <dl>
            <dt>文件标题</dt>
            <dd>${file.fileName}</dd>
            <dt>文件大小</dt>
            <dd>${file.size} MB</dd>
            <dt>所属学院</dt>
            <dd>${file.course.department}</dd>
            <dt>所属课程</dt>
            <dd>${file.course.courseName}</dd>
            <dt>任课老师</dt>
            <dd>${file.teacher}</dd>
            <dt>真实文件名</dt>
            <dd>${file.location}</dd>
            <dt>上传日期</dt>
            <dd><fmt:formatDate value="${file.uploadDate}" pattern="yyyy-MM-dd"/></dd>
            <dt>描述</dt>
            <dd>${file.description}</dd>
        </dl>
        <a href="<%=request.getContextPath()%>/getfile" class="btn btn-primary">返回</a>
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
</body>
</html>