// http://stackoverflow.com/questions/1985260/javascript-array-rotate
Array.prototype.rotate = (function() {
    'use strict';
    var unshift = Array.prototype.unshift,
        splice = Array.prototype.splice;
    return function(count) {
        var len = this.length >> 0,
        count = count >> 0;
        unshift.apply(this, splice.call(this, count % len, len));
        return this;
    };
})();

function solution(line) {
    'use strict';
    var splitLine = line.split(','),
        n = splitLine[0],
        m = splitLine[1],
        nums = [],
        memo = [],
        i = 0,
        j = 1;
    for (i; i < n; i ++) {
        nums.push(i);
    }
    for (j; j <= nums.length * n; j ++) {
        nums = nums.rotate(m - 1);
        memo.push(nums.shift());
    }
    return memo.join(' ');
}

// node, mocha
module.exports.solution = solution;

// codeeval filesystem interface
var fs = require('fs');
function init(file) {
    'use strict';
    fs.readFile(file, 'utf-8', function (err, data) {
        // prep the file data
        if (err) throw err;
        var lines = data.split("\n");
        lines.pop();

        // feed to solution line by line
        lines.forEach(function (line) {
            console.log(solution(line));
        });
    });
}

init(process.argv[2]);
