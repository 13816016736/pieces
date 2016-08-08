<!DOCTYPE html>
<html lang="en">
<head>
<#include "./inc/meta.ftl"/>
    <title>商品管理-boss-饮片B2B</title>
</head>

<body>
<#include "./inc/header.ftl">
<!-- fa-floor start -->
<div class="fa-floor">
    <div class="wrap">
        <div class="side">
            <dl>
                <dt>单页面分类信息</dt>
                <dd>
                    <a class="curr" href="category.html">基本信息</a>
                </dd>
            </dl>
        </div>
        <div class="main">
            <form action="" id="myform">
                <div class="title">
                    <h3><i class="fa fa-chevron-right"></i>新增单页面分类</h3>
                    <div class="extra">
                        <button type="button" class="btn btn-gray" onclick="javascript:history.go(-1);">返回</button>
                        <button type="submit" class="btn btn-red">保存</button>
                    </div>
                </div>

                <div class="user-info">
                    <h3>基本信息</h3>
                    <div class="fa-form">
                        <div class="group">
                            <div class="txt">
                                <i>*</i>分类名称：
                            </div>
                            <div class="cnt">
                                <input type="text" class="ipt" value="" autocomplete="off" name="name" id="name"
                                       placeholder="">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div><!-- fa-floor end -->
</div>
<script src="js/jquery.min.js"></script>
<script src="js/validator/jquery.validator.min.js?local=zh-CN"></script>
<script src="js/common.js"></script>

<!-- footer start -->
<#include "./inc/footer.ftl"/>
<!-- footer end -->
<script>
    var roleAddPage = {
        v: {},
        fn: {
            init: function () {
                this.formValidate();
            },
            formValidate: function () {
                $('#myform').validator({
                    fields: {
                        name: 'required'
                    }
                });
            }
        }
    }
    $(function () {
        roleAddPage.fn.init();
    })


</script>
</body>
</html>