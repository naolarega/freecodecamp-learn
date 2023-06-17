/**
 * 
 * @param {string} str 
 * @returns 
 */
function spinalCase(str) {
    return str.match(/^[A-z][a-z]+|[A-Z][a-z]+|(?![ -])[a-z]+/g).join("-").toLowerCase();
}