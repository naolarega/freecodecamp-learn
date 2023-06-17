/**
 * 
 * @param {string} str 
 * @returns 
 */
function translatePigLatin(str) {
    const consonants = str.match(/^[^aeiou]+/i);
    if(consonants !== null) {
        return `${str.substring(consonants[0].length)}${consonants[0]}ay`;
    }
    return `${str}way`;
}