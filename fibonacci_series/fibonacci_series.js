function solution(n) {
    'use strict';
    if (n <= 0) {
        return 0;
    } else if (n == 1) {
        return 1;
    } else {
        return solution(n - 1) + solution(n - 2);
    }
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
