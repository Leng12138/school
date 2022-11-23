var mizhu = new function () {
    this.width = 380;
    this.height = 172;

    $(document).on('click', '.w-btn', function () {
        $('.win iframe').fadeOut();
        $('.win').fadeOut("fast");
        setTimeout(function () {
            $('.win iframe').remove();
            $('.win').remove();
        }, 100);
    })

    function messageBox(html, title, message, type) {
        var alert_jq = $(html);
        if (type == "toast") {
            alert_jq.find(".window-panel").width(message.length * 20).css("margin-left", -message.length * 20 / 2).css("margin-top", -mizhu.height / 2);
        } else {
            alert_jq.find(".window-panel").width(mizhu.width).css("margin-left", -mizhu.width / 2).css("margin-top", -mizhu.height / 2 - 36);
        }
        if (valempty(title)) {
            alert_jq.find(".title").remove();
            alert_jq.find(".window-panel .body-panel").css("border-radius", "4px");
        } else {
            alert_jq.find(".title").find(":header").html(title);
        }
        alert_jq.find(".content").html(message.replace('\r\n', '<br/>'));
        alert_jq.appendTo('body').fadeIn("fast");
        $(".win .w-btn:first").focus();
    }


    this.alert = function (title, message, ico) {
        var alert_icon = "";
        if (!valempty(ico)) {
            alert_icon = '<p class="btns" style="margin-bottom:-15px;"><img width="70px" height="70px" src="images/' + ico + '.png"></p>';
        }
        var html = '<div class="win"><div class="mask-layer"></div><div class="window-panel"><iframe class="title-panel" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe><div class="title"><h3></h3></div><div class="body-panel">' + alert_icon + '<p class="content"></p><p class="btns"><button class="w-btn" tabindex="1">确定</button></p></div></div></div>';
        messageBox(html, title, message);
    }

};


function valempty(str) {
    if (str == "null" || str == null || str == "" || str == "undefined" || str == undefined || str == 0) {
        return true;
    } else {
        return false;
    }
}