/**
 * 
 * @param {object[]} collection 
 * @param {string} pre 
 * @returns 
 */
function truthCheck(collection, pre) {
    return collection.every(
        item => Boolean(item[pre])
    );
}