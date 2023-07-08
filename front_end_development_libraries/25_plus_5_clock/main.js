document.addEventListener(
    'DOMContentLoaded',
    () => {
        /**
         * @type {HTMLSpanElement}
         */
        const breakLength = document.querySelector('#break-length');

        /**
         * @type {HTMLSpanElement}
         */
        const sessionLength = document.querySelector('#session-length');

        /**
         * @type {HTMLElement}
         */
        const breakDecrement = document.querySelector('#break-decrement');

        /**
         * @type {HTMLElement}
         */
        const breakIncrement = document.querySelector('#break-increment');

        /**
         * @type {HTMLElement}
         */
        const sessionDecrement = document.querySelector('#session-decrement');

        /**
         * @type {HTMLElement}
         */
        const sessionIncrement = document.querySelector('#session-increment');

        /**
         * @type {HTMLElement}
         */
        const startStop = document.querySelector('#start_stop');

        /**
         * @type {HTMLElement}
         */
        const reset = document.querySelector('#reset');

        /**
         * @type {HTMLSpanElement}
         */
        const timeLeft = document.querySelector('#time-left');

        /**
         * @type {HTMLSpanElement}
         */
        const timerLabel = document.querySelector('#timer-label');

        /**
         * @type {HTMLAudioElement}
         */
        const beep = document.querySelector('#beep');

        /**
         * @type {boolean}
         */
        let timerRunning = false;

        /**
         * @type {number}
         */
        let timerId = 0;

        /**
         * @type {{minute: number, second: number}}
         */
        let timerLeft = {
            minute: 25,
            second: 0
        };

        reset.addEventListener(
            'click',
            () => {
                if (timerRunning) {
                    clearInterval(timerId);
                    timerRunning = false;
                }

                if (!beep.paused) {
                    beep.pause();
                    beep.currentTime = 0;
                }

                breakLength.innerText = 5;
                sessionLength.innerText = timerLeft.minute = 25;
                timerLeft.second = 0;

                timerLabel.innerText = 'Session';
                timeLeft.innerText = '25:00';
            }
        );

        breakDecrement.addEventListener(
            'click',
            () => {
                if (breakLength.innerText > 1 && !timerRunning) {
                    breakLength.innerText = parseInt(breakLength.innerText) - 1;
                }
            }
        );

        breakIncrement.addEventListener(
            'click',
            () => {
                if (breakLength.innerText < 60 && !timerRunning) {
                    breakLength.innerText = parseInt(breakLength.innerText) + 1;
                }
            }
        );

        sessionDecrement.addEventListener(
            'click',
            () => {
                if (sessionLength.innerText > 1 && !timerRunning) {
                    sessionLength.innerText = parseInt(sessionLength.innerText) - 1;
                    timeLeft.innerText = `${sessionLength.innerText}:00`;
                }
            }
        );

        sessionIncrement.addEventListener(
            'click',
            () => {
                if (sessionLength.innerText < 60 && !timerRunning) {
                    sessionLength.innerText = parseInt(sessionLength.innerText) + 1;
                    timeLeft.innerText = `${sessionLength.innerText}:00`;
                }
            }
        );

        startStop.addEventListener(
            'click',
            () => {
                if (!timerRunning) {
                    if (sessionLength.innerText != timerLeft.minute || timerLeft.second != 0) {
                        timerLeft.minute = parseInt(sessionLength.innerText);
                    }

                    timerId = setInterval(
                        () => {
                            if (timerLeft.second == 0 && timerLeft.minute == 0) {
                                beep.play();

                                if (timerLabel.innerText === 'Session') {
                                    timerLabel.innerText =  'Break';
                                    timerLeft.minute = parseInt(breakLength.innerText);
                                    timerLeft.second = 0;
                                } else {
                                    timerLabel.innerText =  'Session';
                                    timerLeft.minute = parseInt(sessionLength.innerText);
                                    timerLeft.second = 0;
                                }
                            } else {
                                if (timerLeft.second > 0) {
                                    timerLeft.second -= 1;
                                } else {
                                    timerLeft.minute -= 1;
                                    timerLeft.second = 59;
                                }
                            }

                            timeLeft.innerText = `${timerLeft.minute < 10 ? '0' : ''}${timerLeft.minute}:${timerLeft.second < 10 ? '0' : ''}${timerLeft.second}`;
                        },
                        1000
                    );
                    timerRunning = true;
                } else {
                    clearInterval(timerId);
                    timerRunning = false;
                }
            }
        );
    }
);