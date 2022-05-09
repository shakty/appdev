/**
* # Player type implementation of the game stages
* Copyright(c) 2021 Stefano <futur.dorko@gmail.com>
* MIT Licensed
*
* Each client type must extend / implement the stages defined in `game.stages`.
* Upon connection each client is assigned a client type and it is automatically
* setup with it.
*
* http://www.nodegame.org
* ---
*/

"use strict";

const ngc = require('nodegame-client');

module.exports = function(treatmentName, settings, stager, setup, gameRoom) {

    // Define a function for future use.
    function capitalizeInput(input) {
        var str;
        str = input.value;
        str = str.charAt(0).toUpperCase() + str.substr(1).toLowerCase();
        input.value = str;
    }

    // Make the player step through the steps without waiting for other players.
    stager.setDefaultStepRule(ngc.stepRules.SOLO);

    stager.setOnInit(function() {

        // Initialize the client.

        var header;

        // Setup page: header + frame.
        header = W.generateHeader();
        W.generateFrame();

        // Add widgets.
        this.visuaStage = node.widgets.append('VisualStage', header);
        // this.visualRound = node.widgets.append('VisualRound', header);
        this.doneButton = node.widgets.append('DoneButton', header, { 
            text: "Next" 
        });

        // No need to show the wait for other players screen in single-player
        // games.
        W.init({ waitScreen: false });

        // Additional debug information while developing the game.
        // this.debugInfo = node.widgets.append('DebugInfo', header)
    });


    stager.extendStage('survey', {
        frame: {
            uri: 'survey.htm',
            reload: false
        }
    });

    stager.extendStep('demographics', {
        // Make a widget step.
        widget: {
            name: 'ChoiceManager',
            options: {
                id: 'demo',
                mainText: 'All questions are optional.',
                forms: [
                    {
                        id: 'gender',
                        mainText: 'What is your gender?',
                        choices: [ 'Male', 'Female', 'Other' ],
                        shuffleChoices: false,
                        onclick: function(value, removed) {
                            var w;
                            w = node.widgets.lastAppended.formsById.othergender;
                            if ((value === 2) && !removed) w.show();
                            else w.hide();
                            W.adjustFrameHeight();
                        },
                        preprocess: capitalizeInput
                    },
                    {
                        name: 'CustomInput',
                        id: 'othergender',
                        mainText: 'Please name your gender.',
                        width: '100%',
                        hidden: true
                    },
                    {
                        name: 'CustomInput',
                        id: 'age',
                        mainText: 'What is your age?',
                        type: 'int',
                        min: 18,
                        // requiredChoice: false
                    },
                    {
                        name: 'CustomInput',
                        id: 'discipline',
                        mainText: 'What is your core discipline?',
                        hint: 'E.g., Economics, Psychology, Political Science, etc.',
                        width: '95%'
                    },
                    {
                        id: 'grade',
                        mainText: 'What is your current academic position?',
                        choicesSetSize: 6,
                        choices: [
                            'Bachelor Student', 'Master Student', 'PhD Student', 'Postdoc', 'Prof', 'Dean'
                        ]
                    },

                ]
            }
        },
        done: function(values) {
            // Simplify data structure.
            return values.forms;
        }
    });

    stager.extendStep('skills', {
        name: 'Programming skills',
        // Make a widget step.
        widget: {
            name: 'ChoiceManager',
            options: {
                id: 'skills',
                mainText: 'All questions are optional.',
                forms: [
                    {
                        id: 'languages',
                        selectMultiple: true,
                        mainText: 'Which of the following computer languages have you already used?',
                        hint: 'Select all that you have used at least once.',
                        choicesSetSize: 6,
                        choices: [
                            'JavaScript', 'Stata', 'HTML', 'CSS', 'Markdown',
                            'Python', 'R', 'Java', 'Matlab', 'Julia', 'Rust',
                            'Scala', 'C', 'C++', 'PHP', 'Go', 'TypeScript', 'Other'
                        ]
                    },
                    {
                        id: 'programming',
                        mainText: 'How skillful of a programmer you are in your favorite programming language?',
                        hint: 'Please read about the <a href="https://www.psychologytoday.com/us/basics/dunning-kruger-effect" target="_blank">Dunning-Kruger</a> effects.',
                        choices: [ 'Never programmed', 'Beginner',
                        'Intermediate', 'Advanced', 'I created the Matrix' ]
                    },
                    {
                        id: 'editor',
                        selectMultiple: true,
                        mainText: 'What text editor do you usually use for programming?',
                        choices: [
                            'Atom', 'Visual Studio Code', 'R Studio', 'Sublime', 'Other',
                            'Text Editor?'
                        ]
                    },
                    {
                        id: 'terminal',
                        mainText: 'Would you say that you are comfortable using a Terminal?',
                        choices: [
                            'Yes',  'No', 'Terminal?'
                        ]
                    },
                    {
                        id: 'git',
                        mainText: 'Would you say that you are comfortable using Git?',
                        choices: [
                            'Yes',  'No', 'Git?'
                        ]
                    },
                    {
                        id: 'js',
                        selectMultiple: true,
                        mainText: 'During your journey in computer programming have you ever encountered any of the following frameworks/patterns/platforms:',
                        hint: 'Select all that you have used at least once.',
                        choicesSetSize: 5,
                        choices: [
                            'Arrow functions', 'Map-reduce patterns', 'Restful APIs',
                            'jQuery', 'Bootstrap', 'Cordova', 'Ionic Framework',
                            'ExpressJS', 'Asynchronous functions', 'Debugger',
                            'React', 'Angular', 'Developer Console', 'Netlify', 'Heroku'
                        ]
                    }
                ]
            }
        },
        done: function(values) {
            // Simplify data structure.
            return values.forms;
        }
    });

    stager.extendStep('goals', {
        // frame: 'survey.htm',
        // Make a widget step.
        name: 'Goals for the Workshop',
        widget: {
            name: 'ChoiceManager',
            options: {
                id: 'goal',
                mainText: 'All questions are optional.',
                forms: [
                    {
                        id: 'project',
                        mainText: 'Did you take part in the intro course in Nov 2021? ',
                        choices: [
                            'Yes',
                            'No',
                            'Don\'t remember'
                        ]
                    },
                    {
                        id: 'project',
                        mainText: 'From this course, I would like how to learn how to create a: ',
                        choices: [
                            'Web app',
                            'Chrome extension',
                            'Mobile app',
                            'Behavioral Experiment/Survey (like this one)',
                            'Collect data from public API / web scraping',
                            'Not quite sure yet'
                        ],
                        orientation: 'v'
                    },
                  
                    // {
                    //     id: 'project',
                    //     mainText: 'From this introductory course I am mainly expecting to learn: ',
                    //     choices: [
                    //         'The basics of computer programming in general',
                    //         'The foundations of JavaScript',
                    //         'How to create a web app',
                    //         'How to collect data from public APIs / web scraping',
                    //         'I have my own project I would like some help with',
                    //         'Not quite sure yet'
                    //     ],
                    //     orientation: 'v'
                    // },
                    {
                        id: 'prep',
                        mainText: 'This course assumes some knowledge of computer programming and JavaScript.</br>Are you interested in a <em>quick</em> prep lecture before the beginning of the workshop?',
                        hint: 'Prep lecture to take place on the morning of the same day of the first lecture.',
                        choices: [
                            'Yes', 'No'
                        ]
                    },
                    {
                        name: 'Feedback',
                        id: 'feedback',
                        mainText: 'Do you have any additional comments/requests?',
                        showSubmit: false,
                        panel: false
                    },
                ]
            }
        },
        done: function(values) {
            // Simplify data structure.
            return values.forms;
        }
    });

    stager.extendStep('end', {
        init: function() {
            node.game.doneButton.destroy();
        },
        widget: {
            name: 'ContentBox',
            options: {
                mainText: 'Thanks! Your data have been saved.'
            }
        }
    });
};
