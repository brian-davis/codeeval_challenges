// helper functions
function swap (items, firstIndex, secondIndex) {
    var temp = items[firstIndex];
    items[firstIndex] = items[secondIndex];
    items[secondIndex] = temp;
}

function bubbleSort (items) {
    var size = items.length,
        i,
        j,
        stop;
    for (i = 0; i < size; i ++){
        for (j = 0, stop=size - i; j < stop  - 1; j ++){
            if (items[j][1] > items[j + 1][1]){
                swap(items, j, j + 1);
            }
        }
    }
    return items;
}

// main function
function solution(line) {
    var scramble = line.split(';')[0].split(' '),
        key = line.split(';')[1].split(' '),
        combined = [],
        keys = [],
        missingNumber = 0;
    for (var i = 0; i < key.length; i ++) {
        key[i] = parseInt(key[i], 10);
    }
    for (var j = 1; j <= scramble.length; j ++) {
        if (key.indexOf(j) === -1) {
            missingNumber = j;
        }
    }
    for (var k = 0; k < scramble.length; k ++) {
        combined.push([scramble[k], key[k]]);
    }
    combined.forEach(function (pair) {
        if (pair[1] === undefined) {
            delete pair[1];
            pair[1] = missingNumber;
        }
    });
    bubbleSort(combined).forEach(function (pair) {
        keys.push(pair[0]);
    });
    return keys.join(' ');
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
