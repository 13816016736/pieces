<!DOCTYPE html>
<html lang="en">
<head>
<#include "./inc/meta.ftl"/>
    <title>订单列表-上工好药</title>
</head>

<body>

<#include "./inc/header-center.ftl"/>
<link rel="stylesheet" href="css/order.css">
<div class="wrap">
    <div class="order-wrap">
        <div class="title">
            <h2>订购商品</h2>
        </div>

        <div class="main">
            <div class="hd">
                <h3>您的订单已提交成功！</h3>
                <p class="cf">
                    <a class="fr c-blue" href="/center/order/detail/${order.id}">查看该订单</a>
                    <span>订单号：${order.code}</span>
                    <span>订单金额：<em>¥${order.amountsPayable}</em></span>
                    <span>请在<em>${order.expireDate?date}</em>前完成付款。</span>
                </p>
            </div>
            <div class="bd">
                <h3>付款说明</h3>
                <p>您需要将货款支付到我们提供的其中一个账户上，支付完成后在 <a href="/user/info">用户中心</a> &gt; <a href="/center/pay/record" class="c-blue">对账单</a> 中上传您的支付凭证。
                </p>
                <p>平台以您上传支付凭证的时间为付款时间。</p>
               <#list payAccountList as payAccount>
                <dl>
                    <dt>${payAccount.receiveBank!}</dt>
                    <dd>开户人：${payAccount.receiveAccount!}</dd>
                    <dd>账　号：${payAccount.receiveBankCard!}</dd>
                </dl>
               </#list>
            </div>
        </div>
    </div>

<#include "./inc/footer.ftl"/>
</body>
</html>