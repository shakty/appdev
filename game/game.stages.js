/**
 * # Game stages definition file
 * Copyright(c) 2021 Stefano <futur.dorko@gmail.com>
 * MIT Licensed
 *
 * Stages are defined using the stager API
 *
 * http://www.nodegame.org
 * ---
 */

module.exports = function(stager, settings) {

     stager
        .stage('survey')
        .step('demographics')
        .step('skills')
        .step('goals')

        .stage('end')

        .gameover();

    // Notice: here all stages but 'game' have
    // one step named after the stage.

    // Skip one stage.
    // stager.skip('instructions');

    // Skip multiple stages:
    // stager.skip([ 'instructions', 'quiz' ])

    // Skip a step within a stage:
    // stager.skip('game', 'results');
};
