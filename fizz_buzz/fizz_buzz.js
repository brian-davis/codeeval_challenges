function solution(line) {
    'use strict';
    var threeArgs = line.split(' '),
        a = threeArgs[0],
        b = threeArgs[1],
        n = threeArgs[2],
        results = [],
        j = 1;
    for (j; j <= n; j ++) {
        if ((j % parseInt(a)) === 0) {
            if ((j % parseInt(b)) === 0) {
                results.push('FB');
            } else {
                results.push('F');
            }
        }
        else if ((j % b) === 0) {
            results.push('B');
        }
        else {
            results.push(j.toString());
        }
    }
    return results.join(' ');
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
