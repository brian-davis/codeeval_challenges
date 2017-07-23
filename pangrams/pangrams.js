function solution(line) {
    'use strict';
    var alphabet = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l',
                    'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x',
                    'y', 'z'];
    var lineCharacters = line.toLowerCase()
                             .split('')
                             .filter(function (c) {
                               return c.match(/[a-z]/);
                             });
    var lineCharactersReverse = alphabet.filter(function (l) {
      return (lineCharacters.indexOf(l) === -1);
    });
    var joined = lineCharactersReverse.join('');
    return (joined.length === 0) ? 'NULL' : joined;
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
