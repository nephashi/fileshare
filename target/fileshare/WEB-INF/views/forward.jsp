<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>定向中...</title>
</head>
<body>


    <script src="<%=request.getContextPath()%>/resources/js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript">
        $(function () {
            // 对浏览器的UserAgent进行正则匹配，不含有微信独有标识的则为其他浏览器
            var useragent = navigator.userAgent;
            if (useragent.match(/MicroMessenger/i) != 'MicroMessenger') {
                // 这里警告框会阻塞当前页面继续加载
                $("title").text("定向失败")
                alert('已禁止本次访问：您必须通过 北京交通大学研究生 微信公众号访问本站！');
                // 以下代码是用javascript强行关闭当前页面
                var opened = window.open('about:blank', '_self');
                opened.opener = null;
                opened.close();
            } else {
                $.ajax({
                    method: "Post",
                    url: "<%=request.getContextPath()%>/index/authorize/",
                    success: function (data) {
                        if (data == "succ") {
                            alert("即将跳转，我们强烈建议在PC上使用主流浏览器访问本站");
                            window.location.href = "welcome";
                        } else {
                            alert("未知错误");
                        }
                    }
                });
            }
        })
    </script>
</body>
</html>
