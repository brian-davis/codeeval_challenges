function solution(line) {
    var parts = line.split(') ('),
        coord1 = parts[0].replace('(',''),
        coord2 = parts[1].replace(')',''),
        coord1_parts = coord1.split(', '),
        coord2_parts = coord2.split(', '),
        h_distance = 0,
        v_distance = 0;
    coord1 = [Number(coord1_parts[0]), Number(coord1_parts[1])];
    coord2 = [Number(coord2_parts[0]), Number(coord2_parts[1])];
    h_distance = coord1[0] - coord2[0];
    v_distance = coord1[1] - coord2[1];
    return Math.sqrt(Math.pow(h_distance, 2) +
                     Math.pow(v_distance, 2));
}

module.exports.solution = solution;

var fs = require('fs');
function init(file) {
    'use strict';
    fs.readFile(file, 'utf-8', function (err, data) {
        // prep the file data
        if (err) throw err;
        var lines = data.split('\n');
        lines.pop();

        // feed to solution line by line
        lines.forEach(function(line) {
            console.log(solution(line));
        });
    });
}

init(process.argv[2]);
