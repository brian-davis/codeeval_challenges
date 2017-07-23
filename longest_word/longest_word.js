function solution (line) {
    'use strict';
    var words;
    words = line.split(' ').sort(function (a, b) {
        return b.length - a.length;
    });
    return words[0];
}

// node, mocha
module.exports.solution = solution;

// codeeval filesystem interface
var fs = require('fs');
function init (file) {
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