<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Expires" content="0" />
    <title>微信后台管理-求购信息详情</title>
    <link rel="stylesheet" type="text/css" href="${RESOURCE_CSS_WX}/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${RESOURCE_CSS_WX}/css/common.css">
    <link rel="stylesheet" type="text/css" href="${RESOURCE_CSS_WX}/css/admin.css">
	<script type="text/javascript" src="${RESOURCE_JS_WX}/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="${RESOURCE_JS_WX}/js/jqueryTouch.js"></script>
	<script type="text/javascript" src="${RESOURCE_JS_WX}/js/layer/layer-Mobile/layer.js"></script>
</head>
<body>
<div class="sell-box-head">
    <i class="back" onclick="history.go(-1)"></i>
    <div align="center" class="inStore-title">求购详情</div>
</div>
<div class="pt32"></div>
<div class="a-headbg"></div>
<div class="box-layout">
    <p class="bd-font1">
	        发布人：${(demand.userName)!''}<br/>
	        联系电话：${(demand.userMobile)!''}<br/>
	        品种名称：${(demand.breedName)!''}<br/>
	        规格：${(demand.breedStandardLevel)!''}<br/>
	        价格：${(demand.breedPrice)!''}<br/>
	        求购数量：${(demand.qtyUnitQty)!''}<br/>
	        产地：${(demand.breedPlace)!''}<br/>
	        描述：${(demand.depict)!''}<br/>
    </p>
    
    <#if (demand.status)?? && demand.status == 0>
	    <div class="a-bd-box1">
	        <div>
	            <textarea name="mcpForumPost.postTitle" id="subject" class="beizhu" size="500" maxlength="500" theme="simple" onblur="check()" onkeyup="checkLength(this)" accesskey="1" tabindex="11" placeholder="输入备注" ></textarea>
	            <div class="cl">
			        <p id="subjectchk">
	        			可输入
			            <strong id="checklen">500</strong>
		            	字
			        </p>
	                <span id="postNameRule" class="spn_flag_1" style="display:none"></span>
	            </div>
	        </div>
			
	        <div align="center" class="opr-1">
	            <input type="button" class="a-btn-1" value="无效" onclick="checkDemand('${(demand.demandId)!''}', '${(demand.applyResource)!''}', '2')"/>&nbsp;&nbsp;
	            <input type="button" class="a-btn-1" value="有效" onclick="checkDemand('${(demand.demandId)!''}', '${(demand.applyResource)!''}', '1')"/>
	        </div>
	    </div>
    </#if>
</div>

<script>
    // 只要键盘一抬起就验证编辑框中的文字长度，最大字符长度可以根据需要设定
    function checkLength(obj)  {

        var maxChars = 500;//最多字符数
        var curr = maxChars - obj.value.length;
        if( curr > 0 ){
            document.getElementById("checklen").innerHTML = curr.toString();
        }else{
            document.getElementById("checklen").innerHTML = '0';
            //document.getElementById("subject").readOnly=true;
        }

    }
</script>

<script>
    // 审核求购信息
    function checkDemand(demandId, applyResource, status){
    	var remarks = $('#subject').val();
    	$.ajax({
				async : false,
				cache : false,
				type : "POST",
				data : {"demandId" : demandId, "applyResource" : applyResource, "remarks" : remarks, "status" : status},
				dataType : "json",
				url : "/WxBoss/demandManager/checkDemand",
				success : function(data) {
					var ok = data.ok;
					var msg = data.msg;
					if(ok == true){
			    		layer.open({
						    content: msg,
						    shadeClose: false,
						    style: 'text-align:center;',
						    btn: ['OK'],
						    yes: function(index){
							    layer.close(index);
							    history.go(-1);
							}
						});
						 
					}else{
						if(msg != undefined){
			    			layerMsg(msg);
			    		}else{
			    			layerMsg('网络繁忙，请稍后再试！');
			    		}
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown){
					layerMsg('操作失败！');
				}
			});
    };
    
    //提示框
    function layerMsg(msg){
    	layer.open({
		    content: msg,
		    style: 'background-color:rgba(0, 0, 0, 0.6); color:#fff; border:none; text-align:center;',
		    time: 2
		});
    };
</script>

<span style="display: none;">
<!-- 东网微信CNZZ
<script src="http://s95.cnzz.com/z_stat.php?id=1254784539&web_id=1254784539" language="JavaScript"></script> -->
<!-- 珍药网微信CNZZ -->
<script src="http://s4.cnzz.com/z_stat.php?id=1255308754&web_id=1255308754" language="JavaScript"></script>
</span>
</body>
</html>