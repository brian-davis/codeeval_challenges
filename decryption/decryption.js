Array.prototype.each_slice = function (size, callback){
    for (var i = 0, l = this.length; i < l; i += size){
        callback.call(this, this.slice(i, i + size));
    }
};

function solution() {
    var message_words = "012222 1114142503 0313012513 03141418192102 0113 2419182119021713 06131715070119".split(' '),
        keyed_alphabet = "BHISOECRTMGWYVALUZDNFJKPQX",
        alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
        mapped_message = [],
        i = 0;

    for (i; i < message_words.length; i++) {
        var slices = [],
            slice_map = '',
            j = 0;
        message_words[i].split('').each_slice(2, function (slice){
            slices.push(Number(slice.join('')));
        });
        for (j; j < slices.length; j++) {
            slice_map += alphabet[keyed_alphabet.split('').indexOf(alphabet[slices[j]])];
        }
        mapped_message.push(slice_map);
    }
    return mapped_message.join(' ');
}

// node, mocha
module.exports.solution = solution;

console.log(solution());
