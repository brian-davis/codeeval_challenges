function solution(location, destination) {
    'use strict';
    var locX  = location[0],
        locY  = location[1],
        destX = destination[0],
        destY = destination[1],
        comparison = [destX - locX, destY - locY],
        compX = comparison[0],
        compY = comparison[1];

    if      (compX === 0  && compY >   0) { return 'N'; }
    else if (compX >   0  && compY >   0) { return 'NE'; }
    else if (compX >   0  && compY === 0) { return 'E'; }
    else if (compX >   0  && compY <   0) { return 'SE'; }
    else if (compX === 0  && compY <   0) { return 'S'; }
    else if (compX <   0  && compY <   0) { return 'SW'; }
    else if (compX <   0  && compY === 0) { return 'W'; }
    else if (compX <   0  && compY >   0) { return 'NW'; }
    else { return 'here'; }
}

// module.exports.solution = solution;

var fs = require('fs');
fs.readFileSync(process.argv[2])
  .toString()
  .split('\n')
  .forEach(function (line) {
    'use strict';
    if (line !== '') {
    var split = line.split(' ');
    var location = split.slice(0,2)
                        .map(function (n) { return parseInt(n) });
    var destination = split.slice(2)
                           .map(function (n) { return parseInt(n) });
    console.log(solution(location, destination));
  }
});