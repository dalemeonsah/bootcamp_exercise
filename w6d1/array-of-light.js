function arrayOfLight(x) {
  if(x < 0){
    console.log('not a positive number')
  }
  else {
    var array = [];
    for(var i = 0; i <= x; i++){
      array.push(i)
    }
    return array;
  }
}

console.log(arrayOfLight(2))
console.log(arrayOfLight(3))
console.log(arrayOfLight(4))
console.log(arrayOfLight(5))