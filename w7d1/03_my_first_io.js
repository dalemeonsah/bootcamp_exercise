var fs = require('fs');
//to read a file
// var buf = fs.readFileSync('/vagrant/work/bootcamp_exercise/w7d1/03_text.txt');//return a buffer object
var buf = fs.readFileSync(process.argv[2]);//return a buffer object
var str = buf.toString();//buffer converted to strings
//console.log(str);

var count = str.split('\n').length - 1;
console.log(count);