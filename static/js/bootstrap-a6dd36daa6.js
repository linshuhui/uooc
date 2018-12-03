!function () {
    var e = _M.searchToObj();
    $(".query-u").click(function () {
        var c = $(this).attr("name").split("-"), t = c[0], n = c[1];
        e[t] = "all" === n ? 0 : n, e.page = "page" == t ? n : 1, location.href = _M.objToQueryString(e)
    }), $(".lazy-img").each(function () {
        _M.setLazyImage($(this))
    }), $('.s-checkbox input[type="checkbox"]').bind("change", function () {
        $(this).is(":checked");
        $(this).parent().toggleClass("checked")
    });
    var c = ($('.s-checkbox input[type="checkbox"]:checked').each(function (e, c) {
        $(c).parent().eq(0).addClass("checked")
    }), document.getElementById("loginBtn")), t = document.getElementById("registerBtn");
    c && (c.onclick = function () {
        APP_METHODS.layerLogin()
    }, t.onclick = function () {
        APP_METHODS.layerRegister()
    })
}();