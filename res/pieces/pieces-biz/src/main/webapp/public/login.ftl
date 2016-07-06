<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>登录-饮片B2B</title>
    <meta name="renderer" content="webkit" />
    <link rel="stylesheet" href="/css/style.css" />
</head>

<body>
    <!-- header start -->
    <div class="header">
        <div class="wrap">
            <div class="logo">
                <a href="home.html">饮片B2B首页</a>
            </div>
            <div class="title">
                <h1>欢迎登录</h1>
            </div>
        </div>
    </div><!-- header end -->


    <!-- slide start -->
    <div class="slide slide-full">
        <div class="bd">
            <div class="item" style="background-image:url(/images/banner-login.jpg);"></div>
        </div>

        <div class="login-box">
            <h2 class="title">会员登录</h2>
            <div class="form">
                <form action="" id="myform">
                    <div class="msg" id="msg">
                        <i class="fa fa-prompt"></i>
                        <span>用户名与密码不匹配</span>
                    </div>

                    <div class="group">
                        <div class="txt">
                            <i class="fa fa-people"></i>
                        </div>
                        <div class="cnt">
                            <input type="text" class="ipt" value="" autocomplete="off" name="userName" id="username" placeholder="用户名">
                        </div>
                    </div>

                    <div class="group">
                        <div class="txt">
                            <i class="fa fa-lock"></i>
                        </div>
                        <div class="cnt">
                            <input type="password" class="ipt" value="" autocomplete="off" name="password" id="pwd" placeholder="密码">
                        </div>
                    </div>

                    <div class="links cf">
                        <a class="fl" href="/register">免费注册</a>
                        <a class="fr" href="/findpwd/stepone">忘记密码？</a>
                    </div>

                    <div class="button">
                        <button type="button" class="btn btn-red" id="submit">登 录</button>
                    </div>
                </form>
            </div>
        </div>
    </div><!-- slide end -->


    <!-- footer start -->
    <div class="footer">
        <div class="wrap">
            <div class="links">
                <a href="#">关于药优优</a>
                <i>|</i>
                <a href="#">联系我们</a>
                <i>|</i>
                <a href="#">法律申明</a>
                <i>|</i>
                <a href="#">建议与投诉</a>
                <i>|</i>
                <a href="#">友情链接</a>
                <i>|</i>
                <a href="#">站长统计</a>
            </div>
            <div class="copyright">
                <p> 电信与信息服务业务经营许可证号：皖B20140001  备案号：皖ICP备13006003号  互联网药品交易服务资格证：皖B20130001  互联网药品信息服务资格证：（皖）-经营性-2016-0001</p>
                <p>网站商务合作邮箱：bd@copy;yaoyy.com  客户服务企业邮箱：service@copy;yaoyy.com  Copyright &copy; 2015 – 2020 药优优 All Rights Reserved</p>
            </div>
        </div>
    </div><!-- footer end -->



    <script src="/js/jquery.min.js"></script>
    <script src="/js/login.js"></script>
</body>
</html>