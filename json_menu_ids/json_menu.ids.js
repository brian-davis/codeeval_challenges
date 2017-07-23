function solution(line) {
    var data = JSON.parse(line),
        labeled_items = data.menu.items
                        .filter(function(n){
                            return n != undefined;
                        }).filter(function(m){
                            return m.label != undefined;
                        }),
        memo = 0,
        i = 0;
    for (i; i < labeled_items.length; i ++) {
        memo += labeled_items[i].id;
    }
    return memo;
}

// node, mocha
module.exports.solution = solution;

// codeeval filesystem interface
var fs = require('fs');
function init(file) {
    'use strict';
    fs.readFile(file, 'utf-8', function (err, data) {
        // prep the file data
        if (err) throw err;
        var lines = data.split("\n");
        lines.pop();

        // feed to solution line by line
        lines.forEach(function (line) {
            console.log(solution(line));
        });
    });
}

init(process.argv[2]);
