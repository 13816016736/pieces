<!-- header start -->
<div class="header">
    <div class="wrap">
        <div class="logo">
            <a href="home.html">药优优电子商务管理系统</a>
        </div>
        <div class="user">
            <span>登录用户 ${member_session_boss.username }</span>
            <i>|</i>
            <span>2016年7月12日 星期三</span>
            <i>|</i>
            <a href="logout">退出</a>
        </div>
    </div>
</div><!-- header end -->



<!-- nav start -->
<div class="nav">
    <div class="wrap">
        <ul>
            <li><a href="#!">首页</a></li>
            <li>
                <a href="#!">销售</a>
                <div class="subnav">
                    <a href="/enquiry/index">询价管理</a>
                    <a href="/enquiry/index">订单管理</a>
                </div>
            </li>
            <li>
            	<a href="#!">目录</a>
            	<div class="subnav">
                    <a href="/commodity/index">商品管理</a>
                    <a href="/category/list">分类管理</a>
                    <a href="/breed/list">品种管理</a>
                </div>
            </li>
            <@shiro.hasPermission name="customer:index">
                <li>
                    <a href="#!">客户</a>
                    <div class="subnav">
                        <a href="user/index">客户管理</a>
                    </div>
                </li>
            </@shiro.hasPermission>
            <li>
                <a href="#!">促销</a>
            </li>
            <li><a href="#!">邮件列表</a></li>
            <li><a href="#!">CMS</a></li>
            <li><a href="#!">报表</a></li>
            <@shiro.hasPermission name="member:index">
                <li>
                    <a class="curr" href="#!">系统</a>
                    <div class="subnav">
                        <@shiro.hasPermission name="member:view">
                            <a class="on" href="member/index">用户管理</a>
                        </@shiro.hasPermission>
                        <@shiro.hasPermission name="role:view">
                            <a href="role/index">角色管理</a>
                        </@shiro.hasPermission>
                    </div>
                </li>
            </@shiro.hasPermission>
        </ul>
    </div>
</div>
<!-- nav end -->
