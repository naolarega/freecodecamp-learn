/**
 * 
 * @param {string} str 
 * @returns 
 */
function telephoneCheck(str) {
    return /^1?\s?(\((\d{3})\)|\({0}\d{3}\){0})(-?\s?)\d{3}-?\s?\d{4}$/.test(str);
}