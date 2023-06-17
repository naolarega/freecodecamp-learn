/**
 * 
 * @param {string} str 
 * @returns 
 */
function rot13(str) {
    return str.split("")
        .map(
            value => {
                const charCode = value.charCodeAt(0);
                console.log(charCode);
                if(charCode < 65 || charCode > 90) {
                    return value;
                } else if(charCode - 13 < 65) {
                    return String.fromCharCode(91 - (13 - (charCode - 65)));
                }
                return String.fromCharCode(charCode - 13);
            }
        )
        .join("");
}