<!-- site-nav end -->
<div class="site-nav">
    <div class="wrap">
        <p class="fl">欢迎光临上工好药中药饮片采购平台！</p>
        <ul class="fr">
            <#if user_session_biz??>
                <li><a href="user/info">${user_session_biz.userName!'' }</a>  <a href="user/logout">退出</a></li>
            <#else>
                <li><a href="user/login">登录</a> <a href="user/register">注册</a></li>
            </#if>
            <li>|</li>
            <li><a href="/user/info">用户中心</a></li>
            <li>|</li>
            <li><a href="/help/0">帮助中心</a></li>
            <li>|</li>
            <li><a href="/sitemap">站点地图</a></li>
        </ul>
    </div>
</div><!-- site-nav end -->
