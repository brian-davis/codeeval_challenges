function solution(line) {
    'use strict';
    var elements = line.split(',');
    var uniq = [];
    elements.forEach(function (el) {
        if (uniq.indexOf(el) === -1) {
            uniq.push(el);
        }
    });
    var result = uniq.join(',');
    return result;
}

// module.exports.solution = solution;

var fs = require('fs');
function init(file) {
    'use strict';
    fs.readFile(file, 'utf-8', function (err, data) {
        // prep the file data
        if (err) throw err;
        var lines = data.split('\n');
        // feed to solution line by line
        lines.forEach(function(line) {
            console.log(solution(line));
        });
    });
}

init(process.argv[2]);
