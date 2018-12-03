app.controller("courseDetail", ["$scope", "$window", "uoocService", "courseService", "$compile", "$timeout", function (e, t, c, o, n, i) {
    function a() {
        var e = document.createElement("script");
        e.setAttribute("type", "text/javascript"), e.setAttribute("id", "qd28521569563158ea482c61d2aeeafb2966ecc4f8bc"), e.setAttribute("charset", "utf-8"), e.setAttribute("src", "https://wp.qiye.qq.com/qidian/2852156956/3158ea482c61d2aeeafb2966ecc4f8bc"), s.appendChild(e), l = !0
    }

    e.queryParams = c.searchToObj(), e.isPreview = "preview" == e.queryParams.show, e.cycleList = window.cycleList || [], e.learnCycleId = window.learnCycleId || "", e.cycleItem = null, e.is_country_boutique = 1 == window.country_boutique;
    var r = window.courseInfo;
    e.courseInfo = {
        intro: r.intro || "暂无简介",
        objective: r.teaching_objective || "暂无教学目标",
        method: r.teaching_method || "暂无教学方法",
        material: r.teaching_material || "暂无参考教材"
    }, e.cycleTab = "intro", e.changeTab = function (t) {
        e.cycleTab = t
    }, e.cycleInfo = null;
    var l = !1, s = document.getElementById("scriptContainer");
    if (e.getCycleInfo = function (t) {
        return o.getCycleInfo({cid: t}).then(function (t) {
            if (e.cycleInfo = t.data, l) {
                var c = s.getElementsByTagName("iframe")[0],
                    o = c.contentWindow.document.getElementsByClassName("wpa-container")[0];
                20 == r.type && 1 * e.cycleInfo.price > 0 ? o.style.display = "block" : o.style.display = "none"
            } else 20 == r.type && 1 * e.cycleInfo.price > 0 && a()
        })
    }, e.showQQ = function () {
        var e = document.getElementById("qidian_wpa_2852156956_159").contentWindow,
            t = e.document.getElementsByTagName("a");
        t[0].click()
    }, e.chooseCycle = function (t) {
        t && e.getCycleInfo(t.id).then(function () {
            e.cycleItem = t, e.changeTab("intro")
        })
    }, e.cycleList.length <= 0) e.cycleItem = null; else if (e.queryParams.cycleid || e.learnCycleId) {
        var u = e.queryParams.cycleid || e.learnCycleId;
        e.cycleItem = _.find(e.cycleList, function (e) {
            return e.id == u
        })
    } else e.cycleItem = _.find(e.cycleList, function (e) {
        return 1 == e.join_status
    }), e.cycleItem = e.cycleItem || e.cycleList[0];
    e.chooseCycle(e.cycleItem), $("#followBtn").click(function () {
        var e = $(this), t = $("#followCnt");
        o.follow({course_id: window.courseId}, function () {
            var c = t.text().match(/\d+/g);
            e.hasClass("color-warning") ? (--c, e.removeClass("color-warning")) : (++c, e.addClass("color-warning")), t.html(c + "人")
        })
    }), e.addCourse = function () {
        o.joincourse({cid: e.cycleInfo.id, noErrorMsg: !0}).then(function (t) {
            1 == t.data.is_jump ? location.href = "/home/course/" + e.cycleInfo.id : layer.msg(t.msg)
        })["catch"](function (e) {
            103 == e.code ? layer.alert("您所选的课程为学分课<br>需要认证为在校学生后才可以学习", {
                title: "温馨提示",
                area: ["300px", "180px"],
                btn: ["去认证"]
            }, function () {
                location.href = "/home#/center/account/identify/student"
            }) : layer.msg(e.msg)
        })
    }, e.clickHasResd = function () {
        console.log(233)
    }, e.hasRead = !1;
    var d;
    e.joinCourse = function () {
        "MOOC-ALL" == e.cycleInfo.attribute_key ? d = layer.open({
            type: 1,
            zIndex: 1e3,
            title: "重要提示",
            area: ["950px", "520px"],
            content: $("#no-credit-mooc"),
            success: function (e) {
                console.log("success")
            }
        }) : e.addCourse()
    }, e.closeLayer = function () {
        layer.close(d)
    }
}]), angular.element(document).ready(function () {
    var e = function (e) {
        for (var t = /^(https?\:\/\/)(.+)/, c = t.exec(e), o = c ? c[2] : e, n = o.split("/"), i = 0; i < n.length; i++) {
            var a = i + 1 == n.length;
            n[i] = encodeURIComponent(n[i]) + (a ? "" : "/")
        }
        var r = n.join("");
        return c ? c[1] + r : r
    };
    if (window.introVideo) {
        var t = $("#intro_video"),
            c = t.append('<video id="player" class="video-js vjs-default-skin" srclang="zh" poster="' + courseInfo.cover_img + '"></video>').find("video")[0];
        player = videojs(c, {
            controlBar: {children: ["progressControl", "playToggle", "volumeMenuButton", "remainingTimeDisplay", "durationDisplay", "currentTimeDisplay", "playbackRateMenuButton", "fullscreenToggle", "videoSource", "trackSource"]},
            width: 620,
            height: 350,
            currentTime: !0,
            uoocPlayer: !0,
            srclang: "zh",
            preload: "auto",
            loop: !1,
            autoplay: !1,
            controls: !0,
            bigPlayButton: !0,
            playbackRates: [.8, 1, 1.3],
            techOrder: ["html5", "flash"]
        }), player.on("ready", function () {
            player.src({type: "video/mp4", src: e(window.introVideo)})
        })
    }
    angular.bootstrap(document.body, ["app"], {strictDi: !0})
});