!function(){function e(e,t){for(var r=[],n=0;n<t;n++)r.push("0");var a=r.join("")+e;return a.substr(a.length-t)}app.directive("uoocSearchList",["courseService","$timeout",function(e,t){return{restrict:"AE",priority:2,require:"ngModel",scope:{searchUrl:"@",searchName:"@",searchWidth:"@",searchHeight:"@",searchHolder:"@",placeHolder:"@",serachTarget:"@",searchShow:"@",searchDefault:"=",searchName:"@"},template:'<input class="form-control search-show"  readonly placeholder="{{placeHolder}}" type="text" name="tmp" ng-model="showModel" ng-show="!searchShow" id="schoolBox" ng-click="showLayer()"><div class="search-layer-list" style="display:none"><div class="search-layer-header clearfix"><input type="text" name="search" class="form-control search-school" placeholder="搜索" ng-model="searchModel" ng-change = "searchData()"></div><div class="search-layer-body"><div class="search-layer-info">共搜索到以下<span>{{listData.length || 0}}</span>所学校</div><ul class="row"><li class="col-md-4"  ng-cloak ng-repeat="item in listData" ng-click="setData(item.id, item.name)"><a href="javascript:;">{{item.name}}</a></li></ul></div></div>',link:function(r,n,a,i){var o=(new Date).getTime();r.searchHolder=r.searchHolder||"机构",r.placeHolder=r.placeHolder||"机构",$(n[0]).find(".search-layer-list").attr("id",o);var c=$(n[0]).siblings(".org_hide");$("#"+r.serachTarget).on("click",function(){r.showLayer()});var s=null;r.showLayer=function(){s=layer.open({type:1,title:r.searchHolder||"选择机构",skin:"123",shadeClose:!0,area:["450px","260px"],offset:["px",0],content:$("#"+o)})},r.$watch("searchDefault",function(){r.showModel=r.searchDefault}),r.getData=function(){var t={};t.q=r.searchModel,e.getSchoolList(t).then(function(e){r.listData=e.data})},r.setData=function(e,t){i.$setViewValue(e),r.showModel=t,c.siblings(".Validform_wrong").hide(),layer.close(s),r.$emit("search-set-"+r.searchName,{id:e,name:t})};var u;r.searchData=function(){u&&t.cancel(u),u=t(function(){r.getData()},200)},r.$on("search-reset-"+r.searchName,function(){r.showModel="",r.listData=[],r.getData()}),r.$on("search-layer-"+r.searchName,function(){r.showLayer()}),r.getData()}}}]),app.directive("abortFile",["courseService",function(e){return{restrict:"AE",scope:{upfile:"=",onabort:"&"},template:'<span class="cancleup" ng-click="abortFile()" ng-if="!upfile._aborted && upfile" title="取消上传">取消上传</span>',link:function(e,t,r){e.abortFile=function(){setTimeout(function(){e.upfile.abort&&e.upfile.abort(),e.onabort&&e.onabort()},0)}}}}]),app.directive("tsort",["courseService",function(e){return{restrict:"AE",scope:{field:"@",onsort:"="},template:'<span class="manage-table-sort"><span class="manage-table-sort-up" ng-class="{active: current == 1}" ng-click="setSort(1)"></span><span class="manage-table-sort-down" ng-class="{active: current == 2}" ng-click="setSort(2)"></span></span>',link:function(e,t,r){var n={0:"",1:"asc",2:"desc"};e.current=0,e.setSort=function(t){e.current=e.current==t?0:t,e.onsort&&e.onsort({sort:n[e.current],field:e.field})}}}}]),app.directive("tableSort",function(){return{scope:{sortFiled:"@",sdata:"="},restrict:"A",link:function(e,t,r,n){t.addClass("sort-normal"),e.setSort=function(t){var r=e.sdata.sort,n=e.sdata.field,a=n==e.sortFiled;isCurLast=a&&"asc"==r,e.sdata.sort=a?isCurLast?"":"desc"==r?"asc":"desc":"desc",e.sdata.field=isCurLast?"":e.sortFiled,e.$emit("sort-change",{sort:e.sdata.sort,field:e.sdata.field})},e.setClass=function(){var r=e.sdata.sort,n=e.sdata.field,a=n==e.sortFiled;t.removeClass("sort-desc"),t.removeClass("sort-asc"),t.removeClass("sort-normal"),t.addClass(a&&r?"sort-"+r:"sort-normal")},e.$on("setclass",function(t,r){e.setClass()}),t.click(function(){e.setSort(!0),e.$parent.$broadcast("setclass",t),e.$apply()})}}}),app.directive("uoocProgressBar",function(){return{restrict:"AE",scope:{progressBarData:"@"},template:'<div class="uooc-progress-bar-top-item animate-all" ng-style="barStyle">{{scope.precent}}</div><div class="uooc-progress-bar-bottom-item"></div>',link:function(e){var t=e.progressBarData.split("/"),r=t[0]/t[1],n=100*r;isNaN(n)&&(n=0),e.barStyle={width:n+"%"}}}}),app.directive("timeTag",function(){return{restrict:"C",scope:{percent:"@",weeks:"@"},template:'<div><div class="time-tag-t">{{weeks}}周</div><div class="triangle"></div></div>',replace:!0,link:function(e,t,r,n){e.$watch("weeks",function(){e.init()})},controller:["$scope","$element",function(e,t){e.init=function(){var r=0,n=0;if(""==e.percent){var a=e.weeks.split("/");e.percent=100*a[0]/a[1]}e.percent=Number(String(e.percent).replace(/%/gim,"")),e.percent=Number(e.percent),e.percent<=3?(r="-10px",n=e.percent+"%"):e.percent>=97?(r="52px",n=$(t).parent().width()*e.percent/100-62+"px"):(r="19px",n=$(t).parent().width()*e.percent/100-30+"px"),$(t).css("margin-left",n),$(t).find(".triangle").css("margin-left",r)}}]}}),app.directive("uoocOpenSite",["uoocService","$window",function(e,t){return{restrict:"AE",scope:{site:"@",parent:"=",blank:"@"},link:function(e,r,n){r.bind("click",function(){for(var r=t,a="undefined"!=typeof n.parent,i="undefined"!=typeof n.blank;r.parent!==r&&a;)r=r.parent;i?r.open(e.site):r.location.href=e.site})}}}]),app.directive("uoocRefreshCode",["uoocService",function(e){return{restrict:"AE",scope:{},link:function(t,r,n){r.bind("click",function(){e.refreshCode(r[0])})}}}]),app.directive("uoocStars",function(){return{restrict:"AE",scope:{starsTotal:"=",starsLevel:"="},template:'<div class="starsGroup"><span  ng-cloak ng-repeat="star in starsArray" class="starItem" ng-class="{starLight: star.status == 1, starOff: star.status == 0, starHalf: star.status == 2}">{{star.status}}</span></div>',link:function(e,t,r,n){e.starTotal=angular.isDefined(r.starsTotal)?r.starsTotal:5,e.build=function(){e.starsArray=[];for(var t=0;t<e.starTotal;t++){var r=e.starsLevel-t;r>=0&&r>=1?e.starsArray.push({status:1}):r>0&&r<1?e.starsArray.push({status:2}):e.starsArray.push({status:0})}},e.build()}}}),app.directive("uoocHot",function(){return{restrict:"AE",scope:{fireTotal:"=",fireLevel:"="},template:"<span ng-cloak ng-repeat=\"fire in fireArray\" ng-class=\"{ true :'hot',false:'unhot'}[fire.status]\"></span>",link:function(e,t,r,n){e.firesTotal=angular.isDefined(r.fireTotal)?r.fireTotal:5,e.build=function(){e.fireArray=[];for(var t=0;t<e.firesTotal;t++){var r=e.fireLevel-t;r>0?e.fireArray.push({status:!0}):e.fireArray.push({status:!1})}},e.build()}}}),app.directive("uoocPasswordValid",function(){return{restrict:"A",require:"ngModel",link:function(e,t,r,n){var a=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$/;n.$parsers.push(function(e){var t=a.test(e);return n.$setValidity("uoocPasswordValid",t),e})}}}),app.directive("uoocPasswordEqualValid",function(){return{restrict:"A",require:"ngModel",link:function(e,t,r,n){var a=t.inheritedData("$formController")[r.uoocPasswordEqualValid];n.$parsers.push(function(e){return n.$setValidity("uoocPasswordEqualValid",e===a.$viewValue),e}),a.$parsers.push(function(e){return n.$setValidity("uoocPasswordEqualValid",e===n.$viewValue),e})}}}),app.directive("uoocPhoneEmailValid",function(){return{restrict:"A",require:"ngModel",link:function(e,t,r,n){n.$parsers.push(function(e){var t=/^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,10}$/.test(e),r=/^1\d{10}$/.test(e),a=r||t;return n.$setValidity("pwFormatCheck",a),e})}}}),app.directive("uoocEmailValid",function(){return{restrict:"A",require:"ngModel",link:function(e,t,r,n){n.$parsers.push(function(e){var t=/^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,10}$/.test(e);return n.$setValidity("uoocEmailCheck",t),e})}}}),app.directive("agreeTrems",function(){return{restrict:"A",require:"ngModel",link:function(e,t,r,n){n.$parsers.push(function(e){return n.$setValidity("agreeTrems",e),e})}}}),app.directive("uoocTrim",function(){return{restrict:"A",link:function(e,t,r,n){var a=t[0];a.onkeydown=function(){setTimeout(function(){a.value=a.value.replace(/\r|\n|\s+/g,"")})},t.onchange=function(){a.value=a.value.replace(/(^\s*)|(\s*$)/g,"")}}}}),app.directive("uoocCheckbox",function(){return{restrict:"A",scope:{uoocReturn:"=",uoocChekced:"=",uoocChange:"&",uoocName:"@"},template:'<span class="uooc-checkbox" ng-class="{uoocCheckboxFocus: uoocChekced}" ng-click="toggleCheckbox()"><i class="iconfont icon-checkbox-f"></i><i class="iconfont icon-checkbox"></i><input ng-checked="uoocChekced" type="checkbox" name="{{uoocName}}" style="display:none" /></span>',link:function(e,t,r,n){e.toggleCheckbox=function(){e.uoocChekced=!e.uoocChekced},e.$watch("uoocChekced",function(){e.uoocChange()})}}}),app.directive("courseManageHeader",function(){return{restrict:"AE",templateUrl:"/tpl/directive/course.manage.header.html",scope:{xtitle:"=",tabDisabled:"=",activeName:"=",hideLive:"=",hideBack:"="},link:function(e,t,r){}}}),app.filter("get_attrs",function(){return function(e,t){var r=t.join(",")+",",n={};return _.each(e,function(e,t){r.search(t+",")>=0&&(n[t]=e)}),n}}),app.filter("to_trusted",["$sce",function(e){return function(t){return e.trustAsHtml(String(t))}}]),app.filter("jsonParse",function(){return function(e){if(e)return JSON.parse(decodeURI(e))}}),app.filter("valid_mail",function(){return function(e){return/^([a-zA-Z0-9_\.-]+)@([\da-z\.-]+)\.([a-zA-Z\.]{2,6})$/.test(e)}}),app.filter("image_title",["$sce","$filter",function(e,t){return function(t){var r=t.replace(/<img.*?(?:>|\/>)/g,"<span class='iconfont icon-iconfonttupian'></span>");return e.trustAsHtml(r)}}]),app.filter("no_html",["$sce","$filter",function(e,t){return function(e){return e.replace(/<[^>]+>/g,"")}}]),app.filter("answerChecked",["$filter",function(e){return function(t,r){t=angular.isNumber(t)?e("numberToWord")(t):t;var n=(r+"").toLowerCase(),a=t.toLowerCase();if(a){var i=n.indexOf(a);return i!=-1}}}]),app.filter("isFileType",function(){return function(e,t){var r=(e+"").split(/\./g).pop();if(t){var n=new RegExp(t,"igm");return n.test(r)}return!0}}),app.filter("fileType",function(){return function(e){var t=(e+"").split(/\./g).pop();return t.toLowerCase()}}),app.filter("filePreview",["$filter",function(e){return function(t){var r="doc|docx|xls|xlsx|ppt|pptx|pdf|zip|rar|uof|ofd|txt|jpg|png|gif|jpeg|bmp|csv|mp4|mp3";return e("isFileType")(t,r)}}]),app.directive("preview",["$filter",function(e){return{restrict:"AE",link:function(t,r,n){r.delegate("a","click",function(t){var r=angular.element(t.target).attr("href"),n=e("filePreview")(r);if(n){t.preventDefault();var a=e("isFileType")(r,"mp4"),i=e("isFileType")(r,"mp3"),o=angular.element(window).height()-80,c={type:2,shadeClose:!0,resize:!0,maxmin:!0},s=i?{title:"音频预览",content:r,area:["300px","150px"]}:a?{title:"视频预览",content:r,area:["600px","380px"]}:{title:"文件预览",content:"/files/view/?uri="+r,area:["980px",o+"px"]};layer.open(angular.extend({},s,c))}})}}}]),app.filter("fileCanView",["$filter",function(e){return function(t){for(var r=["jpg","png","jpeg","gif","pdf","mp4"],n=e("fileType")(t),a=0;a<r.length;a++)if(n==r[a])return!0;return!1}}]),app.filter("fileIsImage",["$filter",function(e){return function(t){for(var r=["jpg","png","jpeg","gif","bmp"],n=e("fileType")(t),a=0;a<r.length;a++)if(n==r[a])return!0;return!1}}]),app.filter("percent",["$filter",function(e){return function(e,t,r){return r||(r="%"),(Math.round(1e4*e)/100).toFixed(t||0)+r}}]),app.filter("isNumberRange",["$filter",function(e){return function(e,t){var r=t.split(","),n=parseInt(e),a=parseInt(r[0]),i=parseInt(r[1]);return 1==r.length?!isNaN(n)&&!isNaN(a)&&n>=a:2==r.length&&(!(isNaN(n)||isNaN(a)||isNaN(i))&&(n>=a&&n<=i))}}]),app.filter("encodeURI",function(){return function(e){return encodeURI(e)}}),app.filter("escapeURL",["$filter",function(e){return function(e){var t=/^(https?\:\/\/)(.+)/,r=t.exec(e),n=r?r[2]:e;if(!n)return"";for(var a=n.split("/"),i=0;i<a.length;i++){var o=i+1==a.length;a[i]=encodeURIComponent(a[i])+(o?"":"/")}var c=a.join("");return r?r[1]+c:c}}]),app.filter("formatCDNSource",["$filter",function(e){return function(t){if(!t)return{count:0,list:[]};var r={source:"原画",standard:"标清",high:"高清","super":"超清",cdn1:"线路1",cdn2:"线路2",cdn3:"线路3",cdn4:"线路4",cdn5:"线路5"},t=t,n={count:0,list:[]};return angular.forEach(t,function(a,i){var o={};o.name=r[i]||i,o.cdn=i,o.weight=parseInt(t[o.cdn].ratio)||0,o.source=[];var c=["source","standard","high","super"];angular.forEach(a,function(t,a){var s=c.join(",").search(a);if(t&&s>-1){n.count++;var u=e("fileType")(t),l=r[a];o.source.push({name:l,uri:e("escapeURL")(t),ftype:"m3u8"==u?"application/x-mpegURL":"video/mp4",stype:a,cdn:i})}}),n.list.push(o)}),n}}]),app.filter("formatTrackSource",["$filter",function(e){return function(e){if(e){for(var t=[],r=0;r<e.length;r++){var n=e[r];n.uri&&t.push({title:n.title,name:"字幕"+(r+1),uri:n.uri})}return t}}}]),app.filter("numberToZh",function(){return function(e){function t(e){for(var t=e.toString(),r=e.toString().length,a=[],i=0;i<r;i++)a.push(n[t.charAt(i)]);return a.join("")}var r=e,n=["零","一","二","三","四","五","六","七","八","九"];return t(r)}}),app.filter("numberToWord",function(){return function(e,t){var r=String.fromCharCode(64+parseInt(e));return t?r.toLowerCase():r}}),app.filter("empty",function(){return function(e){return e?e:"--"}}),app.filter("deletTag",function(){return function(e){var t=e.replace(/<\/?.+?>/g,"");return t.replace(/&nbsp;/g,"")}}),app.filter("dateToMillisecond",["$filter",function(e){return function(e){var t=e.replace(/-/g,"/"),r=new Date(t),n=r.getTime().toString();return n}}]),app.filter("comparingDate",["$filter",function(e){return function(t,r){var n,a=e("dateToMillisecond")(t);return n=r?e("dateToMillisecond")(r):(new Date).getTime(),a>n}}]),app.filter("timerObj",function(){return function(e,t,r){e=+e;var n=Math.floor(e/3600);e%=3600;var a=Math.floor(e/60),i=e%60;return{hours:n,minutes:a,seconds:i}}}),app.filter("timer",function(){return function(t,r,n){r=r!==!1,t=+t;var a=Math.floor(t/3600);t%=3600;var i=Math.floor(t/60),o=t%60,c="";return(o>0||(i>0||a>0)&&r)&&(c=e(o,2)+"秒"),(i>0||a>0&&r)&&(c=""+e(i,2)+"分"+c),a>0&&(c=""+a+"小时"+c),c||(c=n||"--"),c}}),app.filter("getSec",function(){return function(e){var t=1*e.substring(1,e.length),r=e.substring(0,1);return"s"==r?1e3*t:"h"==r?60*t*60*1e3:"d"==r?24*t*60*60*1e3:void 0}}),app.filter("setCookie",["$filter",function(e){return function(t,r,n){var a=e("getSec")(n||"d180"),i=new Date;return i.setTime(i.getTime()+1*a),document.cookie=t+"="+escape(r)+";expires="+i.toGMTString(),!0}}]),app.filter("getCookie",["$filter",function(e){return function(e){var t,r=new RegExp("(^| )"+e+"=([^;]*)(;|$)");return(t=document.cookie.match(r))?unescape(t[2]):null}}]),app.filter("delCookie",["$filter",function(e){return function(t){var r=new Date;r.setTime(r.getTime()-1);var n=e("getCookie")(t);null!=n&&(document.cookie=t+"="+n+";expires="+r.toGMTString())}}]),app.filter("clearHtmlTag",["$filter",function(e){return function(e){return e.replace(/(<.[^>]*>)/gi,"")}}])}();