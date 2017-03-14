<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <link href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/general.css" rel="stylesheet">

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
            <a class="navbar-brand" href="#">管理后台</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="inner-navbar">
            <ul class="nav navbar-nav">
                <li><a href="#">总览</a></li>
                <li><a href="<%=request.getContextPath()%>/secret/path/admin/add">新增文件</a></li>
                <li><a href="<%=request.getContextPath()%>/secret/path/admin/courses">管理课程</a></li>
                <li class="active"><a href="<%=request.getContextPath()%>/secret/path/admin/command">命令行</a> </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class="container">

    <div id="command_info">
        <h2>目前支持的命令</h2>
        <dl class="dl-horizontal">
            <dt>runclearthread</dt>
            <dd>为了绑定本站和公众号的联系，通过微信浏览器访问本站时访问者的IP地址会被添加授权，使得该地址可以使用其他浏览器访问。这个命令启动一个线程，每24小时清除所有授权</dd>
            <dt>clearauthorization</dt>
            <dd>立刻清空所有授权</dd>
            <dt>setdir {dir}</dt>
            <dd>设置服务器文件保存路径，没事不要乱动。需要确保路径存在。例如 setdir /usr/files/</dd>
            <dt>setpwd {password}</dt>
            <dd>设置验证密码。例如setpwd 123456</dd>
            <dt>getdir</dt>
            <dd>返回当前文件路径</dd>
            <dt>getpwd</dt>
            <dd>返回当前密码</dd>
        </dl>
    </div>

    <hr class="divider">

    <form action="<%=request.getContextPath()%>/secret/path/admin/command" method="post">
        <div class="form-group">
            <label for="command">命令行</label>
           <input type="text" class="form-control" id="command" name="command" required="required">
       </div>
        <button type="submit" class="btn btn-default">提交</button>
    </form>

    <div>
        <p>${resp}</p>
    </div>

</div> <!-- /container -->

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.1.1.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
</body>
</html>