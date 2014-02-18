// INSTRUCTIONS
// ENTER VALUE ONLY OF START STOP AND STOP STOP IN tripStops
// THEN COPY AND PASTE INTO GOOGLE INSPECT ELEMENT CONSOLE AND RUN 
// CONSOLE WILL RETURN INDEX OF START AND STOP INDEXES AND THE NUMBER OF STOPS BETWEEN THEM
// ONLY WORKS FOR SINGLE Line

function searchStops (input, array) { // search array
	for(var i=0;i<array.length;i++) {
		alert(i);
	    if(array[i]===input) {
	        console.log(i); // return array index of match
	        return i;
	    }
	}
};

// instantiate new Line object hash of arrays
var lineHash = {
	"n": ["Time Square", "34th", "28th", "23rd", i, "8th"],
	"l": ["8th", "6th", i, "3rd", "1st"],
	"s": ["Grand Central", "33rd", "28th", "23rd", i, "Astor Place"]
}; 

// user inputs hard coded
var tripStops = {	"start": {"n": "23rd"},
					"stop": {"n": "34th"}
};

countStops(tripStops.start.n,tripStops.stop.n); // call countStops function passing start/stop

function countStops (start, stop) {
	var startLine = tripStops.start; // returns n
	var startStop = start; // returns hash start key's hash value (i.e. 34th)
	var stopLine = tripStops.stop; // returns n
	var stopStop = stop; // returns hash stop key's hash value (i.e. 34th)
	startStop.indexOf(tripStops.start.n); // returns 0 (true) if starting stop (else -1)
	var startIndex = searchStops(startStop,lineHash.n); // search lineHash n for index of startStop
	var stopIndex = searchStops(stopStop,lineHash.n); // search lineHash n for index of stopStop
	var countStops = Math.abs(stopIndex - startIndex); // absolute value of difference b/w indexes
	return countStops;
};