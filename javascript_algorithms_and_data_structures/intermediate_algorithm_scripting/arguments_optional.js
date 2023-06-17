function addTogether() {
    const [num_one, num_two] = arguments;
    if(arguments.length === 1) {
        return typeof num_one !== "number" ?
            undefined :
            arg_two => typeof arg_two !== "number" ? undefined : num_one + arg_two;
    } else {
        return (
            typeof num_one !== "number" ||
            typeof num_two !== "number"
        ) ? undefined : num_one + num_two;
    }
}