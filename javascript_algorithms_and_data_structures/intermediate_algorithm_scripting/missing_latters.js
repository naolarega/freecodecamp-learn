/**
 * 
 * @param {string} str 
 * @returns 
 */
function fearNotLetter(str) {
    const sortedStr = str.split("").sort().join("");
    for(let i = 0; i < sortedStr.length; i++) {
        if(
            i + 1 < sortedStr.length &&
            sortedStr.charCodeAt(i) + 1 !== sortedStr.charCodeAt(i + 1)
        ) {
            return String.fromCharCode(sortedStr.charCodeAt(i) + 1);
        }
    }
    return undefined;
}