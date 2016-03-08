var text = document.getElementById('text');
var text2 = document.getElementById('text-2');
//1.
text2.addEventListener("keypress", function(event){
  // shift key does not trigger keypress event
  //console.log(event);
  if (event.shiftKey) {
    console.log('shift key press');
  }
})
//2. 
text2.addEventListener("keydown", function(event){
  // shift key does not trigger keypress event
  if (event.shiftKey) {
    console.log("shift key down")
    console.log(event);
  }
})

// delete does not trigger either events

//3.
text2.addEventListener("keyup", function(event){
    console.log(event);
})
// keyup even triggered when move from text to text2 with tab

//4
text2.addEventListener("focus", function(event){
    console.log(event);
})