function checkValue(value, type) {
    switch (type) {
        case 'review_answer' :
            if(value.length < 3) {
                alert("리뷰 답변은 최소 3자 이상 입력해주세요.");
                return false;
            } else if (value.length > 501) {
                alert("리뷰 답변은 500자를 넘길 수 없습니다.");
                return false;
            }
            break;
        default:
            return false;
    }
}