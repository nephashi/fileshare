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
    <link href="<%=request.getContextPath()%>/resources/css/index.css" rel="stylesheet">

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
                <li class="active"><a href="#">首页</a></li>
                <li><a href="<%=request.getContextPath()%>/getfile">寻找课件</a></li>
                <li><a data-toggle="modal" data-target="#modal">上传课件</a> </li>
                <li><a href="<%=request.getContextPath()%>/login">后台入口</a> </li>
                <li><a onclick="about()">关于</a> </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<!-- 轮动播放 -->
<div id="carousel-1" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#carousel-1" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-1" data-slide-to="1"></li>
    </ol>
    <!-- Wrapper for slides -->
    <div class="carousel-inner">
        <div class="item active">
            <img class="center-block" src="<%=request.getContextPath()%>/resources/imgs/bkg3.jpg" alt="download">
            <div class="container">
                <div class="carousel-caption">
                    <h1>寻找资源</h1>
                    <p>一个自发学生项目，旨在方便所有人！还在为找不到合适的资源发愁吗？本站正是你的选择</p>
                    <p><a class="btn btn-lg btn-primary" href="<%=request.getContextPath()%>/getfile">前往</a> </p>
                </div>
            </div>
        </div>
        <div class="item">
            <img class="center-block" src="<%=request.getContextPath()%>/resources/imgs/bkg1.jpg" alt="share">
            <div class="container">
                <div class="carousel-caption">
                    <h1>分享课件</h1>
                    <p>本站内容的充实需要每个人的贡献！如果你有本站没有的资源，就发邮件给我们的管理员吧！</p>
                    <p><a class="btn btn-lg btn-primary" data-toggle="modal" data-target="#modal">前往</a> </p>
                </div>
            </div>
        </div>
    </div>

    <!-- Controls -->
    <a class="left carousel-control" href="#carousel-1" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">上一页</span>
    </a>
    <a class="right carousel-control" href="#carousel-1" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">下一页</span>
    </a>
</div>
<div class="container" id="summary-container">
    <hr class="divider">
    <div class="row" style="padding-bottom: 30px">
        <div class="col-md-4">
            <img class="center-block logo-img" src="<%=request.getContextPath()%>/resources/imgs/download_logo.jpg">
            <h2 class="text-center">课件下载</h2>
            <p>本站提供北京交大研究生课程内部资料的下载，这些资料可能来自互联网，学生和老师。你可以通过学院和课程名查询你需要的课程，并且下载需要的资料</p>
            <p class="text-center"><a class="btn btn-default" href="<%=request.getContextPath()%>/getfile" role="button">前往下载</a></p>
        </div>
        <div class="col-md-4">
            <img class="center-block logo-img" src="<%=request.getContextPath()%>/resources/imgs/share_logo.jpg">
            <h2 class="text-center">课件分享</h2>
            <p>我们希望把本站打造成为课件分享的平台。如果你曾从本站受益，不要忘了把你拥有的资源发邮件分享给我们！研会成员会审查你的请求。</p>
            <p class="text-center"><a class="btn btn-default" data-toggle="modal" data-target="#modal" role="button">前往分享</a></p>
        </div>
        <div class="col-md-4">
            <img class="center-block logo-img" src="<%=request.getContextPath()%>/resources/imgs/authority_logo.jpg">
            <h2 class="text-center">版权声明</h2>
            <p>若我们的资料出自你手，且你不希望该资源发布在互联网上，造成太过容易的扩散，那么请联系我们。但是，由于该站只允许校内访问，因此不必有过多这方面的担忧。</p>
            <p class="text-center"><a class="btn btn-default" href="javascript:void(0)" role="button" onclick="alert('联系方式：coursewarebjtu2017@163.com')">联系我们</a></p>
        </div>
    </div>
    <hr class="divider">
    <footer>
        <p class="pull-right"><a href="#top">回到顶部</a></p>
        <p>@北京交通大学研究生 </p>
    </footer>
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
        if(!isPC()) {
            $(".carousel .item img").remove();
        }
    })
    function isPC() {
        var userAgentInfo = navigator.userAgent;
        var Agents = ["Android", "iPhone",
            "SymbianOS", "Windows Phone",
            "iPad", "iPod"];
        var flag = true;
        for (var v = 0; v < Agents.length; v++) {
            if (userAgentInfo.indexOf(Agents[v]) > 0) {
                flag = false;
                break;
            }
        }
        return flag;
    }
</script>
</body>
</html>