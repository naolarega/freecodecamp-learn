/**
 * 1, 1, 2, 3, 5, 8, 13, 21, 34
 * @param {number} num 
 * @returns 
 */
function sumFibs(num) {
    let prevFib = 0;
    let curFib = 1;
    let fibSum = 1;
    while(true) {
        const tempFib = curFib;
        curFib = curFib + prevFib;
        prevFib = tempFib;
        if(curFib > num) {
            break;
        }
        if(curFib % 2 !== 0) {
            fibSum += curFib;
        }
    }
    return fibSum;
}