/**
 * # Logic type implementation of the game stages
 * Copyright(c) 2021 Stefano <futur.dorko@gmail.com>
 * MIT Licensed
 *
 * http://www.nodegame.org
 * ---
 */

"use strict";

const ngc = require('nodegame-client');
const J = ngc.JSUS;

module.exports = function(treatmentName, settings, stager, setup, gameRoom) {

    let node = gameRoom.node;
    let channel = gameRoom.channel;
    let memory = node.game.memory;

    // Make the logic independent from players position in the game.
    stager.setDefaultStepRule(ngc.stepRules.SOLO);

    // Must implement the stages here.

    stager.setOnInit(function() {

        // Update player's guess with information if he or she won.

        node.on.data('done', function(msg) {

            let id = msg.from;
            let step = node.game.getStepId(msg.stage);

            if (step === 'goals') {
                let db = memory.player[id];
                db.save('data.csv', {
                    flatten: true,
                    append: true,
                    header: 'all'
                });
            }
        });
    });
};
