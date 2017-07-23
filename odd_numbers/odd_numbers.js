function solution() {
    'use strict';
    var result = [];
    for (var i = 1; i < 100; i++) {
      if (i % 2 !== 0) {
        result.push(i);
      }
    }
    return result;
}

// module.exports.solution = solution;
var result = solution();
for (var i = 0; i < result.length; i ++) {
  console.log(result[i]);
}
