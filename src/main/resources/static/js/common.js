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
        $("#div_ajax_load_image").hide();
    }
});