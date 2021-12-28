var runPaginationCustomCount = function (pagination_id, layout_id, divider_item_name, item_count) {
    var layout = '#' + layout_id;
    $('#' + pagination_id).html('');
    var trnum = 0;
    var maxRows = item_count; //행 제한 횟수
    var viewPage = 3;

    var totalRows = $(layout + ' ' + divider_item_name).length;
    $(layout + ' ' + divider_item_name).each(function () {
        trnum++;
        if (trnum > maxRows) {
            $(this).hide()
        }
        if (trnum <= maxRows) {
            $(this).show()
        }
    });
    var pagenum = 0;
    if (totalRows > maxRows) {
        $('#' + pagination_id).append(`<li class="first page-item">` +
            `                            <a class="page-link" aria-label="First">` +
            `                                <span aria-hidden="true"><i class="fa fa-arrow-circle-o-left"></i></span>` +
            `                            </a>` +
            `                        </li>`);
        $('#' + pagination_id).append(`<li class="prev page-item">` +
            `                            <a class="page-link" aria-label="Previous">` +
            `                                <span aria-hidden="true"><i class="fa fa-long-arrow-left"></i></span>` +
            `                            </a>` +
            `                        </li>`);
        pagenum = Math.ceil(totalRows / maxRows);
        for (var i = 1; i <= pagenum;) {
            $('#' + pagination_id).append(`<li class="page-item" onclick="moveToScroll('${layout_id}')" data-page="` + i + `"><a>` + i++ + `</a></li>`).show();
        }
        $('#' + pagination_id).append(`<li class="next page-item">` +
            `                            <a class="page-link" aria-label="Next">` +
            `                                <span aria-hidden="true"><i class="fa fa-long-arrow-right"></i></span>` +
            `                            </a>` +
            `                        </li>`);
        $('#' + pagination_id).append(`<li class="last page-item">` +
            `                            <a class="page-link" aria-label="Last">` +
            `                                <span aria-hidden="true"><i class="fa fa-arrow-circle-o-right"></i></span>` +
            `                            </a>` +
            `                        </li>`);
    }
    $('#' + pagination_id + ' li:nth-child(3)').addClass('active');
    var next_element = $('#' + pagination_id + ' li.next');
    var prev_element = $('#' + pagination_id + ' li.prev');
    var first_element = $('#' + pagination_id + ' li.first');
    var last_element = $('#' + pagination_id + ' li.last');
    var basePageNum = 1;
    if (basePageNum == pagenum) {
        if (!next_element.hasClass('disabled')) {
            $(next_element).addClass('disabled');
        }
        if (prev_element.hasClass('disabled')) {
            $(prev_element).removeClass('disabled');
        }
        if (!last_element.hasClass('disabled')) {
            $(last_element).addClass('disabled');
        }
        if (first_element.hasClass('disabled')) {
            $(first_element).removeClass('disabled');
        }
    } else if (basePageNum == 1) {
        if (next_element.hasClass('disabled')) {
            $(next_element).removeClass('disabled');
        }
        if (!prev_element.hasClass('disabled')) {
            $(prev_element).addClass('disabled');
        }
        if (last_element.hasClass('disabled')) {
            $(last_element).removeClass('disabled');
        }
        if (!first_element.hasClass('disabled')) {
            $(first_element).addClass('disabled');
        }
    } else {
        if (next_element.hasClass('disabled')) {
            $(next_element).removeClass('disabled');
        }
        if (prev_element.hasClass('disabled')) {
            $(prev_element).removeClass('disabled');
        }
        if (last_element.hasClass('disabled')) {
            $(last_element).removeClass('disabled');
        }
        if (first_element.hasClass('disabled')) {
            $(first_element).removeClass('disabled');
        }
    }
    /*TODO View Page 제어*/
    var base_element = $('#' + pagination_id + ' li:nth-child(' + 3 + ')');
    var element = base_element;
    /*disable*/
    for (var i = 1; i <= pagenum; i++) {
        element.hide();
        element = element.next();
    }
    /*앞으로 3개*/
    element = base_element;
    element.show();
    for (var i = 1; i <= viewPage; i++) {
        if ((basePageNum + i) <= pagenum) {
            element = element.next();
            if (element === null || element === undefined) {
                break;
            }
            element.show();
        }
    }
    /*뒤로 3개*/
    element = base_element;
    for (var i = 1; i <= viewPage; i++) {
        if ((basePageNum - i) >= 1) {
            element = element.prev();
            if (element === null || element === undefined) {
                break;
            }
            element.show();
        }
    }
    /*TODO View Page 제어 끝*/
    $('#' + pagination_id + ' li').on('click', function () {
        if ($(this).hasClass('prev')) {
            var active_element = $('#' + pagination_id + ' li.page-item.active');
            var pageNum = active_element.attr('data-page') * 1 - 1;
            var next_element = $('#' + pagination_id + ' li.next');
            var prev_element = $('#' + pagination_id + ' li.prev');
            var first_element = $('#' + pagination_id + ' li.first');
            var last_element = $('#' + pagination_id + ' li.last');

            if (pageNum >= 1) {
                if (pageNum == pagenum) {
                    if (!next_element.hasClass('disabled')) {
                        $(next_element).addClass('disabled');
                    }
                    if (prev_element.hasClass('disabled')) {
                        $(prev_element).removeClass('disabled');
                    }
                    if (!last_element.hasClass('disabled')) {
                        $(last_element).addClass('disabled');
                    }
                    if (first_element.hasClass('disabled')) {
                        $(first_element).removeClass('disabled');
                    }
                } else if (pageNum == 1) {
                    if (next_element.hasClass('disabled')) {
                        $(next_element).removeClass('disabled');
                    }
                    if (!prev_element.hasClass('disabled')) {
                        $(prev_element).addClass('disabled');
                    }
                    if (last_element.hasClass('disabled')) {
                        $(last_element).removeClass('disabled');
                    }
                    if (!first_element.hasClass('disabled')) {
                        $(first_element).addClass('disabled');
                    }
                } else {
                    if (next_element.hasClass('disabled')) {
                        $(next_element).removeClass('disabled');
                    }
                    if (prev_element.hasClass('disabled')) {
                        $(prev_element).removeClass('disabled');
                    }
                    if (last_element.hasClass('disabled')) {
                        $(last_element).removeClass('disabled');
                    }
                    if (first_element.hasClass('disabled')) {
                        $(first_element).removeClass('disabled');
                    }
                }
                var rowIndex = 0;
                $('#' + pagination_id + ' li').removeClass('active');
                active_element.prev().addClass('active');
                $(layout + ' ' + divider_item_name).each(function () {
                    rowIndex++;
                    if (rowIndex > (maxRows * pageNum) || rowIndex <= ((maxRows * pageNum) - maxRows)) {
                        $(this).hide();
                    } else {
                        $(this).show();
                    }
                });
            } else {
                if (pageNum == pagenum) {
                    if (!next_element.hasClass('disabled')) {
                        $(next_element).addClass('disabled');
                    }
                    if (prev_element.hasClass('disabled')) {
                        $(prev_element).removeClass('disabled');
                    }
                    if (!last_element.hasClass('disabled')) {
                        $(last_element).addClass('disabled');
                    }
                    if (first_element.hasClass('disabled')) {
                        $(first_element).removeClass('disabled');
                    }
                } else if (pageNum == 1) {
                    if (next_element.hasClass('disabled')) {
                        $(next_element).removeClass('disabled');
                    }
                    if (!prev_element.hasClass('disabled')) {
                        $(prev_element).addClass('disabled');
                    }
                    if (last_element.hasClass('disabled')) {
                        $(last_element).removeClass('disabled');
                    }
                    if (!first_element.hasClass('disabled')) {
                        $(first_element).addClass('disabled');
                    }
                } else {
                    if (next_element.hasClass('disabled')) {
                        $(next_element).removeClass('disabled');
                    }
                    if (prev_element.hasClass('disabled')) {
                        $(prev_element).removeClass('disabled');
                    }
                    if (last_element.hasClass('disabled')) {
                        $(last_element).removeClass('disabled');
                    }
                    if (first_element.hasClass('disabled')) {
                        $(first_element).removeClass('disabled');
                    }
                }
            }
            /*TODO View Page 제어*/
            var basePageNum = pageNum + 1;
            var root_element = $('#' + pagination_id + ' li:nth-child(' + 3 + ')');
            var base_element = active_element;
            var element = root_element;
            /*Disable*/
            for (var i = 1; i <= pagenum; i++) {
                element.hide();
                element = element.next();
            }
            /*앞으로 3개*/
            element = base_element;
            element.show();
            for (var i = 1; i <= viewPage; i++) {
                if ((basePageNum + i) <= pagenum) {
                    element = element.next();
                    if (element === null || element === undefined || element.hasClass('next')) {
                        break;
                    }
                    element.show();
                }
            }
            /*뒤로 3개*/
            element = base_element;
            for (var i = 1; i <= viewPage; i++) {
                if ((basePageNum - i) >= 1) {
                    element = element.prev();
                    if (element === null || element === undefined || element.hasClass('prev')) {
                        break;
                    }
                    element.show();
                }
            }
            /*TODO View Page 제어*/
        } else if ($(this).hasClass('first')) {
            var pageNum = 1;
            var next_element = $('#' + pagination_id + ' li.next');
            var prev_element = $('#' + pagination_id + ' li.prev');
            var first_element = $('#' + pagination_id + ' li.first');
            var last_element = $('#' + pagination_id + ' li.last');
            if (pageNum >= 1) {
                if (pageNum == pagenum) {
                    if (!next_element.hasClass('disabled')) {
                        $(next_element).addClass('disabled');
                    }
                    if (prev_element.hasClass('disabled')) {
                        $(prev_element).removeClass('disabled');
                    }
                    if (!last_element.hasClass('disabled')) {
                        $(last_element).addClass('disabled');
                    }
                    if (first_element.hasClass('disabled')) {
                        $(first_element).removeClass('disabled');
                    }
                } else if (pageNum == 1) {
                    if (next_element.hasClass('disabled')) {
                        $(next_element).removeClass('disabled');
                    }
                    if (!prev_element.hasClass('disabled')) {
                        $(prev_element).addClass('disabled');
                    }
                    if (last_element.hasClass('disabled')) {
                        $(last_element).removeClass('disabled');
                    }
                    if (!first_element.hasClass('disabled')) {
                        $(first_element).addClass('disabled');
                    }
                } else {
                    if (next_element.hasClass('disabled')) {
                        $(next_element).removeClass('disabled');
                    }
                    if (prev_element.hasClass('disabled')) {
                        $(prev_element).removeClass('disabled');
                    }
                    if (last_element.hasClass('disabled')) {
                        $(last_element).removeClass('disabled');
                    }
                    if (first_element.hasClass('disabled')) {
                        $(first_element).removeClass('disabled');
                    }
                }
                var rowIndex = 0;
                $('#' + pagination_id + ' li').removeClass('active');
                $('#' + pagination_id + ' li:nth-child(3)').addClass('active');
                $(layout + ' ' + divider_item_name).each(function () {
                    rowIndex++;
                    if (rowIndex > (maxRows * pageNum) || rowIndex <= ((maxRows * pageNum) - maxRows)) {
                        $(this).hide();
                    } else {
                        $(this).show();
                    }
                });
            } else {
                if (pageNum == pagenum) {
                    if (!next_element.hasClass('disabled')) {
                        $(next_element).addClass('disabled');
                    }
                    if (prev_element.hasClass('disabled')) {
                        $(prev_element).removeClass('disabled');
                    }
                    if (!last_element.hasClass('disabled')) {
                        $(last_element).addClass('disabled');
                    }
                    if (first_element.hasClass('disabled')) {
                        $(first_element).removeClass('disabled');
                    }
                } else if (pageNum == 1) {
                    if (next_element.hasClass('disabled')) {
                        $(next_element).removeClass('disabled');
                    }
                    if (!prev_element.hasClass('disabled')) {
                        $(prev_element).addClass('disabled');
                    }
                    if (last_element.hasClass('disabled')) {
                        $(last_element).removeClass('disabled');
                    }
                    if (!first_element.hasClass('disabled')) {
                        $(first_element).addClass('disabled');
                    }
                } else {
                    if (next_element.hasClass('disabled')) {
                        $(next_element).removeClass('disabled');
                    }
                    if (prev_element.hasClass('disabled')) {
                        $(prev_element).removeClass('disabled');
                    }
                    if (last_element.hasClass('disabled')) {
                        $(last_element).removeClass('disabled');
                    }
                    if (first_element.hasClass('disabled')) {
                        $(first_element).removeClass('disabled');
                    }
                }
            }
            /*TODO View Page 제어*/
            var basePageNum = pageNum;
            var root_element = $('#' + pagination_id + ' li:nth-child(' + 3 + ')');
            var base_element = $('#' + pagination_id + ' li:nth-child(' + 3 + ')');
            var element = root_element;
            /*Disable*/
            for (var i = 1; i <= pagenum; i++) {
                element.hide();
                element = element.next();
            }
            /*앞으로 3개*/
            console.log(base_element);
            element = base_element;
            element.show();
            for (var i = 1; i <= viewPage; i++) {
                console.log(basePageNum + i);
                console.log(pagenum);
                if ((basePageNum + i) <= pagenum) {
                    element = element.next();
                    if (element === null || element === undefined || element.hasClass('next')) {
                        break;
                    }
                    element.show();
                }
            }
            /*뒤로 3개*/
            element = base_element;
            for (var i = 1; i <= viewPage; i++) {
                if ((basePageNum - i) >= 1) {
                    element = element.prev();
                    if (element === null || element === undefined || element.hasClass('prev')) {
                        break;
                    }
                    element.show();
                }
            }
            /*TODO View Page 제어*/
        } else if ($(this).hasClass('next')) {
            var active_element = $('#' + pagination_id + ' li.page-item.active');
            var pageNum = active_element.attr('data-page') * 1 + 1;
            var next_element = $('#' + pagination_id + ' li.next');
            var prev_element = $('#' + pagination_id + ' li.prev');
            var first_element = $('#' + pagination_id + ' li.first');
            var last_element = $('#' + pagination_id + ' li.last');

            if (pageNum <= pagenum) {
                if (pageNum == pagenum) {
                    if (!next_element.hasClass('disabled')) {
                        $(next_element).addClass('disabled');
                    }
                    if (prev_element.hasClass('disabled')) {
                        $(prev_element).removeClass('disabled');
                    }
                    if (!last_element.hasClass('disabled')) {
                        $(last_element).addClass('disabled');
                    }
                    if (first_element.hasClass('disabled')) {
                        $(first_element).removeClass('disabled');
                    }
                } else if (pageNum == 1) {
                    if (next_element.hasClass('disabled')) {
                        $(next_element).removeClass('disabled');
                    }
                    if (!prev_element.hasClass('disabled')) {
                        $(prev_element).addClass('disabled');
                    }
                    if (last_element.hasClass('disabled')) {
                        $(last_element).removeClass('disabled');
                    }
                    if (!first_element.hasClass('disabled')) {
                        $(first_element).addClass('disabled');
                    }
                } else {
                    if (next_element.hasClass('disabled')) {
                        $(next_element).removeClass('disabled');
                    }
                    if (prev_element.hasClass('disabled')) {
                        $(prev_element).removeClass('disabled');
                    }
                    if (last_element.hasClass('disabled')) {
                        $(last_element).removeClass('disabled');
                    }
                    if (first_element.hasClass('disabled')) {
                        $(first_element).removeClass('disabled');
                    }
                }
                var rowIndex = 0;
                $('#' + pagination_id + ' li').removeClass('active');
                active_element.next().addClass('active');
                $(layout + ' ' + divider_item_name).each(function () {
                    rowIndex++;
                    /* 2->3페이지 넘어 갈때
                    * 1 > 3 * 2(6) || 1 <= 3 hide
                    * 2 > 3 * 2(6) || 2 <= 3 hide
                    * 3 > 3 * 2(6) || 3 <= 3 hide
                    * 4 > 3 * 2(6) || 4 <= 3 hide
                    * 5 > 6 || 5 <= 3 hide
                    * 6 > 6 || 6 <= 6 hide
                    * 7 > 6 || 7 <= 6 true
                    * 8 > 6 || 8 <= 6 true
                    * 9 > 6 || 9 <= 6 true
                    * 10 > 6 || 10 <= 6 true ??
                    * */
                    if (rowIndex > (maxRows * pageNum) || rowIndex <= ((maxRows * pageNum) - maxRows)) {
                        $(this).hide();
                    } else {
                        $(this).show();
                    }
                });
                /*TODO View Page 제어*/
                var basePageNum = pageNum;
                var root_element = $('#' + pagination_id + ' li:nth-child(' + 3 + ')');
                var base_element = active_element.next();
                var element = root_element;
                /*Disable*/
                for (var i = 1; i <= pagenum; i++) {
                    element.hide();
                    element = element.next();
                }
                /*앞으로 3개*/
                console.log(base_element);
                element = base_element;
                element.show();
                for (var i = 1; i <= viewPage; i++) {
                    console.log(basePageNum + i);
                    console.log(pagenum);
                    if ((basePageNum + i) <= pagenum) {
                        element = element.next();
                        if (element === null || element === undefined || element.hasClass('next')) {
                            break;
                        }
                        element.show();
                    }
                }
                /*뒤로 3개*/
                element = base_element;
                for (var i = 1; i <= viewPage; i++) {
                    if ((basePageNum - i) >= 1) {
                        element = element.prev();
                        if (element === null || element === undefined || element.hasClass('prev')) {
                            break;
                        }
                        element.show();
                    }
                }
                /*TODO View Page 제어*/
            } else {
                if (pageNum == pagenum) {
                    if (!next_element.hasClass('disabled')) {
                        $(next_element).addClass('disabled');
                    }
                    if (prev_element.hasClass('disabled')) {
                        $(prev_element).removeClass('disabled');
                    }
                    if (!last_element.hasClass('disabled')) {
                        $(last_element).addClass('disabled');
                    }
                    if (first_element.hasClass('disabled')) {
                        $(first_element).removeClass('disabled');
                    }
                } else if (pageNum == 1) {
                    if (next_element.hasClass('disabled')) {
                        $(next_element).removeClass('disabled');
                    }
                    if (!prev_element.hasClass('disabled')) {
                        $(prev_element).addClass('disabled');
                    }
                    if (last_element.hasClass('disabled')) {
                        $(last_element).removeClass('disabled');
                    }
                    if (!first_element.hasClass('disabled')) {
                        $(first_element).addClass('disabled');
                    }
                } else {
                    if (next_element.hasClass('disabled')) {
                        $(next_element).removeClass('disabled');
                    }
                    if (prev_element.hasClass('disabled')) {
                        $(prev_element).removeClass('disabled');
                    }
                    if (last_element.hasClass('disabled')) {
                        $(last_element).removeClass('disabled');
                    }
                    if (first_element.hasClass('disabled')) {
                        $(first_element).removeClass('disabled');
                    }
                }
            }
        } else if ($(this).hasClass('last')) {
            var pageNum = pagenum;
            var next_element = $('#' + pagination_id + ' li.next');
            var prev_element = $('#' + pagination_id + ' li.prev');
            var first_element = $('#' + pagination_id + ' li.first');
            var last_element = $('#' + pagination_id + ' li.last');

            if (pageNum <= pagenum) {
                if (pageNum == pagenum) {
                    if (!next_element.hasClass('disabled')) {
                        $(next_element).addClass('disabled');
                    }
                    if (prev_element.hasClass('disabled')) {
                        $(prev_element).removeClass('disabled');
                    }
                    if (!last_element.hasClass('disabled')) {
                        $(last_element).addClass('disabled');
                    }
                    if (first_element.hasClass('disabled')) {
                        $(first_element).removeClass('disabled');
                    }
                } else if (pageNum == 1) {
                    if (next_element.hasClass('disabled')) {
                        $(next_element).removeClass('disabled');
                    }
                    if (!prev_element.hasClass('disabled')) {
                        $(prev_element).addClass('disabled');
                    }
                    if (last_element.hasClass('disabled')) {
                        $(last_element).removeClass('disabled');
                    }
                    if (!first_element.hasClass('disabled')) {
                        $(first_element).addClass('disabled');
                    }
                } else {
                    if (next_element.hasClass('disabled')) {
                        $(next_element).removeClass('disabled');
                    }
                    if (prev_element.hasClass('disabled')) {
                        $(prev_element).removeClass('disabled');
                    }
                    if (last_element.hasClass('disabled')) {
                        $(last_element).removeClass('disabled');
                    }
                    if (first_element.hasClass('disabled')) {
                        $(first_element).removeClass('disabled');
                    }
                }
                var rowIndex = 0;
                $('#' + pagination_id + ' li').removeClass('active');
                $('#' + pagination_id + ' li:nth-last-child(3)').addClass('active');
                $(layout + ' ' + divider_item_name).each(function () {
                    rowIndex++;
                    /* 2->3페이지 넘어 갈때
                    * 1 > 3 * 2(6) || 1 <= 3 hide
                    * 2 > 3 * 2(6) || 2 <= 3 hide
                    * 3 > 3 * 2(6) || 3 <= 3 hide
                    * 4 > 3 * 2(6) || 4 <= 3 hide
                    * 5 > 6 || 5 <= 3 hide
                    * 6 > 6 || 6 <= 6 hide
                    * 7 > 6 || 7 <= 6 true
                    * 8 > 6 || 8 <= 6 true
                    * 9 > 6 || 9 <= 6 true
                    * 10 > 6 || 10 <= 6 true ??
                    * */
                    if (rowIndex > (maxRows * pageNum) || rowIndex <= ((maxRows * pageNum) - maxRows)) {
                        $(this).hide();
                    } else {
                        $(this).show();
                    }
                });
                /*TODO View Page 제어*/
                var basePageNum = pageNum;
                var root_element = $('#' + pagination_id + ' li:nth-child(' + 3 + ')');
                var base_element = $('#' + pagination_id + ' li:nth-last-child(' + 3 + ')');
                var element = root_element;
                /*Disable*/
                for (var i = 1; i <= pagenum; i++) {
                    element.hide();
                    element = element.next();
                }
                /*앞으로 3개*/
                console.log(base_element);
                element = base_element;
                element.show();
                for (var i = 1; i <= viewPage; i++) {
                    console.log(basePageNum + i);
                    console.log(pagenum);
                    if ((basePageNum + i) <= pagenum) {
                        element = element.next();
                        if (element === null || element === undefined || element.hasClass('next')) {
                            break;
                        }
                        element.show();
                    }
                }
                /*뒤로 3개*/
                element = base_element;
                for (var i = 1; i <= viewPage; i++) {
                    if ((basePageNum - i) >= 1) {
                        element = element.prev();
                        if (element === null || element === undefined || element.hasClass('prev')) {
                            break;
                        }
                        element.show();
                    }
                }
                /*TODO View Page 제어*/
            } else {
                if (pageNum == pagenum) {
                    if (!next_element.hasClass('disabled')) {
                        $(next_element).addClass('disabled');
                    }
                    if (prev_element.hasClass('disabled')) {
                        $(prev_element).removeClass('disabled');
                    }
                    if (!last_element.hasClass('disabled')) {
                        $(last_element).addClass('disabled');
                    }
                    if (first_element.hasClass('disabled')) {
                        $(first_element).removeClass('disabled');
                    }
                } else if (pageNum == 1) {
                    if (next_element.hasClass('disabled')) {
                        $(next_element).removeClass('disabled');
                    }
                    if (!prev_element.hasClass('disabled')) {
                        $(prev_element).addClass('disabled');
                    }
                    if (last_element.hasClass('disabled')) {
                        $(last_element).removeClass('disabled');
                    }
                    if (!first_element.hasClass('disabled')) {
                        $(first_element).addClass('disabled');
                    }
                } else {
                    if (next_element.hasClass('disabled')) {
                        $(next_element).removeClass('disabled');
                    }
                    if (prev_element.hasClass('disabled')) {
                        $(prev_element).removeClass('disabled');
                    }
                    if (last_element.hasClass('disabled')) {
                        $(last_element).removeClass('disabled');
                    }
                    if (first_element.hasClass('disabled')) {
                        $(first_element).removeClass('disabled');
                    }
                }
            }
        } else {
            /*TODO View Page 제어*/
            var basePageNum = $(this).attr('data-page') * 1;
            var root_element = $('#' + pagination_id + ' li:nth-child(' + 3 + ')');
            var base_element = $(this);
            var element = root_element;
            /*Disable*/
            for (var i = 1; i <= pagenum; i++) {
                element.hide();
                element = element.next();
            }
            /*앞으로 3개*/
            element = base_element;
            element.show();
            for (var i = 1; i <= viewPage; i++) {
                if ((basePageNum + i) <= pagenum) {
                    element = element.next();
                    if (element === null || element === undefined || element.hasClass('next')) {
                        break;
                    }
                    element.show();
                }
            }
            /*뒤로 3개*/
            element = base_element;
            for (var i = 1; i <= viewPage; i++) {
                if ((basePageNum - i) >= 1) {
                    element = element.prev();
                    if (element === null || element === undefined || element.hasClass('prev')) {
                        break;
                    }
                    element.show();
                }
            }
            /*TODO View Page 제어*/

            var pageNum = $(this).attr('data-page');
            var rowIndex = 0;
            var next_element = $('#' + pagination_id + ' li.next');
            var prev_element = $('#' + pagination_id + ' li.prev');
            var first_element = $('#' + pagination_id + ' li.first');
            var last_element = $('#' + pagination_id + ' li.last');
            if (pageNum == pagenum) {
                if (!next_element.hasClass('disabled')) {
                    $(next_element).addClass('disabled');
                }
                if (prev_element.hasClass('disabled')) {
                    $(prev_element).removeClass('disabled');
                }
                if (!last_element.hasClass('disabled')) {
                    $(last_element).addClass('disabled');
                }
                if (first_element.hasClass('disabled')) {
                    $(first_element).removeClass('disabled');
                }
            } else if (pageNum == 1) {
                if (next_element.hasClass('disabled')) {
                    $(next_element).removeClass('disabled');
                }
                if (!prev_element.hasClass('disabled')) {
                    $(prev_element).addClass('disabled');
                }
                if (last_element.hasClass('disabled')) {
                    $(last_element).removeClass('disabled');
                }
                if (!first_element.hasClass('disabled')) {
                    $(first_element).addClass('disabled');
                }
            } else {
                if (next_element.hasClass('disabled')) {
                    $(next_element).removeClass('disabled');
                }
                if (prev_element.hasClass('disabled')) {
                    $(prev_element).removeClass('disabled');
                }
                if (last_element.hasClass('disabled')) {
                    $(last_element).removeClass('disabled');
                }
                if (first_element.hasClass('disabled')) {
                    $(first_element).removeClass('disabled');
                }
            }
            $('#' + pagination_id + ' li').removeClass('active');
            $(this).addClass('active');
            $(layout + ' ' + divider_item_name).each(function () {
                rowIndex++;
                if (rowIndex > (maxRows * pageNum) || rowIndex <= ((maxRows * pageNum) - maxRows)) {
                    $(this).hide();
                } else {
                    $(this).show();
                }
            });
        }
    });
};
var runPagination = function (pagination_id, layout_id, divider_item_name) {
    var layout = '#' + layout_id;
    $('#' + pagination_id).html('');
    var trnum = 0;
    var maxRows = 10; //행 제한 횟수
    var viewPage = 3;

    var totalRows = $(layout + ' ' + divider_item_name).length;
    $(layout + ' ' + divider_item_name).each(function () {
        trnum++;
        if (trnum > maxRows) {
            $(this).hide()
        }
        if (trnum <= maxRows) {
            $(this).show()
        }
    });
    var pagenum = 0;
    if (totalRows > maxRows) {
        $('#' + pagination_id).append('<li class="first page-item">' +
            '                            <a class="page-link" aria-label="First">' +
            '                                <span aria-hidden="true"><i class="fa fa-arrow-circle-o-left"></i></span>' +
            '                            </a>' +
            '                        </li>');
        $('#' + pagination_id).append('<li class="prev page-item">' +
            '                            <a class="page-link" aria-label="Previous">' +
            '                                <span aria-hidden="true"><i class="fa fa-long-arrow-left"></i></span>' +
            '                            </a>' +
            '                        </li>');
        pagenum = Math.ceil(totalRows / maxRows);
        for (var i = 1; i <= pagenum;) {
            $('#' + pagination_id).append('<li class="page-item" data-page="' + i + '"><a>' + i++ + '</a></li>').show();
        }
        $('#' + pagination_id).append('<li class="next page-item">' +
            '                            <a class="page-link" aria-label="Next">' +
            '                                <span aria-hidden="true"><i class="fa fa-long-arrow-right"></i></span>' +
            '                            </a>' +
            '                        </li>');
        $('#' + pagination_id).append('<li class="last page-item">' +
            '                            <a class="page-link" aria-label="Last">' +
            '                                <span aria-hidden="true"><i class="fa fa-arrow-circle-o-right"></i></span>' +
            '                            </a>' +
            '                        </li>');
    }
    $('#' + pagination_id + ' li:nth-child(3)').addClass('active');
    var next_element = $('#' + pagination_id + ' li.next');
    var prev_element = $('#' + pagination_id + ' li.prev');
    var first_element = $('#' + pagination_id + ' li.first');
    var last_element = $('#' + pagination_id + ' li.last');
    var basePageNum = 1;
    if (basePageNum == pagenum) {
        if (!next_element.hasClass('disabled')) {
            $(next_element).addClass('disabled');
        }
        if (prev_element.hasClass('disabled')) {
            $(prev_element).removeClass('disabled');
        }
        if (!last_element.hasClass('disabled')) {
            $(last_element).addClass('disabled');
        }
        if (first_element.hasClass('disabled')) {
            $(first_element).removeClass('disabled');
        }
    } else if (basePageNum == 1) {
        if (next_element.hasClass('disabled')) {
            $(next_element).removeClass('disabled');
        }
        if (!prev_element.hasClass('disabled')) {
            $(prev_element).addClass('disabled');
        }
        if (last_element.hasClass('disabled')) {
            $(last_element).removeClass('disabled');
        }
        if (!first_element.hasClass('disabled')) {
            $(first_element).addClass('disabled');
        }
    } else {
        if (next_element.hasClass('disabled')) {
            $(next_element).removeClass('disabled');
        }
        if (prev_element.hasClass('disabled')) {
            $(prev_element).removeClass('disabled');
        }
        if (last_element.hasClass('disabled')) {
            $(last_element).removeClass('disabled');
        }
        if (first_element.hasClass('disabled')) {
            $(first_element).removeClass('disabled');
        }
    }
    /*TODO View Page 제어*/
    var base_element = $('#' + pagination_id + ' li:nth-child(' + 3 + ')');
    var element = base_element;
    /*disable*/
    for (var i = 1; i <= pagenum; i++) {
        element.hide();
        element = element.next();
    }
    /*앞으로 3개*/
    element = base_element;
    element.show();
    for (var i = 1; i <= viewPage; i++) {
        if ((basePageNum + i) <= pagenum) {
            element = element.next();
            if (element === null || element === undefined) {
                break;
            }
            element.show();
        }
    }
    /*뒤로 3개*/
    element = base_element;
    for (var i = 1; i <= viewPage; i++) {
        if ((basePageNum - i) >= 1) {
            element = element.prev();
            if (element === null || element === undefined) {
                break;
            }
            element.show();
        }
    }
    /*TODO View Page 제어 끝*/
    $('#' + pagination_id + ' li').on('click', function () {
        if ($(this).hasClass('prev')) {
            var active_element = $('#' + pagination_id + ' li.page-item.active');
            var pageNum = active_element.attr('data-page') * 1 - 1;
            var next_element = $('#' + pagination_id + ' li.next');
            var prev_element = $('#' + pagination_id + ' li.prev');
            var first_element = $('#' + pagination_id + ' li.first');
            var last_element = $('#' + pagination_id + ' li.last');

            if (pageNum >= 1) {
                if (pageNum == pagenum) {
                    if (!next_element.hasClass('disabled')) {
                        $(next_element).addClass('disabled');
                    }
                    if (prev_element.hasClass('disabled')) {
                        $(prev_element).removeClass('disabled');
                    }
                    if (!last_element.hasClass('disabled')) {
                        $(last_element).addClass('disabled');
                    }
                    if (first_element.hasClass('disabled')) {
                        $(first_element).removeClass('disabled');
                    }
                } else if (pageNum == 1) {
                    if (next_element.hasClass('disabled')) {
                        $(next_element).removeClass('disabled');
                    }
                    if (!prev_element.hasClass('disabled')) {
                        $(prev_element).addClass('disabled');
                    }
                    if (last_element.hasClass('disabled')) {
                        $(last_element).removeClass('disabled');
                    }
                    if (!first_element.hasClass('disabled')) {
                        $(first_element).addClass('disabled');
                    }
                } else {
                    if (next_element.hasClass('disabled')) {
                        $(next_element).removeClass('disabled');
                    }
                    if (prev_element.hasClass('disabled')) {
                        $(prev_element).removeClass('disabled');
                    }
                    if (last_element.hasClass('disabled')) {
                        $(last_element).removeClass('disabled');
                    }
                    if (first_element.hasClass('disabled')) {
                        $(first_element).removeClass('disabled');
                    }
                }
                var rowIndex = 0;
                $('#' + pagination_id + ' li').removeClass('active');
                active_element.prev().addClass('active');
                $(layout + ' ' + divider_item_name).each(function () {
                    rowIndex++;
                    if (rowIndex > (maxRows * pageNum) || rowIndex <= ((maxRows * pageNum) - maxRows)) {
                        $(this).hide();
                    } else {
                        $(this).show();
                    }
                });
            } else {
                if (pageNum == pagenum) {
                    if (!next_element.hasClass('disabled')) {
                        $(next_element).addClass('disabled');
                    }
                    if (prev_element.hasClass('disabled')) {
                        $(prev_element).removeClass('disabled');
                    }
                    if (!last_element.hasClass('disabled')) {
                        $(last_element).addClass('disabled');
                    }
                    if (first_element.hasClass('disabled')) {
                        $(first_element).removeClass('disabled');
                    }
                } else if (pageNum == 1) {
                    if (next_element.hasClass('disabled')) {
                        $(next_element).removeClass('disabled');
                    }
                    if (!prev_element.hasClass('disabled')) {
                        $(prev_element).addClass('disabled');
                    }
                    if (last_element.hasClass('disabled')) {
                        $(last_element).removeClass('disabled');
                    }
                    if (!first_element.hasClass('disabled')) {
                        $(first_element).addClass('disabled');
                    }
                } else {
                    if (next_element.hasClass('disabled')) {
                        $(next_element).removeClass('disabled');
                    }
                    if (prev_element.hasClass('disabled')) {
                        $(prev_element).removeClass('disabled');
                    }
                    if (last_element.hasClass('disabled')) {
                        $(last_element).removeClass('disabled');
                    }
                    if (first_element.hasClass('disabled')) {
                        $(first_element).removeClass('disabled');
                    }
                }
            }
            /*TODO View Page 제어*/
            var basePageNum = pageNum + 1;
            var root_element = $('#' + pagination_id + ' li:nth-child(' + 3 + ')');
            var base_element = active_element;
            var element = root_element;
            /*Disable*/
            for (var i = 1; i <= pagenum; i++) {
                element.hide();
                element = element.next();
            }
            /*앞으로 3개*/
            element = base_element;
            element.show();
            for (var i = 1; i <= viewPage; i++) {
                if ((basePageNum + i) <= pagenum) {
                    element = element.next();
                    if (element === null || element === undefined || element.hasClass('next')) {
                        break;
                    }
                    element.show();
                }
            }
            /*뒤로 3개*/
            element = base_element;
            for (var i = 1; i <= viewPage; i++) {
                if ((basePageNum - i) >= 1) {
                    element = element.prev();
                    if (element === null || element === undefined || element.hasClass('prev')) {
                        break;
                    }
                    element.show();
                }
            }
            /*TODO View Page 제어*/
        } else if ($(this).hasClass('first')) {
            var pageNum = 1;
            var next_element = $('#' + pagination_id + ' li.next');
            var prev_element = $('#' + pagination_id + ' li.prev');
            var first_element = $('#' + pagination_id + ' li.first');
            var last_element = $('#' + pagination_id + ' li.last');
            if (pageNum >= 1) {
                if (pageNum == pagenum) {
                    if (!next_element.hasClass('disabled')) {
                        $(next_element).addClass('disabled');
                    }
                    if (prev_element.hasClass('disabled')) {
                        $(prev_element).removeClass('disabled');
                    }
                    if (!last_element.hasClass('disabled')) {
                        $(last_element).addClass('disabled');
                    }
                    if (first_element.hasClass('disabled')) {
                        $(first_element).removeClass('disabled');
                    }
                } else if (pageNum == 1) {
                    if (next_element.hasClass('disabled')) {
                        $(next_element).removeClass('disabled');
                    }
                    if (!prev_element.hasClass('disabled')) {
                        $(prev_element).addClass('disabled');
                    }
                    if (last_element.hasClass('disabled')) {
                        $(last_element).removeClass('disabled');
                    }
                    if (!first_element.hasClass('disabled')) {
                        $(first_element).addClass('disabled');
                    }
                } else {
                    if (next_element.hasClass('disabled')) {
                        $(next_element).removeClass('disabled');
                    }
                    if (prev_element.hasClass('disabled')) {
                        $(prev_element).removeClass('disabled');
                    }
                    if (last_element.hasClass('disabled')) {
                        $(last_element).removeClass('disabled');
                    }
                    if (first_element.hasClass('disabled')) {
                        $(first_element).removeClass('disabled');
                    }
                }
                var rowIndex = 0;
                $('#' + pagination_id + ' li').removeClass('active');
                $('#' + pagination_id + ' li:nth-child(3)').addClass('active');
                $(layout + ' ' + divider_item_name).each(function () {
                    rowIndex++;
                    if (rowIndex > (maxRows * pageNum) || rowIndex <= ((maxRows * pageNum) - maxRows)) {
                        $(this).hide();
                    } else {
                        $(this).show();
                    }
                });
            } else {
                if (pageNum == pagenum) {
                    if (!next_element.hasClass('disabled')) {
                        $(next_element).addClass('disabled');
                    }
                    if (prev_element.hasClass('disabled')) {
                        $(prev_element).removeClass('disabled');
                    }
                    if (!last_element.hasClass('disabled')) {
                        $(last_element).addClass('disabled');
                    }
                    if (first_element.hasClass('disabled')) {
                        $(first_element).removeClass('disabled');
                    }
                } else if (pageNum == 1) {
                    if (next_element.hasClass('disabled')) {
                        $(next_element).removeClass('disabled');
                    }
                    if (!prev_element.hasClass('disabled')) {
                        $(prev_element).addClass('disabled');
                    }
                    if (last_element.hasClass('disabled')) {
                        $(last_element).removeClass('disabled');
                    }
                    if (!first_element.hasClass('disabled')) {
                        $(first_element).addClass('disabled');
                    }
                } else {
                    if (next_element.hasClass('disabled')) {
                        $(next_element).removeClass('disabled');
                    }
                    if (prev_element.hasClass('disabled')) {
                        $(prev_element).removeClass('disabled');
                    }
                    if (last_element.hasClass('disabled')) {
                        $(last_element).removeClass('disabled');
                    }
                    if (first_element.hasClass('disabled')) {
                        $(first_element).removeClass('disabled');
                    }
                }
            }
            /*TODO View Page 제어*/
            var basePageNum = pageNum;
            var root_element = $('#' + pagination_id + ' li:nth-child(' + 3 + ')');
            var base_element = $('#' + pagination_id + ' li:nth-child(' + 3 + ')');
            var element = root_element;
            /*Disable*/
            for (var i = 1; i <= pagenum; i++) {
                element.hide();
                element = element.next();
            }
            /*앞으로 3개*/
            console.log(base_element);
            element = base_element;
            element.show();
            for (var i = 1; i <= viewPage; i++) {
                console.log(basePageNum + i);
                console.log(pagenum);
                if ((basePageNum + i) <= pagenum) {
                    element = element.next();
                    if (element === null || element === undefined || element.hasClass('next')) {
                        break;
                    }
                    element.show();
                }
            }
            /*뒤로 3개*/
            element = base_element;
            for (var i = 1; i <= viewPage; i++) {
                if ((basePageNum - i) >= 1) {
                    element = element.prev();
                    if (element === null || element === undefined || element.hasClass('prev')) {
                        break;
                    }
                    element.show();
                }
            }
            /*TODO View Page 제어*/
        } else if ($(this).hasClass('next')) {
            var active_element = $('#' + pagination_id + ' li.page-item.active');
            var pageNum = active_element.attr('data-page') * 1 + 1;
            var next_element = $('#' + pagination_id + ' li.next');
            var prev_element = $('#' + pagination_id + ' li.prev');
            var first_element = $('#' + pagination_id + ' li.first');
            var last_element = $('#' + pagination_id + ' li.last');

            if (pageNum <= pagenum) {
                if (pageNum == pagenum) {
                    if (!next_element.hasClass('disabled')) {
                        $(next_element).addClass('disabled');
                    }
                    if (prev_element.hasClass('disabled')) {
                        $(prev_element).removeClass('disabled');
                    }
                    if (!last_element.hasClass('disabled')) {
                        $(last_element).addClass('disabled');
                    }
                    if (first_element.hasClass('disabled')) {
                        $(first_element).removeClass('disabled');
                    }
                } else if (pageNum == 1) {
                    if (next_element.hasClass('disabled')) {
                        $(next_element).removeClass('disabled');
                    }
                    if (!prev_element.hasClass('disabled')) {
                        $(prev_element).addClass('disabled');
                    }
                    if (last_element.hasClass('disabled')) {
                        $(last_element).removeClass('disabled');
                    }
                    if (!first_element.hasClass('disabled')) {
                        $(first_element).addClass('disabled');
                    }
                } else {
                    if (next_element.hasClass('disabled')) {
                        $(next_element).removeClass('disabled');
                    }
                    if (prev_element.hasClass('disabled')) {
                        $(prev_element).removeClass('disabled');
                    }
                    if (last_element.hasClass('disabled')) {
                        $(last_element).removeClass('disabled');
                    }
                    if (first_element.hasClass('disabled')) {
                        $(first_element).removeClass('disabled');
                    }
                }
                var rowIndex = 0;
                $('#' + pagination_id + ' li').removeClass('active');
                active_element.next().addClass('active');
                $(layout + ' ' + divider_item_name).each(function () {
                    rowIndex++;
                    /* 2->3페이지 넘어 갈때
                    * 1 > 3 * 2(6) || 1 <= 3 hide
                    * 2 > 3 * 2(6) || 2 <= 3 hide
                    * 3 > 3 * 2(6) || 3 <= 3 hide
                    * 4 > 3 * 2(6) || 4 <= 3 hide
                    * 5 > 6 || 5 <= 3 hide
                    * 6 > 6 || 6 <= 6 hide
                    * 7 > 6 || 7 <= 6 true
                    * 8 > 6 || 8 <= 6 true
                    * 9 > 6 || 9 <= 6 true
                    * 10 > 6 || 10 <= 6 true ??
                    * */
                    if (rowIndex > (maxRows * pageNum) || rowIndex <= ((maxRows * pageNum) - maxRows)) {
                        $(this).hide();
                    } else {
                        $(this).show();
                    }
                });
                /*TODO View Page 제어*/
                var basePageNum = pageNum;
                var root_element = $('#' + pagination_id + ' li:nth-child(' + 3 + ')');
                var base_element = active_element.next();
                var element = root_element;
                /*Disable*/
                for (var i = 1; i <= pagenum; i++) {
                    element.hide();
                    element = element.next();
                }
                /*앞으로 3개*/
                console.log(base_element);
                element = base_element;
                element.show();
                for (var i = 1; i <= viewPage; i++) {
                    console.log(basePageNum + i);
                    console.log(pagenum);
                    if ((basePageNum + i) <= pagenum) {
                        element = element.next();
                        if (element === null || element === undefined || element.hasClass('next')) {
                            break;
                        }
                        element.show();
                    }
                }
                /*뒤로 3개*/
                element = base_element;
                for (var i = 1; i <= viewPage; i++) {
                    if ((basePageNum - i) >= 1) {
                        element = element.prev();
                        if (element === null || element === undefined || element.hasClass('prev')) {
                            break;
                        }
                        element.show();
                    }
                }
                /*TODO View Page 제어*/
            } else {
                if (pageNum == pagenum) {
                    if (!next_element.hasClass('disabled')) {
                        $(next_element).addClass('disabled');
                    }
                    if (prev_element.hasClass('disabled')) {
                        $(prev_element).removeClass('disabled');
                    }
                    if (!last_element.hasClass('disabled')) {
                        $(last_element).addClass('disabled');
                    }
                    if (first_element.hasClass('disabled')) {
                        $(first_element).removeClass('disabled');
                    }
                } else if (pageNum == 1) {
                    if (next_element.hasClass('disabled')) {
                        $(next_element).removeClass('disabled');
                    }
                    if (!prev_element.hasClass('disabled')) {
                        $(prev_element).addClass('disabled');
                    }
                    if (last_element.hasClass('disabled')) {
                        $(last_element).removeClass('disabled');
                    }
                    if (!first_element.hasClass('disabled')) {
                        $(first_element).addClass('disabled');
                    }
                } else {
                    if (next_element.hasClass('disabled')) {
                        $(next_element).removeClass('disabled');
                    }
                    if (prev_element.hasClass('disabled')) {
                        $(prev_element).removeClass('disabled');
                    }
                    if (last_element.hasClass('disabled')) {
                        $(last_element).removeClass('disabled');
                    }
                    if (first_element.hasClass('disabled')) {
                        $(first_element).removeClass('disabled');
                    }
                }
            }
        } else if ($(this).hasClass('last')) {
            var pageNum = pagenum;
            var next_element = $('#' + pagination_id + ' li.next');
            var prev_element = $('#' + pagination_id + ' li.prev');
            var first_element = $('#' + pagination_id + ' li.first');
            var last_element = $('#' + pagination_id + ' li.last');

            if (pageNum <= pagenum) {
                if (pageNum == pagenum) {
                    if (!next_element.hasClass('disabled')) {
                        $(next_element).addClass('disabled');
                    }
                    if (prev_element.hasClass('disabled')) {
                        $(prev_element).removeClass('disabled');
                    }
                    if (!last_element.hasClass('disabled')) {
                        $(last_element).addClass('disabled');
                    }
                    if (first_element.hasClass('disabled')) {
                        $(first_element).removeClass('disabled');
                    }
                } else if (pageNum == 1) {
                    if (next_element.hasClass('disabled')) {
                        $(next_element).removeClass('disabled');
                    }
                    if (!prev_element.hasClass('disabled')) {
                        $(prev_element).addClass('disabled');
                    }
                    if (last_element.hasClass('disabled')) {
                        $(last_element).removeClass('disabled');
                    }
                    if (!first_element.hasClass('disabled')) {
                        $(first_element).addClass('disabled');
                    }
                } else {
                    if (next_element.hasClass('disabled')) {
                        $(next_element).removeClass('disabled');
                    }
                    if (prev_element.hasClass('disabled')) {
                        $(prev_element).removeClass('disabled');
                    }
                    if (last_element.hasClass('disabled')) {
                        $(last_element).removeClass('disabled');
                    }
                    if (first_element.hasClass('disabled')) {
                        $(first_element).removeClass('disabled');
                    }
                }
                var rowIndex = 0;
                $('#' + pagination_id + ' li').removeClass('active');
                $('#' + pagination_id + ' li:nth-last-child(3)').addClass('active');
                $(layout + ' ' + divider_item_name).each(function () {
                    rowIndex++;
                    /* 2->3페이지 넘어 갈때
                    * 1 > 3 * 2(6) || 1 <= 3 hide
                    * 2 > 3 * 2(6) || 2 <= 3 hide
                    * 3 > 3 * 2(6) || 3 <= 3 hide
                    * 4 > 3 * 2(6) || 4 <= 3 hide
                    * 5 > 6 || 5 <= 3 hide
                    * 6 > 6 || 6 <= 6 hide
                    * 7 > 6 || 7 <= 6 true
                    * 8 > 6 || 8 <= 6 true
                    * 9 > 6 || 9 <= 6 true
                    * 10 > 6 || 10 <= 6 true ??
                    * */
                    if (rowIndex > (maxRows * pageNum) || rowIndex <= ((maxRows * pageNum) - maxRows)) {
                        $(this).hide();
                    } else {
                        $(this).show();
                    }
                });
                /*TODO View Page 제어*/
                var basePageNum = pageNum;
                var root_element = $('#' + pagination_id + ' li:nth-child(' + 3 + ')');
                var base_element = $('#' + pagination_id + ' li:nth-last-child(' + 3 + ')');
                var element = root_element;
                /*Disable*/
                for (var i = 1; i <= pagenum; i++) {
                    element.hide();
                    element = element.next();
                }
                /*앞으로 3개*/
                console.log(base_element);
                element = base_element;
                element.show();
                for (var i = 1; i <= viewPage; i++) {
                    console.log(basePageNum + i);
                    console.log(pagenum);
                    if ((basePageNum + i) <= pagenum) {
                        element = element.next();
                        if (element === null || element === undefined || element.hasClass('next')) {
                            break;
                        }
                        element.show();
                    }
                }
                /*뒤로 3개*/
                element = base_element;
                for (var i = 1; i <= viewPage; i++) {
                    if ((basePageNum - i) >= 1) {
                        element = element.prev();
                        if (element === null || element === undefined || element.hasClass('prev')) {
                            break;
                        }
                        element.show();
                    }
                }
                /*TODO View Page 제어*/
            } else {
                if (pageNum == pagenum) {
                    if (!next_element.hasClass('disabled')) {
                        $(next_element).addClass('disabled');
                    }
                    if (prev_element.hasClass('disabled')) {
                        $(prev_element).removeClass('disabled');
                    }
                    if (!last_element.hasClass('disabled')) {
                        $(last_element).addClass('disabled');
                    }
                    if (first_element.hasClass('disabled')) {
                        $(first_element).removeClass('disabled');
                    }
                } else if (pageNum == 1) {
                    if (next_element.hasClass('disabled')) {
                        $(next_element).removeClass('disabled');
                    }
                    if (!prev_element.hasClass('disabled')) {
                        $(prev_element).addClass('disabled');
                    }
                    if (last_element.hasClass('disabled')) {
                        $(last_element).removeClass('disabled');
                    }
                    if (!first_element.hasClass('disabled')) {
                        $(first_element).addClass('disabled');
                    }
                } else {
                    if (next_element.hasClass('disabled')) {
                        $(next_element).removeClass('disabled');
                    }
                    if (prev_element.hasClass('disabled')) {
                        $(prev_element).removeClass('disabled');
                    }
                    if (last_element.hasClass('disabled')) {
                        $(last_element).removeClass('disabled');
                    }
                    if (first_element.hasClass('disabled')) {
                        $(first_element).removeClass('disabled');
                    }
                }
            }
        } else {
            /*TODO View Page 제어*/
            var basePageNum = $(this).attr('data-page') * 1;
            var root_element = $('#' + pagination_id + ' li:nth-child(' + 3 + ')');
            var base_element = $(this);
            var element = root_element;
            /*Disable*/
            for (var i = 1; i <= pagenum; i++) {
                element.hide();
                element = element.next();
            }
            /*앞으로 3개*/
            element = base_element;
            element.show();
            for (var i = 1; i <= viewPage; i++) {
                if ((basePageNum + i) <= pagenum) {
                    element = element.next();
                    if (element === null || element === undefined || element.hasClass('next')) {
                        break;
                    }
                    element.show();
                }
            }
            /*뒤로 3개*/
            element = base_element;
            for (var i = 1; i <= viewPage; i++) {
                if ((basePageNum - i) >= 1) {
                    element = element.prev();
                    if (element === null || element === undefined || element.hasClass('prev')) {
                        break;
                    }
                    element.show();
                }
            }
            /*TODO View Page 제어*/

            var pageNum = $(this).attr('data-page');
            var rowIndex = 0;
            var next_element = $('#' + pagination_id + ' li.next');
            var prev_element = $('#' + pagination_id + ' li.prev');
            var first_element = $('#' + pagination_id + ' li.first');
            var last_element = $('#' + pagination_id + ' li.last');
            if (pageNum == pagenum) {
                if (!next_element.hasClass('disabled')) {
                    $(next_element).addClass('disabled');
                }
                if (prev_element.hasClass('disabled')) {
                    $(prev_element).removeClass('disabled');
                }
                if (!last_element.hasClass('disabled')) {
                    $(last_element).addClass('disabled');
                }
                if (first_element.hasClass('disabled')) {
                    $(first_element).removeClass('disabled');
                }
            } else if (pageNum == 1) {
                if (next_element.hasClass('disabled')) {
                    $(next_element).removeClass('disabled');
                }
                if (!prev_element.hasClass('disabled')) {
                    $(prev_element).addClass('disabled');
                }
                if (last_element.hasClass('disabled')) {
                    $(last_element).removeClass('disabled');
                }
                if (!first_element.hasClass('disabled')) {
                    $(first_element).addClass('disabled');
                }
            } else {
                if (next_element.hasClass('disabled')) {
                    $(next_element).removeClass('disabled');
                }
                if (prev_element.hasClass('disabled')) {
                    $(prev_element).removeClass('disabled');
                }
                if (last_element.hasClass('disabled')) {
                    $(last_element).removeClass('disabled');
                }
                if (first_element.hasClass('disabled')) {
                    $(first_element).removeClass('disabled');
                }
            }
            $('#' + pagination_id + ' li').removeClass('active');
            $(this).addClass('active');
            $(layout + ' ' + divider_item_name).each(function () {
                rowIndex++;
                if (rowIndex > (maxRows * pageNum) || rowIndex <= ((maxRows * pageNum) - maxRows)) {
                    $(this).hide();
                } else {
                    $(this).show();
                }
            });
        }
    });
};