/**
 * 
 * @param {string} str 
 * @returns 
 */
function binaryAgent(str) {
    return str.split(" ")
        .map(
            bin => String.fromCharCode(
                parseInt(bin, 2)
            )
        )
        .join("");
}