var fs = require('fs');
var path = require('path');
var dir = process.argv[2];
var fileExtension = '.' + process.argv[3];

fs.readdir(dir, function successDir(err, list){
  if(err) return console.error(err);
  else{
    for(var i = 0; i < list.length - 1; i++){
      if(path.extname(list[i]) == fileExtension){
        console.log(list[i]);
      }
    }
  }
});

// Official answer
// var fs = require('fs')
//     var path = require('path')
    
//     fs.readdir(process.argv[2], function (err, list) {
//       list.forEach(function (file) {
//         if (path.extname(file) === '.' + process.argv[3])
//           console.log(file)
//       })
//     })