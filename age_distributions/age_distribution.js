function solution(line) {
    'use strict';
    var n = Number(line)
    if      ((n >= 0) && (n <= 2)) { return "Still in Mama's arms" }
    else if ((n >= 3) && (n <= 4)) { return "Preschool Maniac" }
    else if ((n >= 5) && (n <= 11)) { return "Elementary school" }
    else if ((n >= 12) && (n <= 14)) { return "Middle school" }
    else if ((n >= 15) && (n <= 18)) { return "High school" }
    else if ((n >= 19) && (n <= 22)) { return "College" }
    else if ((n >= 23) && (n <= 65)) { return "Working for the man" }
    else if ((n >= 66) && (n <= 100)) { return "The Golden Years" }
    else { return "This program is for humans" }
}

// module.exports.solution = solution;

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
