// REFERENCE DATA
// instantiate new Line object hash of arrays
var lines = {
    n: ["Time Square", "34th", "28th", "23rd", "Union Square", "8th"],
    l: ["8th", "6th", "Union Square", "3rd", "1st"],
	s: ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"]
}; 

var intersection = "Union Square";

// FUNCTIONS
function alert(thing) {
    console.log(thing);
}
function searchStops(input, array) { // search array
    alert("in search stops");
    alert("input is: " + input + " array is: " + array);
	for(var i=0;i<array.length;i++) {
		alert(i);
	    if(array[i]===input) {
	        console.log(i); // return array index of match
	        return i;
	    }
	}
}

function intersectionIndex(line, intersect) { // search array
	alert("line is: " + line + " intersect is: " + intersect);
	for(var i=0;i<lines[line].length;i++) {
		alert(i);
	    if(lines[line][i]===intersect) {
	        console.log(i); // return index of intersect match on line
	        return i;
	    }
	}
}

function countStops(startChoice, finishChoice) { // inputs contain hash of tripStops start and stop keys

	var startLine = startChoice.line;
	var finishLine = finishChoice.line;
	var startStop = startChoice.stop; // returns hash start key's hash value (i.e. 34th)
	var finishStop = finishChoice.stop; // returns hash stop key's hash value (i.e. 34th)
	alert("before searchstops");
	var startIndex = searchStops(startStop,lines[startLine]); // search lineHash n for index of startStop
	alert("made it past searchstops");
    alert("i got start index of: " + startIndex);
	var finishIndex = searchStops(finishStop,lines[finishLine]); // search lineHash n for index of stopStop
    alert("i got finish index of: " + finishIndex);

	if (startLine === finishLine) {
		// refactor below with getIndexOf method
		return Math.abs(finishIndex - startIndex); // absolute value of difference b/w indexes
	} else { // different lines
		var startIntersectionIndex = intersectionIndex(startLine,intersection);
		var finishIntersectionIndex = intersectionIndex(finishLine,intersection);
		var countStopsLeg1 = Math.abs(startIntersectionIndex - startIndex); 
		var countStopsLeg2 = Math.abs(finishIntersectionIndex - finishIndex); 
		return countStopsLeg1 + countStopsLeg2;
	}
}


// TEST 1
// user inputs hard coded
var tripStops = {    start:  { line: "n", stop: "23rd" },
					finish: { line: "n", stop: "34th" }
};

var result = countStops(tripStops.start,tripStops.finish); // call countStops function passing predefined start/stop locations
console.log("and the result is: " + result);


// TEST 2
// user inputs hard coded
var tripStops = {    start:  { line: "n", stop: "23rd" },
    				finish: { line: "s", stop: "33rd" }
};

var result = countStops(tripStops.start,tripStops.finish); // call countStops function passing predefined start/stop locations
console.log("and the result is: " + result);


// TEST 3
// user inputs hard coded
var tripStops = {    start:  { line: "s", stop: "Grand Central" },
    				finish: { line: "n", stop: "8th" }
};

var result = countStops(tripStops.start,tripStops.finish); // call countStops function passing predefined start/stop locations
console.log("and the result is: " + result);