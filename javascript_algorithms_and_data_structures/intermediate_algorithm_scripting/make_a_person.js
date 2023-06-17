/**
 * 
 * @param {string} firstAndLast 
 */
const Person = function(firstAndLast) {
    this.getFirstName = function() {
        const [first, _] = firstAndLast.split(" ");
        return first;
    };

    this.getLastName = function() {
        const [_, last] = firstAndLast.split(" ");
        return last;
    };

    this.getFullName = function() {
        return firstAndLast;
    };

    this.setFirstName = function(first) {
        firstAndLast = firstAndLast.replace(/^\w+/, first);
    };

    this.setLastName = function(last) {
        firstAndLast = firstAndLast.replace(/\w+$/, last);
    };

    this.setFullName = function(newFirstAndLast) {
        firstAndLast = newFirstAndLast;
    }
};