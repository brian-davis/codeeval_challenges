function solution(line) {
    'use strict';
    var numbers = line.split(' '),
        count = 1,
        result = [],
        i = 0;
    for (i; i < numbers.length; i++) {
        if (numbers[i] === numbers[i + 1]) {
            count ++;
        } else {
            result.push(count);
            result.push(numbers[i]);
            count = 1;
        }
    }
    return result.join(' ');
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