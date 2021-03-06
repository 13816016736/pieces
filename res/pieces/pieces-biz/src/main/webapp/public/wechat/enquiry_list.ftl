<!DOCTYPE html>
<html lang="en">
<head>
    <#include "wechat/inc/meta.ftl"/>
    <meta name="description" content="">
    <meta name="author" content="">
    <title>询价单-上工好药</title>
</head>

<body>
<section class="ui-content">
    <div class="ui-tab">
        <ul class="cf">
            <li <#if status=1>class="curr"</#if>><a href="/h5/enquiry/list?status=1">已报价</a></li>
            <li <#if status=0>class="curr"</#if>><a href="/h5/enquiry/list?status=0">未报价</a></li>
            <li <#if status=2>class="curr"</#if>><a href="/h5/enquiry/list?status=2">已过期</a></li>
        </ul>
    </div>
    <div class="ui-cnt">

        <#if pageInfo?exists && pageInfo.list?has_content>
            <ul class="plist">
                <#list pageInfo.list as bill>
                <li>
                    <a href="/h5/enquiry/detail?billId=${bill.id!}">
                        <div class="hd <#if bill.type==1 && status!=2 >new</#if>">${bill.code!}</div>
                        <div class="bd">${bill.commodityOverview!} 共 <em>${bill.enquiryCommoditys?size}</em> 个商品 </div>
                        <time data-time="${(bill.createTime?datetime)!}"></time>
                    </a>
                </li>
            </#list>
            </ul>
        <#else >
            <div class="ui-empty">
                <#if status=1>
                <p>没有已报价的询价单！</p>
                <#elseif  status=0>
                <p>没有未报价的询价单！</p>
                <#elseif  status=2>
                <p>没有已过期的询价单！</p>
                </#if>
                <div class="btm">
                    <a href="/h5/enquiry" class="ubtn ubtn-red"><i class="ico ico-camera"></i> 拍照询价</a>
                </div>
            </div>
        </#if>
    </div>
</section><!-- /ui-content -->
<#include "wechat/inc/footer_h5.ftl"/>
<script>
    !(function($) {
        var _global = {
            init: function() {
                this.timeago();
            },
            timeago: function() {
                $('.plist').find('time').each(function() {
                    var date = $(this).data('time');
                    date && $(this).html(_YYY.timeago.elapsedTime(date));
                })
            }
        }

        _global.init();
    })(window.Zepto || window.jQuery);
</script>
</body>
</html>