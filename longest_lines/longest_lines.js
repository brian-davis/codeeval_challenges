var fs = require('fs');

function swap(items, firstIndex, secondIndex){
  var temp = items[firstIndex];
  items[firstIndex] = items[secondIndex];
  items[secondIndex] = temp;
}

function bubbleSort(items){
  var size = items.length;
  var i;
  var j;
  var stop;

  for (i=0; i < size; i++){
      for (j=0, stop=size-i; j < stop -1; j++){
          if (items[j].length < items[j+1].length){
              swap(items, j, j+1);
          }
      }
  }
  return items;
}

fs.readFile(process.argv[2], 'utf-8', function (err, data) {
  if (err) throw err;
  var lines = data.split('\n');
  lines.pop();
  var n = lines.shift();
  lines = bubbleSort(lines);
  var longest = lines.slice(0,n);
  longest.forEach(function(line){
    console.log(line);
  });
});
