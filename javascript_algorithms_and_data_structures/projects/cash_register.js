const CURRENCIES = {
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
 * Start from the biggest currency possible. dedact as much as possible
 * then the next currency.
 * 
 * @param {number} price 0
 * @param {number} cash 
 * @param {[[string, number]]} cid 
 * @returns 
 */
function checkCashRegister(price, cash, cid) {
    let changeDue = parseFloat((cash - price).toFixed(2));
    const change = [];
    if(cid.reduce((prev, cur) => ["TOTAL", prev[1] += cur[1]])[1] == changeDue) {
        return {
            status: "CLOSED", change: cid
        };
    }
    for(let currency of Object.keys(CURRENCIES).reverse()) {
        const cashCurrencyInDrawer = cid.find(
            cashInCurrency => (
                cashInCurrency[0] == currency &&
                cashInCurrency[1] >= CURRENCIES[currency]
            )
        )
        if(
            CURRENCIES[currency] <= changeDue &&
            cashCurrencyInDrawer !== undefined
        ) {
            let currencyChange = Math.floor(changeDue / CURRENCIES[currency]) * CURRENCIES[currency];
            if(changeDue - currencyChange >= 0) {
                const currencyActualChange = currencyChange <= cashCurrencyInDrawer[1] ? currencyChange : cashCurrencyInDrawer[1];
                change.push([currency, currencyActualChange]);
                changeDue = parseFloat((changeDue - currencyActualChange).toFixed(2));
            }
        }
    }

    if(changeDue !== 0) {
        return {
            status: "INSUFFICIENT_FUNDS", change: []
        };
    }

    return {
        status: "OPEN", change
    };
}