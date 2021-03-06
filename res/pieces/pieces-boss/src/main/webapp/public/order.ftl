<!DOCTYPE html>
<html lang="en">
<head>
    <#include "./inc/meta.ftl"/>
    <title>订单管理-boss-上工好药</title>
</head>

<body>
    <#include "./inc/header.ftl">
    <div class="fa-floor">
        <div class="wrap">
            <div class="title title-btm">
                <h3>订单管理</h3>
                <div class="extra">
                    <@shiro.hasPermission name="order:add">
                    <a class="btn btn-red" href="/order/customer"><i class="fa fa-plus"></i>新建订单</a>
                    </@shiro.hasPermission>
                </div>
            </div>
            <div class="pagin">
                <div class="extra">
                    <button class="btn btn-gray" type="button" id="reset">重置条件</button>
                    <button class="btn btn-blue" type="button" id="search_btn"><i class="fa fa-search"></i><span>搜索</span></button>
                </div>
            <@p.pager pageInfo=pageInfo  pageUrl="/order/index"  params=param />
            </div>
            <div class="chart">
                <table class="tc">
                    <thead>
                    <tr>
                        <th width="70">编号</th>
                        <th>订单号</th>
                        <th>订购用户</th>
                        <th>用药单位</th>
                        <th>订单金额</th>
                        <th width="200">下单日期</th>
                        <th width="80">状态</th>
                        <th width="100">操作</th>
                    </tr>
                    <tr>
                        <td></td>
                        <td><div class="ipt-wrap"><input name="code" type="text" class="ipt" value="${vo.code}"></div></td>
                        <td><div class="ipt-wrap"><input name="user.contactName" type="text" class="ipt" value="${vo.user.contactName}"></div></td>
                        <td><div class="ipt-wrap"><input name="user.companyFullName" type="text" class="ipt" value="${vo.user.companyFullName}"></div></td>
                        <td><div class="ipt-wrap"><input name="amountsPayable" type="text" class="ipt" value="${vo.amountsPayable}"></div></td>
                        <td><input type="text" name="startTime" class="ipt date" value="<#if vo.startTime?exists>${vo.startTime?datetime}</#if>" id="start"> -
                            <input name="endTime" type="text" class="ipt date" value="<#if vo.endTime?exists>${vo.endTime?datetime}</#if>" id="end"></td>
                        <td>
                            <select name="status" id="status">
                                <option value=""></option>
                                <option value="1">待付款</option>
                                <option value="2">付款待确认</option>
                                <option value="3">等待发货</option>
                                <option value="4">已发货</option>
                                <option value="5">已完成</option>
                                <option value="6">已取消</option>
                                <option value="7">已删除</option>
                            </select>
                        </td>
                        <td></td>
                    </tr>
                    </thead>
                    <tfoot></tfoot>
                    <tbody>
                    <#list pageInfo.list as order>
                    <tr>
                        <td>${order.id}</td>
                        <td>${order.code}</td>
                        <td>${order.user.contactName}</td>
                        <td>${order.user.companyFullName}</td>
                        <td>¥${order.amountsPayable}</td>
                        <td><#if order.createrTime?exists>${order.createrTime?datetime}</#if></td>
                        <td>${order.statusText}</td>
                        <td>
                        <@shiro.hasPermission name="order:info">
                            <a href="/order/detail/${order.id}">查看</a>
                        </@shiro.hasPermission>
                        </td>
                    </tr>
                    </#list>
                    </tbody>
                </table>
            </div>
        </div><!-- fa-floor end -->
    </div>
<!-- footer start -->
    <#include "./inc/footer.ftl"/>
<!-- footer end -->
    <script src="${urls.getForLookupPath('/js/laydate/laydate.js')}"></script>
<script>

    //定义根变量
    !(function($) {
        var page = {
            //定义全局变量区
            v: {
                id: "page"
            },
            //定义方法区
            fn: {
                //初始化方法区
                init: function () {
                    page.fn.dateInit();
                    page.fn.filter();
                    $("#status").val(${vo.status});
                },
                // 筛选
                filter: function() {
                    var $ipts = $('.chart .ipt, .chart select');
                    var url="/order/index?";

                    $('#search_btn').on('click', function() {
                        var params = [];
                        $ipts.each(function() {
                            var val = $.trim(this.value);
                            val && params.push($(this).attr('name') + '=' + val);
                        })
                        location.href=url+params.join('&');
                    })

                    $("#reset").on("click", function (){
                        window.location.href = url;
                    });
                },
                //日期选择
                dateInit: function () {
                    var start = {
                        elem: '#start',
                        choose: function(datas){
                            end.min = datas;
                            end.start = datas;
                        }
                    };
                    var end = {
                        elem: '#end',
                        choose: function(datas){
                            start.max = datas;
                        }
                    };
                    laydate(start);
                    laydate(end);
                }
            }
        }
        //加载页面js
        $(function() {
            page.fn.init();
        });
    })(jQuery);
</script>
</body>
</html>