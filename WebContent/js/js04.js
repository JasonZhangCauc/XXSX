 var nowDate = new Date();
    var nowTime = nowDate.getFullYear() + "-" + (nowDate.getMonth() + 1) + "-" + nowDate.getDate();
    var endTime = "2017-5-15";
    if (ToDate(nowTime) >= ToDate(endTime)) {
        $('.col1 .ml5').hide();
    }

    function ToDate(str) {
        var arr = str.split("-");
        var newDate = new Date(arr[0], arr[1], arr[2]);
        return newDate;
    }