function solution (line) {
    var phonePad = { '0' : '0', '1' : '1', '2' : 'abc', '3' : 'def',
    '4' : 'ghi', '5' : 'jkl', '6' : 'mno', '7' : 'pqrs',
    '8' : 'tuv', '9' : 'wxyz' },
    digits = line.split(''),
    keys = [],
    i = 0;
    for (i; i < digits.length; i ++) {
        keys.push(phonePad[digits[i]].split(''));
    }
    var results = [];
    for (var p = 0;p<keys[0].length;p++) {
        for (var o = 0;o < keys[1].length; o ++) {
            for (var n = 0;n < keys[2].length; n ++) {
                for (var m = 0;m < keys[3].length; m ++) {
                    for (var l = 0;l < keys[4].length; l ++) {
                        for (var k = 0;k < keys[5].length; k ++) {
                            for (var j = 0;j < keys[6].length; j ++) {
                                results.push(keys[0][p] +
                                keys[1][o] +
                                keys[2][n] +
                                keys[3][m] +
                                keys[4][l] +
                                keys[5][k] +
                                keys[6][j]);
                            }
                        }
                    }
                }
            }
        }
    }
    return results.join(',');
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
