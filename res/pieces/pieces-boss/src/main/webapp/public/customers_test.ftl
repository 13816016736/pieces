<!DOCTYPE html>
<html lang="en">
<head>
    <#include "./inc/meta.ftl"/>
    <title>客户清单-boss-饮片B2B</title>
    <script src="js/jquery.min.js"></script>

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
            <div class="title">
                <h3>客户管理</h3>
                <div class="extra"><a class="btn btn-red" href="customers-add.html"><i class="fa fa-plus"></i>增加新客户</a></div>
            </div>
            <div class="pagin">
                <div class="extra">
                    <a class="btn btn-gray" href="#"><i class="fa fa-export"></i>导出</a>
                </div>
                <#--分页-->
                <@p.pager pageInfo=areaPage  pageUrl="demo/page" />
            </div>
            <div class="chart">
                <table class="tc">
                    <thead>
                        <tr>
                            <th width="70">编号</th>
                            <th>会员名</th>
                            <th>企业全称</th>
                            <th>企业注册地区</th>
                            <th>联系人</th>
                            <th>手机号</th>
                            <th width="170">注册日期</th>
                            <th>与ERP关联</th>
                            <th>操作</th>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="text" class="ipt" value=""></td>
                            <td><input type="text" class="ipt" value=""></td>
                            <td><input type="text" class="ipt" value=""></td>
                            <td><input type="text" class="ipt" value=""></td>
                            <td><input type="text" class="ipt" value=""></td>
                            <td><input type="text" class="ipt date" value=""> - <input type="text" class="ipt date" value=""></td>
                            <td>
                                <select name="" id="">
                                    <option value="">是</option>
                                    <option value="">否</option>
                                </select>
                            </td>
                            <td>

                                <button class="button" type="button"><i class="fa fa-search"></i><span>搜索</span></button>
                            </td>
                        </tr>
                    </thead>
                    <tfoot></tfoot>
                    <tbody>
                        <#list areaPage.list as area>
                        <tr>
                            <td>${area.id}</td>
                            <td>${area.areaname}</td>
                            <td>${area.shortname}</td>
                            <td>${area.areacode}</td>
                            <td>${area.zipcode}</td>
                            <td>${area.pinyin}</td>
                            <td>${area.lng}</td>
                            <td>${area.level}</td>
                            <td><a href="customers-info.html">修改</a></td>
                        </tr>
                        </#list>


                    </tbody>
                </table>
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

</body>
</html>