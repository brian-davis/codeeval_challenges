function solution(line) {
    'use strict';
    var string = line;
    var result = '';
    result += string[0];
    for (var i = 1; i < string.length; i++) {
        if (string[i] !== string[i - 1]) {
            result += string[i]
        }
    }
    return result;
}

// module.exports.solution = solution;

var fs = require('fs');
function init(file) {
    'use strict';
    fs.readFile(file, 'utf-8', function (err, data) {
        // prep the file data
        if (err) throw err;
        var lines = data.split("\n");
        // feed to solution line by line
        lines.forEach(function (line) {
            console.log(solution(line));
        });
    });
}

init(process.argv[2]);
