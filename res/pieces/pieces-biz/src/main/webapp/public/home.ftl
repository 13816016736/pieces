<!DOCTYPE html>
<html lang="en">
<head>
    <#include "./inc/meta.ftl"/>
    <title>${baseSetting.title!}</title>
    <meta name="description" content="${baseSetting.intro!}" />
    <meta name="Keywords" content="${baseSetting.keyWord!}" />
</head>
<body class="bg-gray">

<#include "./inc/header.ftl"/>
<script>
    // 开启页面搜索悬浮
    var searchFixed = true;
</script>

<!-- banner start -->
<div class="banner-slider" id="jslide">
    <div class="bd">
        <ul>
            <#list AD_BANNER as ad>
                <li style="background-color:${ad.color!};">
                    <a title="${ad.title!}" style="background-image:url(${ad.pictureUrl!})" href="${ad.link!"#!"}"></a>
                </li>
            </#list>
        </ul>
    </div>
    <div class="hd"></div>
    <div class="side-notice">
        <div class="quick">
            <a href="/commodity/index" class="btn btn-red"><i class="fa fa-question-circle"></i>我要询价</a>
            <span>挑选商品，提交询价单</span>
            <hr />
            <a href="/center/enquiry/record" class="btn btn-primary"><i class="fa fa-cart"></i>我要下单</a>
            <span>登录，在询价记录中下单</span>
        </div>
        <h3>服务公告</h3>
        <ul>
            <#list articles as article>
                <li><a href="news/${article.id!}">${article.title!}</a></li>
            </#list>
        </ul>
    </div>
</div><!-- banner end -->

<div class="activity">
    <div class="wrap">
        <ul>
            <#list commodityList as commodity>
                <li>
                    <a href="/commodity/${commodity.id!}">
                        <div class="txt">
                            <h4>${commodity.name!}</h4>
                            <p>规格：${commodity.spec!}</p>
                            <p><span class="t-orange">热销</span></p>
                        </div>
                        <div class="img">
                            <img src="${commodity.pictureUrl!}" width="180" height="180" alt="${commodity.title!}">
                        </div>
                    </a>
                </li>
            </#list>
        </ul>
    </div>
</div>

<div class="wrap idx-main">
    <#list categoryList as category>
        <!-- start -->
        <div class="idx-floor" id="floor${category_index}">
                <div class="idx-hd">
                    <h2>${category.title!}</h2>
                </div>
                <div class="idx-bd">
                    <div class="cat">
                        <ul>
                            <#if category.breedList??>
                                <#list category.breedList as breed>
                                    <li><a href="commodity/index?breedId=${breed.id!}" >${breed.name!}</a></li>
                                </#list>
                            </#if>
                        </ul>
                        <div class="img">
                            <img src="images/blank.gif" alt="${category.title!}" class="lazyload" data-original="${urls.getForLookupPath(category.pictureUrl)}" width="200" height="270">
                        </div>
                    </div>

                    <div class="pro">
                        <dl>
                            <dt>
                                <#if category.showcase??>
                                    <a href="${category.showcase.link!}"><img alt="${category.title!}" src="images/blank.gif" class="lazyload" data-original="${category.showcase.pictureUrl!}" width="400" height="270"></a>
                                </#if>
                            </dt>
                            <#if category.breedList??>
                                <#list category.commodityList as commodity>
                                    <dd>
                                        <a href="/commodity/${commodity.id!}"><img src="images/blank.gif" alt="${commodity.title!}" class="lazyload" data-original="${commodity.pictureUrl180!}" width="180" height="180"></a>
                                        <a href="/commodity/${commodity.id!}">${commodity.name!}</a>
                                        <span>片型：${commodity.spec!}</span>
                                    </dd>
                                </#list>
                            </#if>
                        </dl>
                    </div>
                </div>
        </div><!-- end -->
        <#if category_index%2!=0 >
            <#assign adindex=(category_index/2)>
            <#if AD_SHOWCASE_BAR[adindex]?? >
                <div class="wide-banner">
                    <a href="${AD_SHOWCASE_BAR[adindex?int].link!}"><img alt="${AD_SHOWCASE_BAR[adindex?int].title!}" src="images/blank.gif" class="lazyload" data-original="${AD_SHOWCASE_BAR[adindex?int].pictureUrl!}" width="1200" height="90"></a>
                </div>
            </#if>
        </#if>

    </#list>
</div>

<#include "./inc/helper.ftl"/>
<#include "./inc/footer.ftl"/>

<div class="elevator"></div>
<div class="toolbar"></div>
<script src="${urls.getForLookupPath('/js/index_2016.js')}"></script>
</body>
</html>