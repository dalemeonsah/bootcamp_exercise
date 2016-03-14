var fs = require('fs')
var path = require('path')

module.exports = function(dir, extStr, callback){
  
  fs.readdir(dir, function (err, list) {
    if(err) return callback(err);
    
    list = list.filter(function (file) {
      return path.extname(file) === '.' + extStr;
    });

    callback(null, list);
  })
}

//official answer

// var fs = require('fs')
//     var path = require('path')
    
//     module.exports = function (dir, filterStr, callback) {
    
//       fs.readdir(dir, function (err, list) {
//         if (err)
//           return callback(err)
    
//         list = list.filter(function (file) {
//           return path.extname(file) === '.' + filterStr
//         })
    
//         callback(null, list)
//       })
//     }