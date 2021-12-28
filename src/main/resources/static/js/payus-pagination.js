function tablePagination(totalItemNumber, paginationId) {
    // PAGING
    const rowsPerPage = 10;
    let table = $('.payus-table');
    let lastPageNum = Math.ceil(totalItemNumber / rowsPerPage);
    const paginationDiv = $('#' + paginationId);
    paginationDiv.children().remove();
    paginationDiv.append('<a data-order="-1" style="cursor: pointer">&laquo;</a>');
    if (totalItemNumber !== 0) {
        for (let i = 1; i <= lastPageNum; i++) {
            if (i <= 10)
                paginationDiv.append('<a data-order="' + i + '" style="cursor: pointer">' + i + '</a>');
        }
        paginationDiv.children(':eq(1)').addClass("active");
    } else {
        paginationDiv.append('<a data-order="1" style="cursor: pointer" class="active">1</a>')
    }
    paginationDiv.append('<a data-order="0" style="cursor: pointer">&raquo;</a>');
}

function tablePaginationChange(totalItemNumber, paginationId, isNext) {
    // PAGING
    const rowsPerPage = 10;
    let table = $('.payus-table');
    let lastPageNum = Math.ceil(totalItemNumber / rowsPerPage);
    const paginationDiv = $('#' + paginationId);
    // 현재 Pagination 의 첫 번째 페이지 인덱스
    let currentFirstPage = paginationDiv.children('a:eq(1)').attr('data-order') * 1;
    // 변동될 Pagination 의 첫 번째 페이지 인덱스
    let nextFirstPage = isNext ? currentFirstPage + 10 : currentFirstPage - 10;
    if(!isNext && nextFirstPage <= 0){
        return false;
    } else if (nextFirstPage > lastPageNum){
        return false;
    }
    paginationDiv.children().remove();
    paginationDiv.append('<a data-order="-1" style="cursor: pointer">&laquo;</a>');
    if (totalItemNumber !== 0) {
        for (let i = nextFirstPage; i <= lastPageNum; i++) {
            if (i < nextFirstPage + 10)
                paginationDiv.append('<a data-order="' + i + '" style="cursor: pointer">' + i + '</a>');
        }
        paginationDiv.children(':eq(1)').addClass("active");
        paginationDiv.children(':eq(1)').click();
    } else {
        paginationDiv.append('<a data-order="1" style="cursor: pointer" class="active">1</a>')
    }
    paginationDiv.append('<a data-order="0" style="cursor: pointer">&raquo;</a>');
    return true;
}