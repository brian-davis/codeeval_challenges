function solution(string) {
    'use strict';
    var wordToDigit = {
        zero: '0',
        one: '1',
        two: '2',
        three: '3',
        four: '4',
        five: '5',
        six:'6',
        seven: '7',
        eight: '8',
        nine: '9'
    }

    var result = [];
    var splitString = string.split(';');
    for (var i = 0; i < splitString.length; i++) {
        result.push(wordToDigit[splitString[i]]);
    }
    return result.join('');
}

// module.exports.solution = solution;

var fs = require('fs');
fs.readFileSync(process.argv[2])
  .toString()
  .split('\n')
  .forEach(function (line) {
    'use strict';
    if (line !== '') {
    console.log(solution(line));
  }
});
