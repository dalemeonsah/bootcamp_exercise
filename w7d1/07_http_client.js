var http = require('http');
var url = process.argv[2];

http.get(url, function(response){
  response.on("data", function(data){
    console.log(data.toString());
  });
});

//Official answer
// var http = require('http')
    
//     http.get(process.argv[2], function (response) {
//       response.setEncoding('utf8')
//       response.on('data', console.log)
//       response.on('error', console.error)
//     })

//The response object / Stream that you 
//get from http.get() also has a setEncoding() method. 
//If you call this method with "utf8", 
//the "data" events will emit Strings rather than the standard Node Buffer objects 
//which you have to explicitly convert to Strings.