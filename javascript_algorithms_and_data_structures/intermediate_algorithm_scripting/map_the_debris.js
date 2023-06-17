/**
 * 
 * @param {object[]} arr 
 * @returns 
 */
function orbitalPeriod(arr) {
    const GM = 398600.4418;
    const earthRadius = 6367.4447;
    return arr.map(
        body => ({
            name: body["name"],
            orbitalPeriod: Math.round(
                2 * Math.PI *
                Math.sqrt(
                    Math.pow(earthRadius + body["avgAlt"], 3) / GM,
                )
            )
        })
    );
}