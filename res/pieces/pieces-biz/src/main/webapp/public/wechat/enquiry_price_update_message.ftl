<!DOCTYPE html>
<html lang="en">
<head>
    <#include "./inc/meta.ftl"/>
    <meta name="description" content="">
    <meta name="author" content="">
    <title>修改销售价-上工好药</title>
</head>

<body>
<section class="ui-content">
    <div class="ui-message">
        <div class="ico ico-right"></div>
        <h3 class="hd">保存成功</h3>
        <div class="bd">您可以将修改后的价格分享给您的朋友</div>
    </div>
    <div class="ui-button">
        <button type="button" class="ubtn ubtn-red" id="share"><i class="ico ico-share"></i> 立即分享</button>
        <a href="enquiry_detail.html" class="ubtn ubtn-white">返回询价单</a>
    </div>
</section><!-- /ui-content -->
<#include "./inc/footer.ftl"/>
<script>
    !(function($) {
        var _global = {
            init: function() {
                _YYY.share.init('#share'); // 分享
            }
        }
        _global.init();
    })(window.Zepto || window.jQuery);
</script>
</body>
</html>