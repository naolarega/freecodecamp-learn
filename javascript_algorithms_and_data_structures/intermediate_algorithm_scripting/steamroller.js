/**
 * 
 * @param {[]} arr 
 * @returns 
 */
function steamrollArray(arr) {
    let flatArr = [];
    const extractor = (val_one, val_two) => {
        for(let item of val_one) {
            if(item instanceof Array) {
                extractor(item, val_two);
            } else {
                val_two.push(item);
            }
        }
    }
    extractor(arr, flatArr);
    return flatArr;
}