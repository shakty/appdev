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
        this.doneButton = node.widgets.append('DoneButton', header);

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
        // cb: function() {
        //     // Modify CSS rules on the fly.
        //     W.cssRule('.choicetable-left, .choicetable-right ' +
        //     '{ width: 200px !important; }');
        //
        //     W.cssRule('table.choicetable td { text-align: left !important; ' +
        //     'font-weight: normal; padding-left: 10px; }');
        // },

        // Make a widget step.
        widget: {
            name: 'ChoiceManager',
            options: {
                id: 'demo',
                mainText: 'All questions are optional.',
                forms: [
                    {
                        name: 'ChoiceTable',
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
                        hint: 'E.g., Economics, Psychology, Political Science, etc.'
                    },
                    {
                        name: 'ChoiceTable',
                        id: 'grade',
                        mainText: 'Academic grade:',
                        choicesSetSize: 5,
                        choices: [
                            'Bachelor', 'Master', 'PhD', 'Post Graduate', 'Prof'
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
        // cb: function() {
        //     // Modify CSS rules on the fly.
        //     W.cssRule('.choicetable-left, .choicetable-right ' +
        //     '{ width: 200px !important; }');
        //
        //     W.cssRule('table.choicetable td { text-align: left !important; ' +
        //     'font-weight: normal; padding-left: 10px; }');
        // },
        name: 'Programming skills',
        // Make a widget step.
        widget: {
            name: 'ChoiceManager',
            options: {
                id: 'skills',
                mainText: 'All questions are optional.',
                forms: [

                    {
                        name: 'ChoiceTable',
                        id: 'programming',
                        mainText: 'How skillful of a programmer you are?',
                        hint: 'Please read about the <a href="https://www.psychologytoday.com/us/basics/dunning-kruger-effect" target="_blank">Dunning-Kruger</a> effects.',
                        choices: [ 'Never programmed', 'Beginner',
                        'Intermediate', 'Advanced', 'I created the Matrix' ]
                    },
                    {
                        name: 'ChoiceTable',
                        id: 'js',
                        selectMultiple: true,
                        mainText: 'During your journey in computer programming have you ever encountered:',
                        hint: 'Select all that you have used at least once.',
                        choicesSetSize: 5,
                        choices: [
                            'Arrow functions', 'Map-reduce patterns', 'Restful APIs',
                            'jQuery', 'Bootstrap', 'Cordova', 'Ionic Framework',
                            'Express', 'HTML', 'JavaScript', 'Asynchronous functions',
                            'Python', 'R', 'Java', 'Matlab'
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
                        name: 'ChoiceTable',
                        id: 'project',
                        mainText: 'I would like to create a: ',
                        choices: [
                            'Mobile app',
                            'Web app',
                            'Chrome extension',
                            'Behavioral Experiment',
                            'Not sure yet'
                        ],
                        orientation: 'v'
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
