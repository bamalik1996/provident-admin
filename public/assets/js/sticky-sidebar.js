! function (e, t) {
    "object" == typeof exports && "undefined" != typeof module ? module.exports = t() : "function" == typeof define && define.amd ? define("dist/jquery.sticky-sidebar.js", t) : ((e = "undefined" != typeof globalThis ? globalThis : e || self)["dist/jquery"] = e["dist/jquery"] || {}, e["dist/jquery"]["sticky-sidebar"] = e["dist/jquery"]["sticky-sidebar"] || {}, e["dist/jquery"]["sticky-sidebar"].js = t())
}(this, function () {
    "use strict";
    var e, t, i = (function (e) {
        function t(e) {
            return e && e.__esModule && Object.prototype.hasOwnProperty.call(e, "default") ? e.default : e
        }

        function i(e, t) {
            return e(t = {
                exports: {}
            }, t.exports), t.exports
        }
        var n;
        e.exports = (t(n = i(function (e, t) {
            ! function (e) {
                function s(e, t) {
                    if (!(e instanceof t)) throw new TypeError("Cannot call a class as a function")
                }
                Object.defineProperty(e, "__esModule", {
                    value: true
                });
                var t = function () {
                        function n(e, t) {
                            for (var i = 0; i < t.length; i++) {
                                var n = t[i];
                                n.enumerable = n.enumerable || false;
                                n.configurable = true;
                                if ("value" in n) n.writable = true;
                                Object.defineProperty(e, n.key, n)
                            }
                        }
                        return function (e, t, i) {
                            if (t) n(e.prototype, t);
                            if (i) n(e, i);
                            return e
                        }
                    }(),
                    i = function () {
                        var f = ".stickySidebar";
                        var n = {
                            topSpacing: 0,
                            bottomSpacing: 0,
                            containerSelector: false,
                            scrollContainer: false,
                            innerWrapperSelector: ".inner-wrapper-sticky",
                            stickyClass: "is-affixed",
                            minWidth: false
                        };
                        var e = function () {
                            function c(e) {
                                var t = this;
                                var i = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : {};
                                s(this, c);
                                this.options = c.extend(n, i);
                                this.sidebar = "string" === typeof e ? document.querySelector(e) : e;
                                if ("undefined" === typeof this.sidebar) throw new Error("There is no specific sidebar element.");
                                this.sidebarInner = false;
                                this.container = this.sidebar.parentElement;
                                this.affixedType = "STATIC";
                                this.direction = "down";
                                this.support = {
                                    transform: false,
                                    transform3d: false
                                };
                                this._initialized = false;
                                this._reStyle = false;
                                this._breakpoint = false;
                                this.dimensions = {
                                    translateY: 0,
                                    maxTranslateY: 0,
                                    topSpacing: 0,
                                    lastTopSpacing: 0,
                                    bottomSpacing: 0,
                                    lastBottomSpacing: 0,
                                    sidebarHeight: 0,
                                    sidebarWidth: 0,
                                    containerTop: 0,
                                    containerHeight: 0,
                                    viewportHeight: 0,
                                    viewportTop: 0,
                                    lastViewportTop: 0
                                };
                                ["handleEvent"].forEach(function (e) {
                                    t[e] = t[e].bind(t)
                                });
                                this.initialize()
                            }
                            t(c, [{
                                key: "initialize",
                                value: function e() {
                                    var i = this;
                                    this._setSupportFeatures();
                                    if (this.options.innerWrapperSelector) {
                                        this.sidebarInner = this.sidebar.querySelector(this.options.innerWrapperSelector);
                                        if (null === this.sidebarInner) this.sidebarInner = false
                                    }
                                    if (!this.sidebarInner) {
                                        var t = document.createElement("div");
                                        t.setAttribute("class", "inner-wrapper-sticky");
                                        this.sidebar.appendChild(t);
                                        while (this.sidebar.firstChild != t) t.appendChild(this.sidebar.firstChild);
                                        this.sidebarInner = this.sidebar.querySelector(".inner-wrapper-sticky")
                                    }
                                    if (this.options.containerSelector) {
                                        var n = document.querySelectorAll(this.options.containerSelector);
                                        n = Array.prototype.slice.call(n);
                                        n.forEach(function (e, t) {
                                            if (!e.contains(i.sidebar)) return;
                                            i.container = e
                                        });
                                        if (!n.length) throw new Error("The container does not contains on the sidebar.")
                                    }
                                    this.scrollContainer = this.options.scrollContainer ? document.querySelector(this.options.scrollContainer) : undefined;
                                    if ("function" !== typeof this.options.topSpacing) this.options.topSpacing = parseInt(this.options.topSpacing) || 0;
                                    if ("function" !== typeof this.options.bottomSpacing) this.options.bottomSpacing = parseInt(this.options.bottomSpacing) || 0;
                                    this._widthBreakpoint();
                                    this.calcDimensions();
                                    this.stickyPosition();
                                    this.bindEvents();
                                    this._initialized = true
                                }
                            }, {
                                key: "bindEvents",
                                value: function e() {
                                    var t = this;
                                    this.eventTarget = this.scrollContainer ? this.scrollContainer : window;
                                    this.eventTarget.addEventListener("resize", this, {
                                        passive: true,
                                        capture: false
                                    });
                                    this.eventTarget.addEventListener("scroll", this, {
                                        passive: true,
                                        capture: false
                                    });
                                    this.sidebar.addEventListener("update" + f, this);
                                    if ("undefined" !== typeof ResizeObserver) {
                                        var i = new ResizeObserver(function () {
                                            return t.handleEvent()
                                        });
                                        i.observe(this.sidebarInner);
                                        i.observe(this.container)
                                    }
                                }
                            }, {
                                key: "handleEvent",
                                value: function e(t) {
                                    this.updateSticky(t)
                                }
                            }, {
                                key: "calcDimensions",
                                value: function e() {
                                    if (this._breakpoint) return;
                                    var t = this.dimensions;
                                    t.containerTop = c.offsetRelative(this.container).top;
                                    t.containerHeight = this.container.clientHeight;
                                    t.containerBottom = t.containerTop + t.containerHeight;
                                    t.sidebarHeight = this.sidebarInner.offsetHeight;
                                    t.sidebarWidth = this.sidebarInner.offsetWidth;
                                    t.viewportHeight = window.innerHeight;
                                    t.maxTranslateY = t.containerHeight - t.sidebarHeight;
                                    this._calcDimensionsWithScroll()
                                }
                            }, {
                                key: "_calcDimensionsWithScroll",
                                value: function e() {
                                    var t = this.dimensions;
                                    t.sidebarLeft = c.offsetRelative(this.sidebar).left;
                                    if (this.scrollContainer) {
                                        t.viewportTop = this.scrollContainer.scrollTop;
                                        t.viewportLeft = this.scrollContainer.scrollLeft
                                    } else {
                                        t.viewportTop = document.documentElement.scrollTop || document.body.scrollTop;
                                        t.viewportLeft = document.documentElement.scrollLeft || document.body.scrollLeft
                                    }
                                    t.viewportBottom = t.viewportTop + t.viewportHeight;
                                    t.topSpacing = this.options.topSpacing;
                                    t.bottomSpacing = this.options.bottomSpacing;
                                    if ("function" === typeof t.topSpacing) t.topSpacing = parseInt(t.topSpacing(this.sidebar)) || 0;
                                    if ("function" === typeof t.bottomSpacing) t.bottomSpacing = parseInt(t.bottomSpacing(this.sidebar)) || 0;
                                    if ("VIEWPORT-TOP" === this.affixedType) {
                                        if (t.topSpacing < t.lastTopSpacing) {
                                            t.translateY += t.lastTopSpacing - t.topSpacing;
                                            this._reStyle = true
                                        }
                                    } else if ("VIEWPORT-BOTTOM" === this.affixedType)
                                        if (t.bottomSpacing < t.lastBottomSpacing) {
                                            t.translateY += t.lastBottomSpacing - t.bottomSpacing;
                                            this._reStyle = true
                                        } t.lastTopSpacing = t.topSpacing;
                                    t.lastBottomSpacing = t.bottomSpacing
                                }
                            }, {
                                key: "isSidebarFitsViewport",
                                value: function e() {
                                    return this.dimensions.viewportHeight >= this.dimensions.lastBottomSpacing + this.dimensions.lastTopSpacing + this.dimensions.sidebarHeight
                                }
                            }, {
                                key: "observeScrollDir",
                                value: function e() {
                                    var t = this.dimensions;
                                    if (t.lastViewportTop === t.viewportTop) return;
                                    var i = "down" === this.direction ? Math.min : Math.max;
                                    if (t.viewportTop === i(t.viewportTop, t.lastViewportTop)) this.direction = "down" === this.direction ? "up" : "down"
                                }
                            }, {
                                key: "getAffixType",
                                value: function e() {
                                    this._calcDimensionsWithScroll();
                                    var t = this.dimensions;
                                    var i = t.viewportTop + t.topSpacing;
                                    var n = this.affixedType;
                                    if (i <= t.containerTop || t.containerHeight <= t.sidebarHeight) {
                                        t.translateY = 0;
                                        n = "STATIC"
                                    } else n = "up" === this.direction ? this._getAffixTypeScrollingUp() : this._getAffixTypeScrollingDown();
                                    t.translateY = Math.max(0, t.translateY);
                                    t.translateY = Math.min(t.containerHeight, t.translateY);
                                    t.translateY = Math.round(t.translateY);
                                    t.lastViewportTop = t.viewportTop;
                                    return n
                                }
                            }, {
                                key: "_getAffixTypeScrollingDown",
                                value: function e() {
                                    var t = this.dimensions;
                                    var i = t.sidebarHeight + t.containerTop;
                                    var n = t.viewportTop + t.topSpacing;
                                    var s = t.viewportBottom - t.bottomSpacing;
                                    var r = this.affixedType;
                                    if (this.isSidebarFitsViewport()) {
                                        if (t.sidebarHeight + n >= t.containerBottom) {
                                            t.translateY = t.containerBottom - i;
                                            r = "CONTAINER-BOTTOM"
                                        } else if (n >= t.containerTop) {
                                            t.translateY = n - t.containerTop;
                                            r = "VIEWPORT-TOP"
                                        }
                                    } else if (t.containerBottom <= s) {
                                        t.translateY = t.containerBottom - i;
                                        r = "CONTAINER-BOTTOM"
                                    } else if (i + t.translateY <= s) {
                                        t.translateY = s - i;
                                        r = "VIEWPORT-BOTTOM"
                                    } else if (t.containerTop + t.translateY <= n && 0 !== t.translateY && t.maxTranslateY !== t.translateY) r = "VIEWPORT-UNBOTTOM";
                                    return r
                                }
                            }, {
                                key: "_getAffixTypeScrollingUp",
                                value: function e() {
                                    var t = this.dimensions;
                                    var i = t.sidebarHeight + t.containerTop;
                                    var n = t.viewportTop + t.topSpacing;
                                    var s = t.viewportBottom - t.bottomSpacing;
                                    var r = this.affixedType;
                                    if (n <= t.translateY + t.containerTop) {
                                        t.translateY = n - t.containerTop;
                                        r = "VIEWPORT-TOP"
                                    } else if (t.containerBottom <= s) {
                                        t.translateY = t.containerBottom - i;
                                        r = "CONTAINER-BOTTOM"
                                    } else if (!this.isSidebarFitsViewport())
                                        if (t.containerTop <= n && 0 !== t.translateY && t.maxTranslateY !== t.translateY) r = "VIEWPORT-UNBOTTOM";
                                    return r
                                }
                            }, {
                                key: "_getStyle",
                                value: function e(t) {
                                    if ("undefined" === typeof t) return;
                                    var i = {
                                        inner: {},
                                        outer: {}
                                    };
                                    var n = this.dimensions;
                                    switch (t) {
                                        case "VIEWPORT-TOP":
                                            i.inner = {
                                                position: "fixed",
                                                top: n.topSpacing,
                                                left: n.sidebarLeft - n.viewportLeft,
                                                width: n.sidebarWidth
                                            };
                                            break;
                                        case "VIEWPORT-BOTTOM":
                                            i.inner = {
                                                position: "fixed",
                                                top: "auto",
                                                left: n.sidebarLeft,
                                                bottom: n.bottomSpacing,
                                                width: n.sidebarWidth
                                            };
                                            break;
                                        case "CONTAINER-BOTTOM":
                                        case "VIEWPORT-UNBOTTOM":
                                            var s = this._getTranslate(0, n.translateY + "px");
                                            if (s) i.inner = {
                                                transform: s
                                            };
                                            else i.inner = {
                                                position: "absolute",
                                                top: n.translateY,
                                                width: n.sidebarWidth
                                            };
                                            break
                                    }
                                    switch (t) {
                                        case "VIEWPORT-TOP":
                                        case "VIEWPORT-BOTTOM":
                                        case "VIEWPORT-UNBOTTOM":
                                        case "CONTAINER-BOTTOM":
                                            i.outer = {
                                                height: n.sidebarHeight,
                                                position: "relative"
                                            };
                                            break
                                    }
                                    i.outer = c.extend({
                                        height: "",
                                        position: ""
                                    }, i.outer);
                                    i.inner = c.extend({
                                        position: "relative",
                                        top: "",
                                        left: "",
                                        bottom: "",
                                        width: "",
                                        transform: ""
                                    }, i.inner);
                                    return i
                                }
                            }, {
                                key: "stickyPosition",
                                value: function e(t) {
                                    if (this._breakpoint) return;
                                    t = this._reStyle || t || false;
                                    this.options.topSpacing;
                                    this.options.bottomSpacing;
                                    var i = this.getAffixType();
                                    var n = this._getStyle(i);
                                    if ((this.affixedType != i || t) && i) {
                                        var s = "affix." + i.toLowerCase().replace("viewport-", "") + f;
                                        c.eventTrigger(this.sidebar, s);
                                        if ("STATIC" === i) c.removeClass(this.sidebar, this.options.stickyClass);
                                        else c.addClass(this.sidebar, this.options.stickyClass);
                                        for (var r in n.outer) {
                                            var o = "number" === typeof n.outer[r] ? "px" : "";
                                            this.sidebar.style[r] = n.outer[r] + o
                                        }
                                        for (var a in n.inner) {
                                            var l = "number" === typeof n.inner[a] ? "px" : "";
                                            this.sidebarInner.style[a] = n.inner[a] + l
                                        }
                                        var p = "affixed." + i.toLowerCase().replace("viewport-", "") + f;
                                        c.eventTrigger(this.sidebar, p)
                                    } else if (this._initialized) this.sidebarInner.style.left = n.inner.left;
                                    this.affixedType = i
                                }
                            }, {
                                key: "_widthBreakpoint",
                                value: function e() {
                                    if (window.innerWidth <= this.options.minWidth) {
                                        this._breakpoint = true;
                                        this.affixedType = "STATIC";
                                        this.sidebar.removeAttribute("style");
                                        c.removeClass(this.sidebar, this.options.stickyClass);
                                        this.sidebarInner.removeAttribute("style")
                                    } else this._breakpoint = false
                                }
                            }, {
                                key: "updateSticky",
                                value: function e() {
                                    var t = this;
                                    var i = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};
                                    if (this._running) return;
                                    this._running = true;
                                    (function (e) {
                                        requestAnimationFrame(function () {
                                            switch (e) {
                                                case "scroll":
                                                    t._calcDimensionsWithScroll();
                                                    t.observeScrollDir();
                                                    t.stickyPosition();
                                                    break;
                                                case "resize":
                                                default:
                                                    t._widthBreakpoint();
                                                    t.calcDimensions();
                                                    t.stickyPosition(true);
                                                    break
                                            }
                                            t._running = false
                                        })
                                    })(i.type)
                                }
                            }, {
                                key: "_setSupportFeatures",
                                value: function e() {
                                    var t = this.support;
                                    t.transform = c.supportTransform();
                                    t.transform3d = c.supportTransform(true)
                                }
                            }, {
                                key: "_getTranslate",
                                value: function e() {
                                    var t = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : 0;
                                    var i = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : 0;
                                    var n = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : 0;
                                    if (this.support.transform3d) return "translate3d(" + t + ", " + i + ", " + n + ")";
                                    else if (this.support.translate) return "translate(" + t + ", " + i + ")";
                                    else return false
                                }
                            }, {
                                key: "destroy",
                                value: function e() {
                                    window.removeEventListener("resize", this, {
                                        capture: false
                                    });
                                    window.removeEventListener("scroll", this, {
                                        capture: false
                                    });
                                    this.sidebar.classList.remove(this.options.stickyClass);
                                    this.sidebar.style.minHeight = "";
                                    this.sidebar.removeEventListener("update" + f, this);
                                    var t = {
                                        inner: {},
                                        outer: {}
                                    };
                                    t.inner = {
                                        position: "",
                                        top: "",
                                        left: "",
                                        bottom: "",
                                        width: "",
                                        transform: ""
                                    };
                                    t.outer = {
                                        height: "",
                                        position: ""
                                    };
                                    for (var i in t.outer) this.sidebar.style[i] = t.outer[i];
                                    for (var n in t.inner) this.sidebarInner.style[n] = t.inner[n];
                                    if (this.options.resizeSensor && "undefined" !== typeof ResizeSensor) {
                                        ResizeSensor.detach(this.sidebarInner, this.handleEvent);
                                        ResizeSensor.detach(this.container, this.handleEvent)
                                    }
                                }
                            }], [{
                                key: "supportTransform",
                                value: function e(t) {
                                    var i = false,
                                        n = t ? "perspective" : "transform",
                                        s = n.charAt(0).toUpperCase() + n.slice(1),
                                        r = ["Webkit", "Moz", "O", "ms"],
                                        o = document.createElement("support"),
                                        a = o.style;
                                    (n + " " + r.join(s + " ") + s).split(" ").forEach(function (e, t) {
                                        if (a[e] !== undefined) {
                                            i = e;
                                            return false
                                        }
                                    });
                                    return i
                                }
                            }, {
                                key: "eventTrigger",
                                value: function e(t, i, n) {
                                    try {
                                        var s = new CustomEvent(i, {
                                            detail: n
                                        })
                                    } catch (e) {
                                        var s = document.createEvent("CustomEvent");
                                        s.initCustomEvent(i, true, true, n)
                                    }
                                    t.dispatchEvent(s)
                                }
                            }, {
                                key: "extend",
                                value: function e(t, i) {
                                    var n = {};
                                    for (var s in t)
                                        if ("undefined" !== typeof i[s]) n[s] = i[s];
                                        else n[s] = t[s];
                                    return n
                                }
                            }, {
                                key: "offsetRelative",
                                value: function e(t) {
                                    var i = {
                                        left: 0,
                                        top: 0
                                    };
                                    do {
                                        var n = t.offsetTop;
                                        var s = t.offsetLeft;
                                        if (!isNaN(n)) i.top += n;
                                        if (!isNaN(s)) i.left += s;
                                        t = "BODY" === t.tagName ? t.parentElement : t.offsetParent
                                    } while (t);
                                    return i
                                }
                            }, {
                                key: "addClass",
                                value: function e(t, i) {
                                    if (!c.hasClass(t, i))
                                        if (t.classList) t.classList.add(i);
                                        else t.className += " " + i
                                }
                            }, {
                                key: "removeClass",
                                value: function e(t, i) {
                                    if (c.hasClass(t, i))
                                        if (t.classList) t.classList.remove(i);
                                        else t.className = t.className.replace(new RegExp("(^|\\b)" + i.split(" ").join("|") + "(\\b|$)", "gi"), " ")
                                }
                            }, {
                                key: "hasClass",
                                value: function e(t, i) {
                                    if (t.classList) return t.classList.contains(i);
                                    else return new RegExp("(^| )" + i + "( |$)", "gi").test(t.className)
                                }
                            }, {
                                key: "defaults",
                                get: function () {
                                    return n
                                }
                            }]);
                            return c
                        }();
                        return e
                    }();
                e.default = i, window.StickySidebar = i
            }(t)
        })), t(i(function (e, t) {
            var r;
            r = function (e) {
                    return e && e.__esModule ? e : {
                        default: e
                    }
                }(n),
                function () {
                    var n, s, e;
                    "undefined" != typeof window && (s = "stickySidebar", (n = window.$ || window.jQuery || window.Zepto) && (n.fn.stickySidebar = function (i) {
                        return this.each(function () {
                            var e = n(this),
                                t = n(this).data(s);
                            if (t || (t = new r.default(this, "object" == typeof i && i), e.data(s, t)), "string" == typeof i) {
                                if (void 0 === t[i] && -1 === ["destroy", "updateSticky"].indexOf(i)) throw new Error('No method named "' + i + '"');
                                t[i]()
                            }
                        })
                    }, n.fn.stickySidebar.Constructor = r.default, e = n.fn.stickySidebar, n.fn.stickySidebar.noConflict = function () {
                        return n.fn.stickySidebar = e, this
                    }))
                }()
        })))
    }(e = {
        exports: {}
    }), e.exports);
    return (t = i) && t.__esModule && Object.prototype.hasOwnProperty.call(t, "default") ? t.default : t
});
