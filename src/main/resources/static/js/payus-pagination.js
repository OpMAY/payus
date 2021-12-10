function tablePagination(totalItemNumber, paginationId) {
    // PAGING
    const rowsPerPage = 10;
    let table = $('.payus-table');
    let lastPageNum = Math.ceil(totalItemNumber / rowsPerPage);
    const paginationDiv = $('#' + paginationId);
    paginationDiv.append('<a href="#">&laquo;</a>');
    if(totalItemNumber !== 0){
        for (let i = 1; i <= lastPageNum; i++) {
            if (i <= 10)
                paginationDiv.append('<a data-order="' + i + '" style="cursor: pointer">' + i + '</a>');
        }
        paginationDiv.children(':eq(1)').addClass("active");
    } else {
        paginationDiv.append('<a data-order="1" style="cursor: pointer" class="active">1</a>')
    }
    paginationDiv.append('<a href="#">&raquo;</a>');
}