function solution(line) {
    'use strict';
    var digits = line.split(''),
        n = digits.length,
        sumOfNthPowersOfDigits = 0,
        comparison = parseInt(line, 10);
    digits.forEach(function (entry) {
        var a = Math.pow(parseInt(entry, 10), n);
        sumOfNthPowersOfDigits += a;
    });
    if (comparison === sumOfNthPowersOfDigits) { return "True"; }
    return "False";
}

module.exports.solution = solution;

var fs = require('fs');
fs.readFileSync(process.argv[2])
    .toString()
    .split('\n')
    .forEach(function (line) {
        'use strict';
        if (line !== "") {
            console.log(solution(line));
        }
    });
