function app_1119() {
}

var app = angular.module("app", ["common.module", "oc.lazyLoad", "ui.router", "uooc.pager", "course.service"]).run(["$rootScope", "$state", "$stateParams", "$filter", "uoocService", function (e, o, t, i, s) {
    e.$state = o, e.$stateParams = t, e.staticRoot = window.staticRoot, e.$watch("$state.current.url", function () {
        e.stateName = e.$state.current.name, e.setCookieFromurl()
    }), e.closeAll = function () {
        layer.closeAll()
    };
    var n = {prevent: !1, msg: "路由被阻止"};
    e.preventRouter = function (e, o) {
        n.prevent = e, n.msg = o || n.msg
    }, e.$on("$stateChangeStart", function (t, i, s) {
        n.prevent && (t.preventDefault(), layer.confirm(n.msg, {btn: ["确定离开", "留在本页"]}, function () {
            e.preventRouter(!1), o.go(i.name, s), layer.closeAll()
        }, function () {
            layer.closeAll()
        }))
    }), e.setCookieFromurl = function () {
        if ("/user/login" != location.pathname) {
            var e = encodeURI(location.pathname, "utf-8"), o = encodeURI(location.hash.replace("#", ""), "utf-8");
            s.setCookie("formpath", e, 720, "/"), s.setCookie("formhash", o, 720, "/")
        }
    }, e.setCookieFromurl(), e.getCookieFromurl = function () {
        var e = s.getCookieValue("formpath"), o = s.getCookieValue("formhash");
        return e + (o ? "#" + o : "")
    }, window.onbeforeunload = function () {
        if (n.prevent) return n.msg
    }, e.tipDone = function (o, t) {
        t && t.stopPropagation(), e[o] = i("setCookie")(o, "yes")
    }
}]).config(["$controllerProvider", "$compileProvider", "$filterProvider", "$provide", function (e, o, t, i) {
    app.controller = e.register, app.directive = o.directive, app.filter = t.register, app.factory = i.factory, app.service = i.service, app.constant = i.constant, app.value = i.value
}]).constant("Ueditor_Config", {
    "default": ["bold", "italic", "underline", "forecolor", "justifyleft", "justifyright", "justifycenter", "link", "insertimage", "inserttable", "kityformula", "fontsize"],
    question: ["fullscreen", "bold", "italic", "underline", "forecolor", "justifyleft", "justifyright", "justifycenter", "link", "insertimage", "inserttable", "kityformula", "fontsize", "attachment"]
}).constant("Lazy_Files", {
    ueditor: ["/assets/ueditor/ueditor.config.js", "/assets/ueditor/ueditor.min.js", "/assets/ueditor/lang/zh-cn/zh-cn.js"],
    ueditorKityFormula: ["/assets/ueditor/kityformula-plugin/addKityFormulaDialog.js", "/assets/ueditor/kityformula-plugin/getKfContent.j", "/assets/ueditor/kityformula-plugin/defaultFilterFix.js"],
    laydate: [window.staticRoot + "/index/css/plugins/laydate-4ded7f9f69.css", window.staticRoot + "/index/js/vendors/laydate/laydate.js"],
    uploadFile: [window.staticRoot + "/index/js/vendors/jquery.ui.widget.js", window.staticRoot + "/index/js/vendors/jquery.iframe-transport.js", window.staticRoot + "/index/js/vendors/jquery.fileupload.js"],
    validform: [window.staticRoot + "/index/js/vendors/Validform_v5.3.1.js"],
    chosen: [window.staticRoot + "/index/js/vendors/chosen.jquery.min.js", window.staticRoot + "/index/js/vendors/select2/select2.min.css"],
    bosUp: [window.staticRoot + "/index/js/vendors/bce-bos-uploader.bundle.min.js", window.staticRoot + "/index/js/directives/bosUp-863f995c74.js", window.staticRoot + "/index/js/directives/bosLib-fb32984e65.js", window.staticRoot + "/index/js/directives/bosAll-7d2e4f328a.js"],
    uoocVideo: [window.staticRoot + "/index/js/vendors/videojs-contrib-hls.js", window.staticRoot + "/index/js/service/videoService-03f8e71579.js", window.staticRoot + "/index/js/directives/uoocVideo-31666f9275.js"],
    fileupload: [window.staticRoot + "/index/js/vendors/jquery.ui.widget.js", window.staticRoot + "/index/js/vendors/jquery.iframe-transport.js", window.staticRoot + "/index/js/vendors/jquery.fileupload.js"],
    videoJs: [window.staticRoot + "/index/css/plugins/video-js-e83ffa9176.css", window.staticRoot + "/index/js/vendors/video.js"],
    uoocPdf: [window.staticRoot + "/index/js/vendors/pdf.js", window.staticRoot + "/index/js/vendors/pdf.worker.js", window.staticRoot + "/index/js/directives/angular-pdf-545d6e3acb.js"],
    uoocEditor: [window.staticRoot + "/index/js/directives/uoocEditor-1decd4a383.js"],
    orderChapter: [window.staticRoot + "/index/js/directives/orderChapter-ba80de1746.js"],
    chapterSource: [window.staticRoot + "/index/js/directives/chapterSource-1f38f05d9b.js"],
    sourceView: [window.staticRoot + "/index/js/directives/sourceView-2d629aeb99.js"],
    questionSubject: [window.staticRoot + "/index/js/directives/questionSubject-8a042735cc.js"],
    swfObject: [window.staticRoot + "/index/js/vendors/swfObject/swfobject.js"],
    cropAvatar: [window.staticRoot + "/index/js/vendors/cropper.min.js", window.staticRoot + "/index/css/plugins/cropper-5431399b8a.css", window.staticRoot + "/index/js/directives/cropAvatar-11b4084c02.js"],
    discussDetail: [window.staticRoot + "/index/css/student/discuss3-8ae29c2dc1.css", window.staticRoot + "/index/js/vendors/jquery.ui.widget.js", window.staticRoot + "/index/js/vendors/jquery.iframe-transport.js", window.staticRoot + "/index/js/vendors/jquery.fileupload.js", window.staticRoot + "/index/js/directives/replay-editor-0d2c95eff0.js", window.staticRoot + "/index/js/directives/post-detail-ad85b08190.js"]
}).config(["$ocLazyLoadProvider", function (e) {
    e.config({
        debug: !1,
        events: !0,
        modules: [{
            name: "uooc.pager",
            files: [window.staticRoot + "/index/js/directives/pager-f66c30a338.js"]
        }, {
            name: "uooc.tableDrop",
            files: [window.staticRoot + "/index/js/directives/tableDrop-6730ec2ec5.js"]
        }, {
            name: "uooc.dropMenu",
            files: [window.staticRoot + "/index/js/directives/dropMenu-49bbacf855.js"]
        }, {
            name: "correct.table",
            files: [window.staticRoot + "/index/js/directives/correctTable-ee61471cc1.js"]
        }, {
            name: "privateMsg.module",
            files: [window.staticRoot + "/index/js/directives/privateMsg-0e372f323d.js"]
        }, {
            name: "course.service",
            files: [window.staticRoot + "/index/js/service/courseService-966c7794e4.js"]
        }, {
            name: "question.service",
            files: [window.staticRoot + "/index/js/service/questionService-8cc89ef279.js"]
        }, {name: "CacheFactory", files: [window.staticRoot + "/index/js/vendors/angular-cache.js"]}, {
            name: "bos",
            files: [window.staticRoot + "/index/js/service/bosService-1f138befa5.js"]
        }]
    })
}]);