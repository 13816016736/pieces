<!DOCTYPE html>
<html lang="en">
  <head>
    <#include "wechat/inc/meta.ftl"/>
    <title>支付-上工好药</title>
</head>
<body class="bg-gray">

<section class="ui-content">
    <form action="" id="myform" method="post">
    <div class="floors-info">
        <p><span>应付金额：</span><em>&yen;${vo.deposit!}</em></p>
        <p><span>订单号：</span>${vo.code!}</p>
        <p><span>剩余付款时间：</span>${vo.orderValidityPeriod!}</p>
    </div>

    <div class="floors">
        <div class="hd">账期时间</div>
        <div class="bd">
            <label>
                <input name="billtime"  type="radio" value="1" class="ico ico-rad mid cbx" checked="" />
                <em>1个月</em>
            </label>
        </div>
        <div class="bd">
            <label>
                <input name="billtime"  type="radio" value="3" class="ico ico-rad mid cbx" />
                <em>3个月</em>
            </label>
        </div>
    </div>

    <div class="ui-button mt30">
        <button type="button" class="ubtn ubtn-red" id="submit">提交</button>
    </div>
    </form>

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

            // 提交
            $('#submit').on('click', function() {
                var billtime=$('input:radio[name="billtime"]:checked').val();
                enable && $.ajax({
                    url: '/h5c/bill/create',
                    type: 'POST',
                    data:{orderId:${vo.id!},billtime:billtime},
                    success: function(res) {
                        if(res.status=="y") {
                            location.href = "/h5c/pay/success"
                        }
                        else{
                            popover(res.info);
                        }
                    },
                    complete: function() {
                        enable = true;
                    }
                })
                enable = false;
            })
        }
    }

    _global.init();
})(window.Zepto || window.jQuery);
</script>
</body>
</html>