function solution(line) {
    'use strict';
    var matches = { '{': '}', '[': ']', '(': ')' };
    if (line.length === 1) {
        return false;
    }
    var half_length = line.length / 2;
    var left_half = line.slice(0, half_length).split('');
    // console.log("LEFT_HALF: " + left_half);
    var right_half = line.slice(half_length).split('');
    // console.log("RIGHT_HALF: " + right_half);
    // var right_half_reverse = right_half.reverse();
    // console.log("RIGHT_HALF_REVERSE: " + right_half_reverse);
    for (var i = 0; i < left_half.length; i ++) {
        var current_character = left_half[i];
        // console.log("left_half[" + i + "]" + current_character);
        var match = matches[current_character];
        // console.log("MATCH: " + match);
        var current_comparison_character = right_half[i]; //why is this reversed?
        // console.log("right_half[" + i + "]" + current_comparison_character);
        if ( current_comparison_character !== match) {
            return false;
        }
    }
    return true;
}

// module.exports.solution = solution;

var fs = require('fs');
fs.readFileSync(process.argv[2])
  .toString()
  .split('\n')
  .forEach(function (line) {
      'use strict';
      if (line !== '') {
          solution(line) ? console.log('True') : console.log('False');
      }
  });
