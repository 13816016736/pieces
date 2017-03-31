<!DOCTYPE html>
<html lang="en">
  <head>
   <#include "wechat/inc/meta.ftl"/>
    <title>订单-上工好药</title>
</head>
<body class="bg-gray">

<section class="ui-content">
    <div class="floors-info">
        <p><span>状态：</span><em>${vo.statusText}</em></p>
        <p><span>订单号：</span>${vo.code}</p>
        <p><span>下单时间：</span>${vo.createrTime?datetime}</p>
        <div class="button">
        <#if vo.status=1>
            <a href="/h5c/order/pay/${vo.id?c}" class="ubtn ubtn-red primary" id="pay">去支付</a>
            <button type="button" id="cancel" class="ubtn ubtn-white">取消订单</button>

        <#elseif vo.status=4>
            <button type="button" id="config" class="ubtn ubtn-red primary">确认收货</button>
        </#if>
       </div>
    </div>

    <div class="floors-info">
        <p><span>收货人：</span>${vo.address.consignee}  ${vo.address.tel}</p>
        <p><span>收货地址：</span>${vo.address.area}${vo.address.detail}</p>
         <#if vo.invoice?exists><p><span>发票信息：</span>${vo.invoice.typeText!}</p></#if>
    </div>

    <div class="goods">
           <#list vo.commodities as commodity>
        <ul>
            <li>
                <div class="hd">${commodity.name}</div>
                <div class="bd">${commodity.spec}${commodity.level}</div>
                <div class="price">
                   <#if userType==2>
                    <span>销售价:<em><#if commodity.guidePrice??>${(commodity.guidePrice?default(0))?string .currency}</#if></em></span>
                   </#if>
                    <span>开票价:<#if commodity.price??>${(commodity.price?default(0))?string .currency}</#if></span>
                </div>
                <div class="pic rs-pic">
                    <img src="<#if commodity.pictureUrl=="" || !(commodity.pictureUrl?exists) >/images/blank.jpg<#else >${commodity.pictureUrl?default('/images/blank.jpg')}</#if>" />
                </div>
            </li>
        </ul>
        <div class="ft">
            数量：<em>${commodity.amount}</em>公斤
        </div>
           </#list>
    </div>

    <div class="summary">
        <div class="money">
            <em class="fr">¥${vo.amountsPayable}</em>开票金额
        </div>
        <#if userType==2>
        <div class="li">
            需支付保证金：<em>¥${vo.deposit}</em>
        </div>
        </#if>

    </div>

</section><!-- /ui-content -->

<#include "wechat/inc/footer_h5.ftl"/>
<script>
!(function($) {
    var _global = {
        init: function() {
            this.bindEvent();
        },
        bindEvent: function() {
            var enable = true;

            $('#config').on('click', function() {
                changeOrderStatus(${vo.id?c},5);
            })

            // 取消
            $('#cancel').on('click', function() {
                layer.open({
                    content: '确定要取消吗？',
                    btn: ['确定', '取消'],
                    yes: function(index) {
                        enable &&
                        changeOrderStatus(${vo.id?c},6);
                        enable = false;
                    }
                });
            })

            function changeOrderStatus(id, status) {
                $.post("/center/order/status", {orderId: id, status: status}, function (data) {
                    if (data.status == "y") {
                            window.location.reload();
                    }
                }, "json")
            }
        }
    }

    _global.init();
})(window.Zepto || window.jQuery);
</script>
</body>
</html>