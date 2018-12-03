!function () {
    var e = {
        searchToObj: function (e) {
            for (var t = e || location.search, r = t.substring(1).split("&"), n = {}, a = 0; a < r.length; a++) {
                var i = r[a].split("=");
                n[i[0]] = i[1]
            }
            return n
        }, objToQueryString: function (e) {
            var t = "";
            for (var r in e) e.hasOwnProperty(r) && r && (t += r + "=" + e[r] + "&");
            return "?" + t.substr(0, t.length - 1)
        }, inArray: function (e, t) {
            for (var r = e.length; r--;) if (e[r] === t) return !0;
            return !1
        }, isArray: function (e) {
            return "[object Array]" === Object.prototype.toString.call(arguments[0])
        }, isPlainObject: function (e) {
            return "[object Object]" === Object.prototype.toString.call(arguments[0])
        }, extend: function () {
            var e, t, r, n, a = 1, i = !1, o = arguments.length, s = arguments[0];
            for ("boolean" == typeof s && (i = s, s = arguments[a] || {}, a++), "object" != typeof s && (s = {}); a < o; a++) if (null != (e = arguments[a])) for (t in e) {
                var r = s[t], n = e[t];
                if (s !== n) {
                    var l = this.isArray(n), c = this.isPlainObject(n);
                    i && n && (l || c) ? (l ? clone = r && this.isArray(r) ? r : [] : clone = r && this.isPlainObject(r) ? r : {}, s[t] = this.extend(i, clone, n)) : void 0 !== n && (s[t] = n)
                }
            }
            return s
        }, escapeURL: function (e) {
            var t = /^(https?\:\/\/)(.+)/, r = t.exec(e), n = r ? r[2] : e;
            if (!n) return "";
            for (var a = n.split("/"), i = 0; i < a.length; i++) {
                var o = i + 1 == a.length;
                a[i] = encodeURIComponent(a[i]) + (o ? "" : "/")
            }
            var s = a.join("");
            return r ? r[1] + s : s
        }, isImage: function (e) {
            var t = "jpg|png|gif|jpeg";
            return this.isMatchFile(e, t)
        }, fileCanPreview: function (e) {
            var t = "doc|docx|xls|xlsx|ppt|pptx|pdf|zip|rar|uof|ofd|txt|jpg|png|gif|jpeg|bmp|csv|mp4|mp3";
            return this.isMatchFile(e, t)
        }, isMatchFile: function (e, t) {
            var r = this.getFileExtension(e);
            if (t) {
                var n = t.split("|");
                return this.inArray(n, r)
            }
            return !0
        }, getFileExtension: function (e) {
            var t = (e + "").split(/\./g).pop();
            return t.toLowerCase()
        }
    }, t = {
        layerLogin: function () {
            layer.open({
                type: 2,
                title: !1,
                closeBtn: !1,
                shadeClose: !0,
                area: ["600px", "540px"],
                skin: "login-layer",
                zIndex: 99999999,
                content: ["/" +
                "userapp/login", "no"],
                success: function () {
                },
                end: function () {
                }
            })
        }, layerRegister: function () {
            layer.open({
                type: 2,
                title: !1,
                closeBtn: !1,
                shadeClose: !0,
                area: ["670px", "640px"],
                skin: "login-layer",
                zIndex: 99999999,
                content: ["/userapp/register", "no"]
            })
        }, advert: function (e) {
            var t, r = $.extend({
                target: "#ad",
                code: "",
                area: ["100%", "auto"],
                layer: !1,
                animate: !1,
                timeout: 0,
                close: !0,
                random: !1,
                swiper: !1,
                style: {},
                onclose: function () {
                }
            }, e), n = $(r.target), a = r.area[0], i = r.area[1], o = r.withBackground;
            n.css({display: "none"});
            var s = function (e) {
                for (var t = [], r = 0; r < e.length; r++) {
                    var n = e[r], a = n.activity1_url, i = encodeURI(n.activity1_img_url),
                        s = o ? '<a class="swiper-slide s-advert-imte" style="width: 100%; height: 100%; display: block; background-image: url(' + i + '); background-position: center; background-repeat: no-repeat; background-size: cover;" target="_blank" href="' + a + '"></a>' : '<a class="swiper-slide s-advert-imte" style="overflow: hidden; width: 100%; height: 100%; display: block;" target="_blank" href="' + a + '"><img style="display: block; width: 100%;" src="' + i + '" /></a>';
                    t.push(s)
                }
                return t
            }, l = function () {
                new Swiper(r.target, r.swiper || {})
            }, c = function () {
                t = layer.open($.extend({
                    title: !1,
                    type: 1,
                    closeBtn: !1,
                    scrollbar: !1,
                    zIndex: 99999,
                    area: r.area,
                    content: n
                }, r.layer))
            }, p = function (e) {
                if (!e.length) return void n.hide();
                n.css($.extend({
                    display: "block",
                    overflow: "hidden",
                    position: "relative",
                    width: a
                }, r.style)), n[r.animate ? "animate" : "css"]({height: i}), n.append('<div class="s-advert-wrapper swiper-wrapper" style="position: relative; width: 100%; height: 100%"></div>');
                var o = n.find(".s-advert-wrapper");
                r.random && (e = [e[Math.floor(Math.random() * e.length)]]);
                var p = s(e);
                o.append(p.join("")), r.swiper && r.layer ? (l(), c()) : r.swiper ? l() : r.layer && c(), r.close && (n.append('<span class="s-advert-close" unselectable="on"><i class="iconfont icon-error"></i></span>'), n.find(".s-advert-close").on("click", function () {
                    t ? layer.close(t) : n.slideUp(), r.onclose && r.onclose()
                }))
            };
            $.get("/index/appOperation", {code: r.code}).then(function (e) {
                var t = e.data || {}, n = t[r.code] || [];
                setTimeout(function () {
                    p(n)
                }, r.delay)
            })
        }
    }, r = {
        setImageCenter: function (e) {
            var t = e.jqEle, r = e.area, n = r[0], a = r[1], i = e.realArea, o = i[0], s = i[1], l = n / a, c = o / s,
                p = l < c ? {
                    height: a + "px",
                    width: o * a / s,
                    marginLeft: "-" + (o * a / s - n) / 2 + "px"
                } : l > c ? {
                    width: n + "px",
                    height: n * s / o + "px",
                    marginTop: "-" + (n * s / o - a) / 2 + "px"
                } : {width: "100%", height: "100%"};
            t.removeAttr("style"), t.css(p)
        }, setLazyImage: function (e) {
            var t = e.attr("data-src"), n = e.parent(), a = e.attr("area") || n.width() + "," + n.height(),
                i = a.split(","), o = i[0], s = i[1], l = e.attr("data-default-img"),
                c = l || staticRoot + "/base/images/img_load.png", p = l || staticRoot + "/base/images/img_load.png";
            e.parent().css({overflow: "hidden"}), e.attr("src", c), r.setImageCenter({
                jqEle: e,
                area: [o, s],
                realArea: [300, 207]
            });
            var d = new Image;
            d.src = t, d.onload = function () {
                r.setImageCenter({jqEle: e, area: [o, s], realArea: [d.width, d.height]}), e.attr("src", t)
            }, d.onerror = function () {
                e.attr("src", p), r.setImageCenter({jqEle: e, area: [o, s], realArea: [300, 207]})
            }
        }
    }, n = e.extend(t, e, r);
    window.APP_METHODS = n, window._M = n
}();