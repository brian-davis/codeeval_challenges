function solution(line) {
    'use strict';
    function isLetter (char) { return char.match(/[a-z]/) !== null; }

    var lowercaseChars = line.toLowerCase()
                             .split('')
                             .filter(isLetter);
    var frequencies = {},
        c = '',
        values = [];

    for(var i = 0; i < lowercaseChars.length; i++) {
        c = lowercaseChars[i];
        if (typeof frequencies[c] === 'undefined') {
            frequencies[c] = 0;
        }
        frequencies[c] += 1;
    }

    values = Object.keys(frequencies).map(function (key) {
        return frequencies[key];
    });

    values = values.sort().reverse();

    var alphaValues = [];
    for (var k = 26; k > 0; k--) { alphaValues.push(k) }

    var alphaMap = [];
    for (var l = 0; l < values.length; l ++) {
        alphaMap.push(values[l] * alphaValues[l]);
    }

    var total = alphaMap.reduce(function(a, b) {
        return a + b;
    });

    return total;
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
