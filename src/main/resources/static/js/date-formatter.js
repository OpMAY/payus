/**
 * @return {string}
 */
function SplitDateFunction(dateString) {
    let year = dateString.split('-')[0];
    let month = dateString.split('-')[1];
    let date = dateString.split('-')[2].split(' ')[0];

    return year + '.' + month + '.' + date
}