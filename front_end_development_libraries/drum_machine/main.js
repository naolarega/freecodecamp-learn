document.addEventListener(
    'DOMContentLoaded',
    () => {
        /**
         * @type {NodeListOf<HTMLButtonElement>}
         */
        const drumPadButtons = document.querySelectorAll('.drum-pad');
        const displayBoard = document.querySelector('#display');

        drumPadButtons.forEach(
            drumPadButton => {
                drumPadButton.addEventListener(
                    'click',
                    () => onDrumpPadHit(
                        drumPadButton.children.item(0),
                        displayBoard,
                        drumPadButton.id
                    )
                );
            }
        );

        document.addEventListener(
            'keydown',
            event => {
                for(let drumPadButton of drumPadButtons) {
                    if(event.key === drumPadButton.innerText.toLowerCase() || event.key === drumPadButton.innerText) {
                        return onDrumpPadHit(
                            drumPadButton.children.item(0),
                            displayBoard,
                            drumPadButton.id
                        );
                    }
                }
            }
        );
    }
);

/**
 * 
 * @param {HTMLAudioElement} drumPadAudio 
 * @param {HTMLDivElement} displayBoard 
 * @param {string} displayText 
 */
function onDrumpPadHit(drumPadAudio, displayBoard, displayText) {
    displayBoard.innerText = displayText.replace(/-/g, ' ');
    drumPadAudio.play()
}