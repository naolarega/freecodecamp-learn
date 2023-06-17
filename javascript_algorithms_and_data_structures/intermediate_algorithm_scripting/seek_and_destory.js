/**
 * 
 * @param {[]} arr 
 * @returns 
 */
function destroyer(arr) {
    const [_, ...targets] = arguments;
    return arr.filter(
        num => !targets.some(target => target === num)
    );
}