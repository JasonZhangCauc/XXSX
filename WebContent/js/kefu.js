 window.__zp_tag_params = {
                    pagetype: "shouye",
                };
				
				  //投诉和建议呼起客服
                    $(function () {

                        if ($.cookie('IsComplaint') == "true") {
                            $("a[id^='calltool']").click();
							//状态删除
							$.cookie("IsComplaint", null,{path:"/"}); 
                        }
					});