// DETECTING CYCLES
// SPONSORING COMPANY:

// CHALLENGE DESCRIPTION:


// Given a sequence, write a program to detect cycles within it.

// INPUT SAMPLE:

// Your program should accept as its first argument a path to a filename containing a sequence of numbers (space delimited). The file can have multiple such lines. E.g

// 2 0 6 3 1 6 3 1 6 3 1
// 3 4 8 0 11 9 7 2 5 6 10 1 49 49 49 49
// 1 2 3 1 2 3 1 2 3
// OUTPUT SAMPLE:

// Print to stdout the first cycle you find in each sequence. Ensure that there are no trailing empty spaces on each line you print. E.g.

// 6 3 1
// 49
// 1 2 3
// The cycle detection problem is explained more widely on wiki 
// Constrains: 
// The elements of the sequence are integers in range [0, 99] 
// The length of the sequence is in range [0, 50]


var fs = require('fs');
function init(file) {
  // prep the file data
  fs.readFile(file, 'utf-8', function (err, data) {
    if (err) throw err;
    lines = data.split('\n');
    lines.pop();

  // feed to solution line by line
    lines.forEach(function(line) {
      console.log(solution(line));
    });
  });
}

init(process.argv[2]);

function solution(line) {
  var arr = line.split(' ');
  for (var i = 1; i < (arr.length / 2); i++) {
    // console.log('cycle length: ' + i);
    var last_chunk = arr.slice((i * -1));
    // console.log('last chunk: ');
    // console.log(last_chunk);
    var second_to_last_chunk = arr.slice((i * -2)).slice(0,i);
    // console.log('2nd chunk: ');
    // console.log(second_to_last_chunk);
    if (second_to_last_chunk.join(' ') ==
        last_chunk.join(' ')) {
      return second_to_last_chunk.join(' ');
    }
  }
}
