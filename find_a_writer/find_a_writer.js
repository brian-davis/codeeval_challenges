function solution(line) {
    'use strict';
    var split_line = line.split('| '),
        cipher = split_line[0],
        key = split_line[1],
        key_parts = [],
        memo = [];
    key.split(' ').forEach(function(k){
        key_parts.push(Number(k));
    });
    key_parts.forEach(function(n){
        memo.push(cipher[(n-1)]);
    });
    return memo.join('');
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