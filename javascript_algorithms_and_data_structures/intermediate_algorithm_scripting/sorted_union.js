/**
 * 
 * @param {[][]} arr 
 * @returns 
 */
function uniteUnique(arr) {
    const sortedUnions = [];
    for(let argument of arguments) {
        argument.forEach(
            num => {
                if(!sortedUnions.includes(num)) {
                    sortedUnions.push(num);
                }
            }
        );
    }
    return sortedUnions;
}