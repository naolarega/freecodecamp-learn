const CURRENCY = {
    "PENNY":        0.01,
    "NICKEL":       0.05,
    "DIME":         0.1,
    "QUARTER":      0.25,
    "ONE":          1,
    "FIVE":         5,
    "TEN":          10,
    "TWENTY":       20,
    "ONE HUNDRED":  100
}

/**
 * 
 * @param {number} price 
 * @param {number} cash 
 * @param {[[string, number]]} cid 
 * @returns 
 */
function checkCashRegister(price, cash, cid) {
    const change = cash - price;
    for(let cash of cid) {

    }
}

checkCashRegister(19.5, 20, [["PENNY", 1.01], ["NICKEL", 2.05], ["DIME", 3.1], ["QUARTER", 4.25], ["ONE", 90], ["FIVE", 55], ["TEN", 20], ["TWENTY", 60], ["ONE HUNDRED", 100]]);