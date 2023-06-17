/**
 * 
 * @param {object[]} collection 
 * @param {object} source 
 * @returns 
 */
function whatIsInAName(collection, source) {
    return collection.filter(
        item => {
            let matchingFields = 0;
            let expectedFields = 0;
            for(let key in source) {
                if(
                    key in item &&
                    source[key] === item[key]
                ) {
                    matchingFields++;
                }
                expectedFields++;
            }
            return matchingFields === expectedFields;
        }
    );
}