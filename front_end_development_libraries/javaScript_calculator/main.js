document.addEventListener(
    'DOMContentLoaded',
    () => {
        /**
         * @type {NodeListOf<HTMLTableCellElement>}
         */
        const calculatorButtons = document.querySelectorAll('tr.calculator-buttons > td');
        const inputDisplay = document.querySelector('td#display > span#input');
        const outputDisplay = document.querySelector('td#display > span#output');

        calculatorButtons.forEach(
            calculatorButton => {
                calculatorButton.addEventListener(
                    'click',
                    () => onCalculatorButtonClicked(
                        calculatorButton,
                        inputDisplay,
                        outputDisplay
                    )
                )
            }
        );
    }
);

/**
 * 
 * @param {HTMLTableCellElement} calculatorButton 
 * @param {HTMLSpanElement} inputDisplay 
 * @param {HTMLSpanElement} outputDisplay 
 */
function onCalculatorButtonClicked(
    calculatorButton,
    inputDisplay,
    outputDisplay
) {
    const operators = ['+', '-', 'x', '/'];
    switch(calculatorButton.innerText.toLocaleLowerCase()) {
        case 'ac':
            inputDisplay.innerText = '0';
            outputDisplay.innerText = '';
            break;
        case '.':
            if(!inputDisplay.innerText.includes('.')) {
                inputDisplay.innerText += calculatorButton.innerText;
            }
            break;
        case '+':
        case '-':
        case 'x':
        case '/':
            if(inputDisplay.innerText !== '0') {
                if(outputDisplay.innerText === '') {
                    outputDisplay.innerText = inputDisplay.innerText + calculatorButton.innerText;
                } else {
                    outputDisplay.innerText += inputDisplay.innerText + calculatorButton.innerText;
                }
                inputDisplay.innerText = '0';
            } else if(operators.includes(outputDisplay.innerText.substring(outputDisplay.innerText.length - 1))) {
                if(calculatorButton.innerText === '-' && outputDisplay.innerText.substring(outputDisplay.innerText.length - 1) !== '-') {
                    outputDisplay.innerText += calculatorButton.innerText;
                } else if(operators.includes(outputDisplay.innerText.substring(outputDisplay.innerText.length - 2, outputDisplay.innerText.length - 1))) {
                    outputDisplay.innerText = outputDisplay.innerText.substring(0, outputDisplay.innerText.length - 2) + calculatorButton.innerText;
                } else {
                    outputDisplay.innerText = outputDisplay.innerText.substring(0, outputDisplay.innerText.length - 1) + calculatorButton.innerText;
                }
            }
            break;
        case '=':
            if(operators.includes(outputDisplay.innerText.substring(outputDisplay.innerText.length - 1)) && inputDisplay.innerText !== '0') {
                outputDisplay.innerText += inputDisplay.innerText;
            }
            inputDisplay.innerText = eval(outputDisplay.innerText.replace(/x/g, '*'));
            outputDisplay.innerText = '';
            break;
        default:
            if(inputDisplay.innerText === '0' && calculatorButton.innerText !== '.') {
                inputDisplay.innerText = calculatorButton.innerText;
            } else {
                inputDisplay.innerText += calculatorButton.innerText;
            }
    }
}