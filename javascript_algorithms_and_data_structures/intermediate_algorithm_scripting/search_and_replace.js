/**
 * 
 * @param {string} str 
 * @param {string} before 
 * @param {string} after 
 * @returns
 */
function myReplace(str, before, after) {
    const searchRegExp = RegExp(`${before}`, "i")
    const foundWord = str.match(searchRegExp);
    if(foundWord === null) {
        throw Error("word not found");
    }
    if(foundWord[0].match(/^[A-Z]\w+/)?.length > 0) {
        const capAfter = `${after[0].toUpperCase()}${after.substring(1)}`;
        return str.replace(searchRegExp, capAfter);
    }
    return str.replace(searchRegExp, after.toLowerCase());
}