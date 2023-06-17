/**
 * 
 * @param {string} str 
 * @returns 
 */
function palindrome(str) {
    const cleanStr = str.replace(/[-_]|\W*|\s*|/g, "");
    for(let i = 0; i < cleanStr.length; i++) {
        if(cleanStr[i].toLowerCase() !== cleanStr[(cleanStr.length - 1) - i].toLowerCase()) {
            return false;
        }
    }
    return true;
}