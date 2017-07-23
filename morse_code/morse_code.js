function solution (line) {
    'use strict';
    var morseKey = { '.-' : 'A', '-...' : 'B', '-.-.' : 'C', '-..' : 'D', '.' : 'E',
                     '..-.' : 'F', '--.' : 'G', '....' : 'H', '..' : 'I',
                     '.---' : 'J', '-.-' : 'K', '.-..' : 'L', '--' : 'M',
                     '-.' : 'N', '---' : 'O', '.--.' : 'P', '--.-' : 'Q',
                     '.-.' : 'R', '...' : 'S', '-' : 'T', '..-' : 'U', '...-' : 'V',
                     '.--' : 'W', '-..-' : 'X', '-.--' : 'Y', '--..' : 'Z',
                     '.----' : '1', '..---' : '2', '...--' : '3', '....-' : '4',
                     '.....' : '5', '-....' : '6', '--...' : '7', '---..' : '8',
                     '----.' : '9', '-----' : '0' },
        results = [],
        words = line.split('  ');
    words.forEach(function (w) {
        var wordResult = '',
            chars = w.split(' ');
        chars.forEach(function (c) { wordResult += morseKey[c]; });
        results.push(wordResult);
    });
    return results.join(' ');
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
