function swap_numbers(str) {
    'use strict';
    var words = str.split(' ').map(function (word) {
        var n1 = word.match(/^[0-9]/);
        var n2 = word.match(/[0-9]$/);
        var content = word.slice(1, word.length-1);
        return n2 + content + n1;
    });
    return words.join(' ');
}

// module.exports.swap_numbers = swap_numbers;

var fs = require('fs');
fs.readFileSync(process.argv[2])
  .toString()
  .split('\n')
  .forEach(function (line) {
    'use strict';
    if (line !== '') {
    console.log(swap_numbers(line));
  }
});
