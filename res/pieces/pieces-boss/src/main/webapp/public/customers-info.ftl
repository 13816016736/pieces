<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>客户信息-boss-饮片B2B</title>
    <meta name="renderer" content="webkit" />
    <link rel="stylesheet" href="/css/style.css" />
</head>

<body>

    <!-- header start -->
    <div class="header">
        <div class="wrap">
            <div class="logo">
                <a href="home.html">药优优电子商务管理系统</a>
            </div>
            <div class="user">
                <span>登录用户 hehuan</span>
                <i>|</i>
                <span>2016年6月20日 星期三</span>
                <i>|</i>
                <a href="logout.html">退出</a>
            </div>
        </div>
    </div><!-- header end -->


    <!-- nav start -->
    <div class="nav">
        <div class="wrap">
            <ul>
                <li><a href="#!">首页</a></li>
                <li><a href="#!">销售</a></li>
                <li><a href="#!">目录</a></li>
                <li>
                    <a class="curr" href="#!">客户</a>
                    <div class="subnav">
                        <a href="customers.html">客户管理</a>
                    </div>
                </li>
                <li>
                    <a href="#!">促销</a>
                    <div class="subnav">
                        <a href="customers.html">客户管理</a>
                        <a href="customers.html">客户管理</a>
                        <a href="customers.html">客户管理</a>
                        <a href="customers.html">客户管理</a>
                        <a href="customers.html">客户管理</a>
                    </div>
                </li>
                <li><a href="#!">邮件列表</a></li>
                <li><a href="#!">CMS</a></li>
                <li><a href="#!">报表</a></li>
                <li><a href="#!">系统</a></li>
            </ul>
        </div>
    </div><!-- nav end -->


    <!-- fa-floor start -->
    <div class="fa-floor">
        <div class="wrap">
            <div class="side">
                <dl>
                    <dt>客户信息</dt>
                    <dd>
                        <a class="curr" href="/menber/get/userlist">客户界面</a>
                        <a href="/menber/to/add/account?id=${user.id}">账户信息</a>
                    </dd>
                </dl>
            </div>
            <div class="main">
                <div class="title">
                    <h3><i class="fa fa-people"></i>hehuan</h3>
                    <div class="extra">
                        <button type="button" class="btn btn-gray" onclick="javascript:history.go(-1);">返回</button>
                        <button type="button" class="btn btn-gray">重置</button>
                        <button type="button" class="btn btn-red">保存</button>
                    </div>
                </div>
                <div class="user-info">
                    <h3>个人信息</h3>
                    <div class="info">
                        <table>
                            <tbody>
                                <tr>
                                    <th>当前状态：</th>
                                    <td><#if (user.onlineStatus==1)>
	                            			在线
		                            	<#else>
		                            		离线
		                            	</#if>
		                            </td>
                                    <th>最后一次修改于：</th>
                                    <td>${user.updateTime?string("yyyy-MM-dd HH:mm:ss") }</td>
                                </tr>
                                <tr>
                                    <th>上次登录时间：</th>
                                    <td></td>
                                    <th>修改途径：</th>
                                    <td>后台</td>
                                </tr>
                                <tr>
                                    <th>是否与ERP关联：</th>
                                    <td>
                                    	<#if (user.bindErp==1)>
	                            			已绑定
		                            	<#else>
		                            		未绑定
		                            	</#if>
                                    </td>
                                    <th>修改人员账号：</th>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th>账号创建日期：</th>
                                    <td>${user.createTime?string("yyyy-MM-dd HH:mm:ss") }</td>
                                    <th>修改内容：</th>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th>账号创建方式：</th>
                                    <td>
                                    	<#if (user.createChannel==1)>
	                            			后台注册
		                            	<#else>
		                            		前台注册
		                            	</#if>
                                    </td>
                                    <th></th>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div><!-- fa-floor end -->
    </div>


    <!-- footer start -->
    <div class="footer">
        <div class="wrap">            
            <div class="copyright">
                <p>药优优电商管理系统 版本 1.0  版权所有 &copy; 2016 药优优</p>
            </div>
        </div>
    </div><!-- footer end -->

    <script src="/js/jquery.min.js"></script>
</body>
</html>