/**
 * 
 * @param {string} str 
 * @returns 
 */
function pairElement(str) {
    return str.split("").map(
        char => [
            char,
            (
                () => {
                    switch(char) {
                        case "A": return "T"
                        case "T": return "A"
                        case "C": return "G"
                        default: return "C"
                    }
                }
            )()
        ]
    );
}