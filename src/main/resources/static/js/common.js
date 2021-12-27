$.ajaxSetup({
    beforeSend: function () {
        let width = 0;
        let height = 0;
        let left = 0;
        let top = 0;

        width = 50;
        height = 50;


        top = ($(window).height() - height) / 2 + $(window).scrollTop();
        left = ($(window).width() - width) / 2 + $(window).scrollLeft();


        if ($("#div_ajax_load_image").length != 0) {
            $("#div_ajax_load_image").css({
                "top": top + "px",
                "left": left + "px"
            });
            $("#div_ajax_load_image").show();
        } else {
            $('body').append('<div style="background-color: rgba(150, 150, 150, 0.5);">' +
                '<div id="div_ajax_load_image" style="position:absolute; top:' + top + 'px; left:' + left + 'px; width:' + width + 'px; height:' + height + 'px; z-index:9999; background:transparent; filter:alpha(opacity=50); opacity:alpha*0.5; margin:auto; padding:0; ">' +
                '<div class="spinner-border" style="color: #4D2BF4" role="status">\n' +
                '  <span class="sr-only">Loading...</span>\n' +
                '</div>' +
                '</div>' +
                '</div>');
        }

    },
    complete: function () {
        console.log("AJAX Complete");
        $("#div_ajax_load_image").hide();
    }
});

$('.clickable_img').on("click", function () {
    if (confirm('해당 이미지를 보시겠습니까?')) {
        let imageUrl = $(this).attr("src");
        window.open(imageUrl);
    } else {
        return false;
    }
});

function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

function unComma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}

function listenResize() {
    let screenHeight = $(window).height();
    console.log(screenHeight);

    let tableWidth = $(".payus-table").width();
    console.log("table Width : " + tableWidth);
    let pagination = $(".pagination");
    pagination.width(tableWidth);
}

$(document).ready(function () {
    $('.td-comma').each(function () {
        $(this).text(comma($(this).text()));
    });
    $('.td-date').each(function () {
        if ($(this).text() !== '관리자가 확인 중 입니다.')
            $(this).text(SplitDateFunction($(this).text()));
    });
});