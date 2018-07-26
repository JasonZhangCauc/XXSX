 $(function () {
                    app.floorscroll(".loadfloor", 0);
                    app.changeCategory();
                    app.fixedheader();
                    $(".prev,.next").hover(function () {
                        $(this).fadeTo("show", 0.7);
                    }, function () {
                        $(this).fadeTo("show", 0.3);
                    })
                    //首页焦点图
                    $(".banner-slider").hover(function () {
                        $(this).find(".prev,.next").fadeTo("show", 0.3);
                    }, function () {
                        $(this).find(".prev,.next").hide();
                    })
                    $(".banner-slider").slide({
                        titCell: ".b-dot ul", mainCell: ".b-slider", effect: "fold", autoPlay: true, interTime: 4500, autoPage: true,
                        endFun: function (i, c) {
                            $(".b-slider li").removeClass("current").eq(i).addClass("current");
                        }
                    });


                    $(".banner-slider li").click(function () {
                        var vdsjson = {
                            "event_target": this
                            , "page_name": "首页"
                            , "page_number": 1
                            , "page_widget_name": "首页顶部滚动广告栏"
                            , "page_widget_position": $(this).index() + 1
                            , "city": "8"
                            , "promo_type": $(this).attr("_title")
                            , "promo_date_begin": $(this).attr("_beginTime")
                            , "promo_date_end": $(this).attr("_endtime")
                        };
                        _vds.track("ad_click", vdsjson);
                    })

                   
			
                })