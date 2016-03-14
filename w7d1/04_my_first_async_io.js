var fs = require('fs');
var buf = fs.readFile(process.argv[2], function readSuccess(err, data){
  if(err) return console.error(err);
  else {
    var str = data.toString();
    var count = str.split('\n').length - 1;
    console.log(count);
  }
});

// Official answer
// var fs = require('fs')
//     var file = process.argv[2]
    
//     fs.readFile(file, function (err, contents) {
//       // fs.readFile(file, 'utf8', callback) can also be used
//       var lines = contents.toString().split('\n').length - 1
//       console.log(lines)
//     })