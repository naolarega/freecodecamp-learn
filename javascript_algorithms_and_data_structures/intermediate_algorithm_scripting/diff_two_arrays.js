/**
 * Finds the difference in arrays
 * @param {unknown[]} arr1 
 * @param {unknown[]} arr2 
 * @returns
 */
function diffArray(arr1, arr2) {
    const newArr = [
        ...arr1.filter(num1 => typeof arr2.find(num2 => num2 === num1) === "undefined"),
        ...arr2.filter(num2 => typeof arr1.find(num1 => num1 === num2) === "undefined")
    ]
    return newArr;
}