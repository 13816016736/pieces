<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>珍药材 中药材电子商务 有质量保障的仓储式中药材综合服务平台</title>
    <meta name="description" content="珍药材网-中国首创最大最有保障的线上线下相结合的电子商务仓储式综合服务平台，提供各类大品种药材、小品种药材、涨跌价紧俏药材，保证现货，
保证中药材质量，提供线上交易、仓储服务、物流运输、融资服务、委托服务和价格行情资讯，让你感受到最全面、最专业的中药材买卖及各类相关综合服务。
"/>
    <meta name="keywords" content="珍药材网，中药材，中药材价格行情，中药材交易，中药材仓储物流，中药材融资，中药材贷款，中药材金融，中药材采购，中药材供应"/>
    <link href="${RESOURCE_CSS}/css/reset.css" type="text/css" rel="stylesheet" />
    <link href="${RESOURCE_CSS}/css/common.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
    .warehousing{ width:1200px; margin:0 auto;}
	.warehousing img{ margin-bottom:70px;}
	.warehousing .warehousing_first{width:1200px; height:78px; background:url(${RESOURCE_IMG}/images/warehousing_01.png) no-repeat; margin:6px auto; padding-top:305px;  margin-bottom:65px;}
	.warehousing .warehousing_first a{width:234px; height:46px; background:url(${RESOURCE_IMG}/images/warehousing_button.png) no-repeat; display:block;}
	</style>
</head>
<body>
<!--topper start-->
<#include "common/indexListHeader.ftl">
<!--topper over-->

<!-- 祥情页主体开始 -->
<div class="area-1200 clearfix">
    <div class="warehousing">
    <div class="warehousing_first" align="center"><a href="/busiWarehouseApply/iWillWarehousing" target="_blank"></a></div>
    <img src="${RESOURCE_IMG}/images/warehousing_02.png" width="1200" height="905">
    <img src="${RESOURCE_IMG}/images/warehousing_03.png" width="1200" height="673">
    <img src="${RESOURCE_IMG}/images/warehousing_04.png" width="1200" height="1404">
    </div>
</div>
<!-- 祥情页主体over -->

<!-- 底部  -->
<#include "common/listFooter.ftl">
<!-- 底部 end  -->
<script type="text/javascript" src="${RESOURCE_JS}/js/common.js"></script>
<script type="text/javascript" src="${RESOURCE_JS}/js/search.js"></script>
<script type="text/javascript">
//var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1254171531'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s95.cnzz.com/z_stat.php%3Fid%3D1254171531' type='text/javascript'%3E%3C/script%3E"));
$(function(){
	$('#searchEngineListingButton').searcher({
		onSearch:function() {
		var keyword=$('input[type="text"].search-text').val();
		if(keyword == "输入名称找药材"){
			keyword='';
		}
		window.location.href='${JOINTOWNURL}/search?keyWords='+encodeURI(keyword);
	 	}
	});
});
</script>
</body>
</html>