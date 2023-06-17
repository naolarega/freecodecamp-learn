/**
 * 
 * @param {number} num 
 */
function sumPrimes(num) {
    let primeSum = 0;
    for(let i = 0; i <= num; i++) {
        let divisors = 0;
        for(let j = 1; j <= i; j++) {
            if(i % j === 0) {
                divisors++;
            }
        }
        if(divisors == 2) {
            primeSum += i;
        }
    }
    return primeSum;
}