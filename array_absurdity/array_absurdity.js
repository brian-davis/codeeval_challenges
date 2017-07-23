function solution(line) {
    'use strict';
    var parts = line.split(';'),
        n = parseInt(parts[0], 10),
        arr = parts[1].split(',');
    for (var i = 0; i < n; i++) {
        var count = 0,
            current = arr[i];
        for (var j = 0; j < n; j++) {
            var current_comparison = arr[j];
            if (current === current_comparison) {
                count += 1;
            }
        }
        if (count > 1) {
            return current;
        }
    }
}

module.exports.solution = solution;

var fs = require('fs');
function init(file) {
    'use strict';
    fs.readFile(file, 'utf-8', function (err, data) {
        // prep the file data
        if (err) throw err;
        var lines = data.split('\n');
        lines.pop();

        // feed to solution line by line
        lines.forEach(function(line) {
        console.log(solution(line));
        });
    });
}

init(process.argv[2]);
