/*!
 * yiguo JavaScript Library v1.0.0
 * http://www.yiguo.com/
 *
 * Copyright 2016, yiguo.com
 *
 * Date: 2016-08-18
 */
(function (ygTrk) {
    var domain;
    ygTrk.extend = function (a, c) {
        for (var b in c) c.hasOwnProperty(b) && (a[b] = c[b]);
        return a;
    };
    ygTrk.extend(ygTrk, {
        idle: [1, 1],
        joinParameters: function (obj, separator) {
            var b = [], attr;
            if (separator === ",") {
                for (attr in obj) {
                    obj.hasOwnProperty(attr) && obj[attr] !== "" && obj[attr] != ygTrk && Array.prototype.push.call(b, obj[attr]);
                }
            }
            else if (separator === "&") {
                for (attr in obj) {
                    obj.hasOwnProperty(attr) && obj[attr] !== "" && obj[attr] != ygTrk && Array.prototype.push.call(b, attr + "=" + obj[attr]);
                }
            }
            return b.join(separator);
        },
        getQueryString: function (param) {
            var search, b = {},
            idx, len, valArr;
            if (!ygTrk.queryString) {
                try {
                    search = top.location.search;
                } catch (g) {
                    search = location.search;
                }
                if (search) {
                    search = search.substr(1);
                    search = search.split("&");
                    for (idx = 0, len = search.length; idx < len; idx++) valArr = search[idx].split("="),
                    valArr.length === 2 && (b[valArr[0]] = valArr[1]);
                }
                ygTrk.queryString = b;
            }
            return ygTrk.queryString[param];
        },
        getCurrentUrl: function () {
            var url = "";
            try {
                url = top.location.href;
            } catch (c) {
                try {
                    url = document.referrer;
                } catch (b) { }
            }
            return encodeURIComponent(url);
        },
        getPreviousUrl: function () {
            var url = "";
            try {
                url = top.document.referrer;
            } catch (c) { }
            return encodeURIComponent(url);
        },
        getBrowserInfo: function () {
            var agent = navigator.userAgent.toLowerCase();
            var regStr_ie = /msie [\d.]+;/gi;
            var regStr_ff = /firefox\/[\d.]+/gi;
            var regStr_chrome = /chrome\/[\d.]+/gi;
            var regStr_saf = /safari\/[\d.]+/gi;

            var btype = "", arr = new Array();
            try {
                if (agent.indexOf("msie") > 0) {
                    btype = agent.match(regStr_ie);
                    arr.push("ie");
                }
                else if (agent.indexOf("firefox") > 0) {
                    btype = agent.match(regStr_ff);
                    arr.push("firefox");
                }
                else if (agent.indexOf("chrome") > 0) {
                    btype = agent.match(regStr_chrome);
                    arr.push("chrome");
                }
                else if (agent.indexOf("safari") > 0 && agent.indexOf("chrome") < 0) {
                    btype = agent.match(regStr_saf);
                    arr.push("safari");
                }
                var ver = (btype + "").replace(/[^0-9.]/ig, "");
                arr.push(ver);
            } catch (e) {
                arr.push("other");
                arr.push("");
            }
            return arr;
        },
        getOsInfo: function () {
            var arr = new Array();
            try {
                var sUserAgent = navigator.userAgent;
                var isWin = (navigator.platform == "Win32") || (navigator.platform == "Windows");
                var isMac = (navigator.platform == "Mac68K") || (navigator.platform == "MacPPC") || (navigator.platform == "Macintosh") || (navigator.platform == "MacIntel");
                var isUnix = (navigator.platform == "X11") && !isWin;
                var isLinux = (String(navigator.platform).indexOf("Linux") > -1);
                if (isWin) {
                    arr[0] = "Windows";
                    var isWin2K = sUserAgent.indexOf("Windows NT 5.0") > -1 || sUserAgent.indexOf("Windows 2000") > -1;
                    if (isWin2K) arr[1] = "Win2000";
                    var isWinXP = sUserAgent.indexOf("Windows NT 5.1") > -1 || sUserAgent.indexOf("Windows XP") > -1;
                    if (isWinXP) arr[1] = "WXP";
                    var isWin2003 = sUserAgent.indexOf("Windows NT 5.2") > -1 || sUserAgent.indexOf("Windows 2003") > -1;
                    if (isWin2003) arr[1] = "Win2003";
                    var isWinVista = sUserAgent.indexOf("Windows NT 6.0") > -1 || sUserAgent.indexOf("Windows Vista") > -1;
                    if (isWinVista) arr[1] = "WinVista";
                    var isWin7 = sUserAgent.indexOf("Windows NT 6.1") > -1 || sUserAgent.indexOf("Windows 7") > -1;
                    if (isWin7) arr[1] = "Win7";
                    var isWin8 = sUserAgent.indexOf("Windows NT 6.2") > -1 || sUserAgent.indexOf("Windows 8") > -1;
                    if (isWin8) arr[1] = "Win8";
                    var isWin81 = sUserAgent.indexOf("Windows NT 6.3") > -1 || sUserAgent.indexOf("Windows 8.1") > -1;
                    if (isWin81) arr[1] = "Win8.1";
                    var isWin10 = sUserAgent.indexOf("Windows NT 10.0") > -1 || sUserAgent.indexOf("Windows 10") > -1;
                    if (isWin10) arr[1] = "Win10";
                } else if (isMac) {
                    arr[0] = "Mac";
                } else if (isUnix) {
                    arr[0] = "Unix";
                } else if (isLinux) {
                    arr[0] = "Linux";
                } else {
                    arr[0] = navigator.platform;
                }

                if (arr[1] === undefined) {
                    var ver = navigator.appVersion;
                    arr[1] = ver.substring(ver.indexOf("(") + 1, ver.indexOf(")"));
                }
            } catch (e) {
                arr[0] = "other";
                arr[1] = "";
            }
            return arr;
        },
        send: function (url) {
            var c = document.createElement("img"),
            b = document.getElementsByTagName("script")[0];
            c.style.display = "none";
            b.parentNode.insertBefore(c, b);
            c.src = url;
        },
        load: function (url, nowrite, fn1, sec, fn2) {
            var domScript, g = /loaded|complete/i,
            j = "ac_script_$" + Math.ceil(Math.random() * 1E10);
            nowrite ? (
                    domScript = document.createElement("script"),
                    domScript.type = "text/javascript",
                    domScript.async = true,
                    domScript.charset = "utf-8",
                    domScript.id = j,
                    domScript.src = url,
                    url = document.getElementsByTagName("script")[0],
                    url.parentNode.insertBefore(domScript, url)
                )
                :
                (
                    window.ActiveXObject && (g = /complete/i),
                    document.write('<script type="text/javascript" charset="utf-8" src="' + url + '" id="' + j + '"><\/script>')
                );

            if (domScript = document.getElementById(j))
                domScript.onload = domScript.onreadystatechange = function () {
                    var h;
                    if (!domScript.readyState || domScript.readyState.match(g))
                        if (typeof fn1 === "function" && fn1(), fn2 = fn1 = null, domScript && domScript.parentNode)
                            h = domScript.onload = domScript.onreadystatechange = null, domScript.src = "javascript:void(0)", domScript = h;
                };
            domScript.onerror = function () {
                typeof fn2 === "function" && fn2();
                fn2 = fn1 = null;
            };
            sec && setTimeout(function () {
                if (domScript)
                    typeof fn2 === "function" && fn2(),
                        sec = fn2 = null,
                        domScript.src = "javascript:void(0)";
            }, sec);
        },
        getTopDomain: function (url) {
            if (!arguments.callee.domain) {
                var sitenames = (url || location.hostname).split("."),
                    domn = /com|edu|gov|int|mil|net|org|biz|info|pro|name|museum|coop|aero|xxx|idv/,
                    f = sitenames.length - 1, e = 0;
                for (var d = sitenames.length - 1; d > -1; d--)
                    if (domn.test(sitenames[d])) {
                        f = d;
                        break;
                    } else {
                        /\d+/.test(sitenames[d]) && e++;
                    }
                sitenames.length == e && (f = 1);
                arguments.callee.domain = sitenames.slice(f - 1).join(".");
            } return arguments.callee.domain;
        },
        getWebsitename: function () {
            var name = "";
            if (document.referrer) {
                var sitenames = document.referrer.split("."),
                    domn = /baidu|so|soso|sogou|google|youdao|bing|yahoo|naver|ebay|timewarner|ask|yandex|alibaba|/,
                    f = sitenames.length - 1,
                    e = 0;
                for (var d = sitenames.length - 1; d > -1; d--)
                    if (domn.test(sitenames[d])) {
                        f = d;
                        break;
                    } else {
                        /\d+/.test(sitenames[d]) && e++;
                    }
                sitenames.length == e && (f = 1);
                if (f === 1)
                    name = "";
                else
                    name = sitenames[f - 1];
            }
            return name;
        },
        cookie: function (key, value, opt) {
            if (typeof value !== "undefined") {
                if (value === null) {
                    value = "";
                    opt = opt || {};
                    opt.expires = new Date(1970, 1, 1);
                    if (!opt.path)
                        opt.path = "/";

                    if (!opt.domain && domain)
                        opt.domain = domain;
                }
                key = key + "=" + encodeURIComponent(value);
                opt && (opt.path && (key += ";path = " + opt.path),
                    opt.expires instanceof Date && (key += ";expires = " + opt.expires.toGMTString()),
                    opt.domain && (key += ";domain = " + opt.domain),
                    opt.secure && (key += ";secure "));
                document.cookie = key;
            } else
                return RegExp(";?" + key + "=([^;]*);?").test(document.cookie) ? decodeURIComponent(RegExp.$1) : null;
        },
        JSON2String: function (jsn) {
            var c = Object.prototype.toString.call(jsn).toLowerCase(), b = "";
            if (c == "[object number]")
                b += jsn;
            else if (c == "[object string]") {
                jsn = jsn.replace(/[\'\"\/\\]/g, "\\$ & "),
                jsn = jsn.replace(/\r/g, "\\r "),
                jsn = jsn.replace(/\n/g, "\\n "),
                jsn = jsn.replace(/\t/g, "\\t "),
                b += '"' + jsn + '"';
            }
            else if (c == "[object array]") {
                b += "[";
                for (c = 0; c < jsn.length; c++)
                    b += ygTrk.JSON2String(jsn[c]), b += ", ";
                b.lastIndexOf(", ") == b.length - 1 && (b = b.substring(0, b.length - 1));
                b += "]";
            }
            else if (c == "[object object]") {
                b += "{";
                for (var d in jsn)
                    jsn.hasOwnProperty(d) && (b += '"' + d + '":', b += ygTrk.JSON2String(jsn[d]) + ",");
                b.lastIndexOf(",") == b.length - 1 && (b = b.substring(0, b.length - 1));
                b += "}";
            }
            return b;
        },
        JSONStringify: function (jsn) {
            var str = "";
            try { str = ygTrk.JSON2String(jsn); } catch (e) { }
            return str;
        },
        JSONParse: function (a) {
            var c; try { c = eval("(" + a + ")") } catch (b) { c = null }
            return c;
        },
        trimEnd: function (str, trimStr) {
            if (!trimStr) { return str; }
            var temp = str;
            while (true) {
                if (temp.substr(temp.length - trimStr.length, trimStr.length) != trimStr) {
                    break;
                }
                temp = temp.substr(0, temp.length - trimStr.length);
            }
            return temp;
        },
        validStr: function (field) {
            if (field === "" || field === undefined || field == null || field === "null") {
                return "";
            }
            return typeof field === "string" ? field.trim() : field;
        },
        dateToString: function (date) {
            if (!date) {
                date = new Date();
            }
            return date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate() + " " + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
        }
    });

    ygTrk.prototype = {
        constructor: "_YGTracker",
        track_timeout: 300,
        init: function (opt) {
            if (!opt)
                opt = ygTrk.properties;

            domain = "." + ygTrk.getTopDomain();

            var utm = {}, utmCookie, utm_source = ygTrk.getQueryString("utm_source"), utm_medium = ygTrk.getQueryString("utm_medium"), utm_term = ygTrk.getQueryString("utm_term"), utm_content = ygTrk.getQueryString("utm_content"), utm_campaign = ygTrk.getQueryString("utm_campaign");
            if (utm_source || utm_medium || utm_term || utm_content || utm_campaign) {
                utm.utm_source = encodeURIComponent(ygTrk.validStr(utm_source));
                utm.utm_medium = encodeURIComponent(ygTrk.validStr(utm_medium));
                utm.utm_term = encodeURIComponent(ygTrk.validStr(utm_term));
                utm.utm_content = encodeURIComponent(ygTrk.validStr(utm_content));
                utm.utm_campaign = encodeURIComponent(ygTrk.validStr(utm_campaign));
                utm.utm_date = ygTrk.dateToString();

                utmCookie = ygTrk.cookie("__ygactutm");
                if (utmCookie) {
                    utmCookie = ygTrk.JSONParse(utmCookie);
                    if (utmCookie !== null && (utm_source !== utmCookie.utm_source ||
                        utm_medium !== utmCookie.utm_medium ||
                        utm_term !== utmCookie.utm_term ||
                        utm_content !== utmCookie.utm_content ||
                        utm_campaign !== utmCookie.utm_campaign)) {
                        utmCookie.utm_source = utm.utm_source;
                        utmCookie.utm_medium = utm.utm_medium;
                        utmCookie.utm_term = utm.utm_term;
                        utmCookie.utm_content = utm.utm_content;
                        utmCookie.utm_campaign = utm.utm_campaign;
                        utmCookie.utm_date = utm.utm_date;
                    }
                } else {
                    utmCookie = utm;
                }
                if (utmCookie != null)
                    ygTrk.cookie("__ygactutm", ygTrk.JSONStringify(utmCookie), { domain: domain, expires: new Date((new Date).getTime() + 15552000000), path: "/" });
            }

            if (opt.ygm_project_id) {
                var o, actfp = ygTrk.cookie("__ygactfp2");
                this.ygm = {};
                if (typeof opt === "object")
                    for (o in opt)
                        opt.hasOwnProperty(o) && opt[o] != ygTrk && (this.ygm[o.toLowerCase()] = encodeURIComponent(ygTrk.validStr(opt[o])));

                if (!actfp) {
                    var domScript = document.createElement("script"), url = this.getBaseUrl() + "scripts/fingerprint2.min.js";
                    domScript.type = "text/javascript",
                        domScript.src = url,
                        url = document.getElementsByTagName("script")[0],
                        url.parentNode.insertBefore(domScript, url);

                    var _self = this;
                    window.setTimeout(function() {
                        var fp = new Fingerprint2();
                        fp.get(function(result, components) {
                            ygTrk.cookie("__ygactfp2", result, { domain: domain, expires: new Date((new Date).getTime() + 15552E6), path: "/" });

                            if (_self.ygm.ygm_action_page !== "" && _self.ygm.ygm_action_code !== "") {
                                _self.track({
                                    ygm_action_type: 0,
                                    ygm_action_page: _self.ygm.ygm_action_page,
                                    ygm_action_code: _self.ygm.ygm_action_code
                                });
                            } else {
                                _self.track({
                                    ygm_action_type: 0,
                                    ygm_action_page: "page.web",
                                    ygm_action_code: "ygm.web.open"
                                });
                            }

                        });
                    }, 20);

                } else {
                    if (this.ygm.ygm_action_page !== "" && this.ygm.ygm_action_code !== "") {
                        this.track({
                            ygm_action_type: 0,
                            ygm_action_page: this.ygm.ygm_action_page,
                            ygm_action_code: this.ygm.ygm_action_code
                        });
                    } else {
                        this.track({
                            ygm_action_type: 0,
                            ygm_action_page: "page.web",
                            ygm_action_code: "ygm.web.open"
                        });
                    }
                }
            }

            if (typeof ygTrk.callbacks === "object") {
                var calls = ygTrk.callbacks, i;
                for (i in calls)
                    if (typeof calls[i] === "object")
                        this[calls[i][0]].apply(this, calls[i][1]);
            }
        },
        track: function (obj) {
            var me = this;
            (function () {
                if (ygTrk.idle[1]) {//&& typeof Fingerprint2 !== "undefined"
                    var url = me.getServerUrl() + me.getParameters(obj),
                        sucFn = function () { ygTrk.idle[1] = 1 };
                    ygTrk.idle[1] = 0;
                    me.cer = obj;
                    ygTrk.load(url, 1, sucFn, 1E4, sucFn);
                }
                else
                    setTimeout(arguments.callee, 500);
            })();
        },
        tracks: function (arr) {
            if (arr) {
                var i, length;
                for (i = 0, length = arr.length; i < length; i++)
                    this.track(arr[i]);
            }
        },
        trackLinks: function (el, properties, timeout) {
            if (el) {
                var _this = this;
                el.onclick = function (e) {
                    _this.track(properties);

                    if (e && e.preventDefault)
                        e.preventDefault();
                    else
                        window.event.returnValue = false;

                    window.setTimeout(function () {
                        if (el.href) {
                            window.location.href = el.href;
                        }
                    }, timeout ? timeout : track_timeout);
                };
            }
        },
        register: function (properties) {
            var o;
            if (typeof properties === "object")
                for (o in properties)
                    properties.hasOwnProperty(o) && properties[o] !== "" && properties[o] != ygTrk && (this[o.toLowerCase()] = encodeURIComponent(properties[o]));
        },
        unregister: function (properties) {
            var o;
            if (typeof properties === "object")
                for (o in properties)
                    (o = properties[o]) && o !== "" && this[o] !== undefined && (this[o.toLowerCase()] = null);
            else if (typeof properties === "string") {
                properties !== "" && (this[properties.toLowerCase()] = null);
            }
        },
        setConfig: function (properties) {
            var o;
            if (typeof properties === "object")
                for (o in properties)
                    properties.hasOwnProperty(o) && properties[o] !== "" && this[o] !== undefined && (this[o.toLowerCase()] = properties[o]);
        },
        generateCurrentUrl: function (path) {
            var url = "";
            try {
                url = path.indexOf("/") == 0 ?
                    top.location.protocol + "//" + top.location.host + path :
                    /^https?:\/\//.test(path) ? path :
                    top.location.protocol + "//" + top.location.host + top.location.pathname.slice(0, top.location.pathname.lastIndexOf("/")) + "/" + path;
            } catch (b) {
                url = path.indexOf("/") == 0 ? location.protocol + "//" + location.host + path : /^https?:\/\//.test(path) ? path : location.protocol +
                    "//" + location.host + location.pathname.slice(0, location.pathname.lastIndexOf("/")) + "/" + path;
            }
            return encodeURIComponent(url);
        },
        getParameters: function (obj) {
            var o,
                //fp = new Fingerprint2(),
                bowser = ygTrk.getBrowserInfo(),
                actfp = ygTrk.cookie("__ygactfp2"),
                distinctid = actfp ? actfp : '',
                osInfo = ygTrk.getOsInfo();

            var params = {
                ygm_version: "1.0.0",
                ygm_url: ygTrk.getCurrentUrl(),
                screen_width: screen.width,
                screen_height: screen.height,
                browser: bowser[0],
                browser_version: bowser[1],
                os: osInfo[0],
                os_version: osInfo[1],
                referrer: document.referrer,
                referrer_domain: ygTrk.getTopDomain(document.referrer),
                search_engine: ygTrk.getWebsitename(),
                outer_sdk: "js_yiguo_tracker",
                outer_distinct_id: distinctid
            };

            //if (!distinctid) {
            //    fp.get(function (result, components) {
            //        params.outer_distinct_id = result;
            //        ygTrk.cookie("__ygactfp2", result, { domain: domain, expires: new Date((new Date).getTime() + 15552E6), path: "/" });
            //    });
            //}

            
            if (typeof this.ygm === "object")
                for (o in this.ygm)
                    this.ygm.hasOwnProperty(o) && this.ygm[o] !== "" && (params[o.toLowerCase()] = this.ygm[o]);

            if (typeof obj === "object")
                for (o in obj)
                    obj.hasOwnProperty(o) && obj[o] !== "" && obj[o] != ygTrk && (params[o.toLowerCase()] = encodeURIComponent(obj[o]));

            return ygTrk.joinParameters(params, "&");
        },
        getServerUrl: function () {
            return this.getBaseUrl() + "nact?";
        },
        getBaseUrl: function () {
            var baseUrl = this.ygm_server_url;
            $('script').each(function () {
                var script = ($(this).attr("src") + "").toLowerCase();
                var index = script.indexOf('ygtracker.js');
                var index1 = script.indexOf('scripts/');
                if (script.indexOf('//') >= 0 && index > 0) {
                    baseUrl = script.substring(0, index1);
                    return false;
                }
            });
            return baseUrl;
            //return this.ygm_server_url ? this.ygm_server_url : document.location.protocol === "https:" ? "https://tracker01.yiguo.com/" : "http://tracker01.yiguo.com/";
        },
        getCookie: function (name) {
            return ygTrk.cookie(name);
        },
        clickTrack: function (code, tag, commdityId, page) {
            this.track({
                ygm_action_type: 1,
                ygm_action_page: page ? page : this.ygm_action_page,
                ygm_action_code: code,
                ygm_action_tag: tag ? tag : "",
                ygm_action_commdity_id: commdityId ? commdityId : ""
            });
        },
        clickHomeAd: function (adId, commdityId, code, page) {
            this.track({
                ygm_action_type: 1,
                ygm_action_page: page ? page : this.ygm_action_page,
                ygm_action_code: code ? code : "ygm.home.ad.click",
                ygm_action_tag: adId,
                ygm_action_commdity_id: commdityId ? commdityId : "",
                ygm_action_group: ""
            });
        },
        clickFirstCategory: function (categoryId, code, page) {
            this.track({
                ygm_action_type: 1,
                ygm_action_page: page ? page : this.ygm_action_page,
                ygm_action_code: code ? code : "ygm.commditylist.firstcategorylist.item.click",
                ygm_action_tag: categoryId
            });
        },
        clickSecondCategory: function (categoryId, code, page) {
            this.track({
                ygm_action_type: 1,
                ygm_action_page: page ? page : this.ygm_action_page,
                ygm_action_code: code ? code : "ygm.commditylist.secondcategorylist.item.click",
                ygm_action_tag: categoryId
            });
        },
        clickAddCart: function (commdityId, tag, code, page) {
            this.track({
                ygm_action_type: 2,
                ygm_action_page: page ? page : this.ygm_action_page,
                ygm_action_code: code ? code : "ygm.commdity.addcart",
                ygm_action_tag: tag ? tag : commdityId,
                ygm_action_commdity_id: commdityId
            });
        },
        clickCommdityList: function (commdityId, code, page) {
            this.track({
                ygm_action_type: 1,
                ygm_action_page: page ? page : this.ygm_action_page,
                ygm_action_code: code ? code : "ygm.commditylist.item.click",
                ygm_action_tag: commdityId,
                ygm_action_commdity_id: commdityId
            });
        },
        orderSubmit: function (result, code, page) {
            this.track({
                ygm_action_type: 1,
                ygm_action_page: page ? page : this.ygm_action_page,
                ygm_action_code: code ? code : "ygm.order.submit",
                ygm_action_tag: result ? result : ""
            });
        },
        orderCancel: function (result, code, page) {
            this.track({
                ygm_action_type: 1,
                ygm_action_page: page ? page : this.ygm_action_page,
                ygm_action_code: code ? code : "ygm.order.cancel",
                ygm_action_tag: result ? result : ""
            });
        },
        orderPay: function (orderId, code, page) {
            this.track({
                ygm_action_type: 1,
                ygm_action_page: page ? page : this.ygm_action_page,
                ygm_action_code: code ? code : "ygm.order.pay",
                ygm_action_tag: orderId
            });
        },
        doSearch: function (keyword, code, page) {
            this.track({
                ygm_action_type: 1,
                ygm_action_page: page ? page : this.ygm_action_page,
                ygm_action_code: code ? code : "ygm.search.do",
                ygm_action_tag: keyword
            });
        },
        userLogin: function (type, code, page) {
            this.track({
                ygm_action_type: 1,
                ygm_action_page: page ? page : this.ygm_action_page,
                ygm_action_code: code ? code : "ygm.login",
                ygm_action_tag: type ? type : ""
            });
        },
        userRegister: function (code, page) {
            this.track({
                ygm_action_type: 1,
                ygm_action_page: page ? page : this.ygm_action_page,
                ygm_action_code: code ? code : "ygm.register"
            });
        },
        userLogout: function (code, page) {
            this.track({
                ygm_action_type: 1,
                ygm_action_page: page ? page : this.ygm_action_page,
                ygm_action_code: code ? code : "ygm.logout"
            });
        },
        userFindPwd: function (code, page) {
            this.track({
                ygm_action_type: 1,
                ygm_action_page: page ? page : this.ygm_action_page,
                ygm_action_code: code ? code : "ygm.forget"
            });
        },
        userFindpwd: function (code, page) {
            this.track({
                ygm_action_type: 1,
                ygm_action_page: page ? page : this.ygm_action_page,
                ygm_action_code: code ? code : "ygm.forget"
            });
        }
    };

    if (window.YGTracker) {
        ygTrk.prototype.init.prototype = ygTrk.prototype;
        window.YGTracker = new ygTrk.prototype.init();
    } else {
        window.YGTracker = ygTrk.prototype;
    }

})(window.YGTracker || {});