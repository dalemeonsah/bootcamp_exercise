// console.log(process.argv);
var arrLength = process.argv.length;
if (arrLength > 2){
  var total = 0;
  for(var i = 2; i < arrLength; i++){
    total += +process.argv[i];
  }
  console.log(total);
}