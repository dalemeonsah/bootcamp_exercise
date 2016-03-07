// var mySuperAwesomeVariableName = "Ted Mosby";
// mySuperAwesomeVariableName = "BATMAN!";
// console.log(mySuperAwesomeVariableName);

// Why does this fail?
var a = 0;

if (a == 1) {
    console.log("I Shouldn't be in here!");
} else {
    console.log("I Should be in here!");    
}

// What's missing? How does JS interpret empty line endings? ANSWER: must use \ 

// var bad  = '<ul id="myId"> \
//                <li>some text</li> \
//                <li>more text</li> \
//             </ul>'; 

// Why does the 
//if go off and not the switch?

// var myVar = 5;

// if(myVar == '5')
// { 
//   alert("If Alert");  
// }

// switch(myVar)
// {
//   case '5': ---------> because case was a string, not a number
//   alert("Switch Alert"); 
// }