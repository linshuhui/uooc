function app_1119(){}app.controller("mainCtrl",["userInfo","$scope","$rootScope","courseService",function(t,e,r,o){function a(){return o.getCouponList().then(function(t){t.data.page?e.couponNum=t.data.page.total:e.couponNum=0})}r.user=t,r.getUserInfo=function(){return o.userInfo().then(function(t){return console.log(123,t),r.user=t.data,t.data})},e.hdentify=function(){e.hideIdentifyMask=!1,location.href="/home#/center/identify/student"},e.getUserStat=function(){o.getUserStat().then(function(t){e.userStat=t.data})},e.getUserStat(),e.getUserTodoList=function(){return o.userTodo().then(function(t){return e.todoList=t.data,t.data})},e.getUserTodoList(),a(),e.timeForma=function(t){return t.slice(t.indexOf("-")+1,t.lastIndexOf(":"))},e.avatarSava={prefix:r.user.id+"/avatar/",type:"user",width:400,url:r.user.avatar},e.layerCropt=function(){e.$broadcast("layerCrop")},e.updatePic=function(){r.user.avatar=e.avatarSava.url,o.setAvatar({avatar:e.avatarSava.url}),$("#top_avatar").attr("src",e.avatarSava.url)},e.layerQuitCourse=function(t,r){e.courItem={courseid:t},30==r?(e.courItem.courseHistory=1,e.courItem.code="nostart",layer.confirm("确定取消当前课程?",{icon:3,moveType:1,offset:"250px",btn:["确定","取消"]},function(){e.quitCourse()})):layer.open({type:1,title:"申请退课",area:["400px","290px"],content:$(".exitCourse")})},e.quitCourse=function(){return!(!e.courItem.courseHistory||!e.courItem.code)&&void o.quitCourse({course_id:e.courItem.courseid,clear:e.courItem.courseHistory,code:e.courItem.code},function(t){layer.closeAll(),$("#"+e.courItem.courseid).slideUp(600,function(){$(this).remove()})})},e.getQuiteCode=function(){o.sendVerifyCode({cid:e.courItem.courseid}).then(function(t){layer.msg(t.msg),e.setVcodeTimer(60)})},e.quiteInterval=0,e.setVcodeTimer=function(t){e.quiteInterval=t;var r=setInterval(function(){--e.quiteInterval,e.quiteInterval<=0&&clearInterval(r),e.$apply()},1e3)}}]),angular.element(document).ready(function(){angular.bootstrap(document.body,["app"],{strictDi:!0})});