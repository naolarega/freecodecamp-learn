/**
 * 
 * @param {number[]} arr 
 * @returns 
 */
function smallestCommons(arr) {
    let [min, max] = arr;
    if(min > max) {
        [min, max] = [max, min];
    }
    for(let i = max;; i++) {
        let evenDivisors = 0;
        for(let j = min; j <= max; j++) {
            if(i % j === 0) {
                evenDivisors++;
            } else {
                break;
            }
        }
        if(evenDivisors === (max + 1) - min) {
            return i;
        }
    }
}