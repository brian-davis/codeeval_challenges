function solution(line) {
    "use strict";
    var changeTable = { 'PENNY' : 0.01, 'NICKEL' : 0.05, 'DIME' : 0.10,
                        'QUARTER' : 0.25, 'HALF DOLLAR' : 0.50, 'ONE' : 1.00,
                        'TWO' : 2.00, 'FIVE' : 5.00, 'TEN' : 10.00,
                        'TWENTY' : 20.00, 'FIFTY' : 50.00,
                        'ONE HUNDRED' : 100.00 },
        sortedChangeTable = [],
        parseLine = line.split(';'),
        price = parseFloat(parseLine[0]),
        payment = parseFloat(parseLine[1]),
        madeChange = [],
        i = 0,
        coin;

    for (coin in changeTable) {
        if (changeTable.hasOwnProperty(coin)) {
            sortedChangeTable.push([coin, changeTable[coin]]);
        }
    }
    sortedChangeTable = sortedChangeTable.reverse();

    if (payment < price) {
        return "ERROR";
    } else if (payment == price) {
        return "ZERO";
    } else {
        return findChange(price, payment);
    }

    function findIndex(arr, n) {
        for (i; i<arr.length; i++) {
            if (arr[i][1] <= n) {
                return i;
            }
        }
    }

    function findChange(price, payment) {
        var difference = (payment - price).toFixed(2),
            largestUnitLookup = findIndex(sortedChangeTable, difference),
            largestUnit = sortedChangeTable[largestUnitLookup][0],
            largestUnitValue = sortedChangeTable[largestUnitLookup][1];
        madeChange.push(largestUnit);
        payment = (payment - largestUnitValue).toFixed(2);
        if (payment != price) { findChange(price, payment); }
        return madeChange.join(',');
    }
}

module.exports.solution = solution;

var fs = require('fs');
    function init(file) {
        'use strict';
        fs.readFile(file, 'utf-8', function (err, data) {
        // prep the file data
        if (err) throw err;
        var lines = data.split("\n");
        lines.pop();

        // feed to solution line by line
        lines.forEach(function(line) {
            console.log(solution(line));
        });
    });
}

init(process.argv[2]);
