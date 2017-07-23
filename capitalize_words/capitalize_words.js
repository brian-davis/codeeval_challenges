function solution(line) {
    var characters = line.split('');
    characters[0] = characters[0].toUpperCase();
    for (var i = 0; i < characters.length; i ++) {
        if(characters[i] === ' ') {
            characters[i+1] = characters[i+1].toUpperCase();
        }
    }
    return characters.join('');
}

module.exports.solution = solution;

var fs = require('fs');
function init(file) {
    'use strict';
    fs.readFile(file, 'utf-8', function (err, data) {
        // prep the file data
        if (err) throw err;
        var lines = data.split("\n");
        lines.pop();

        // feed to solution line by line
        lines.forEach(function(line) {
            console.log(solution(line));
        });
    });
}

init(process.argv[2]);