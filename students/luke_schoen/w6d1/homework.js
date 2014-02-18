// Homework in Javascript:

// Currency Converter:
//     Find the exchange rate between dollars and pounds
//     Store the exchange rate in a variable
// Converting dollars to pounds:
//     Store a dollar amount into a variable.
//     Convert it to pounds and output "$NN is £NN".
// Converting pounds to dollars:
//     Now store a pound amount into a variable.
//     Convert it to dollar and output "£NN is $NN."
// Cleaning it up:
//     Can you make sure the output is only 2 decimal places?

// define object exchange with properties using constructor function
function Exchange(name, rate) {
	this.name = name;
	this.rate = rate;
}

// instantiate new exchange object
var aud = new Exchange("aud", 0.95); 	// property x in exchange
var pound = new Exchange("pound", 0.90); 	// property y in exchange
var nzd = new Exchange("nzd", 0.80); 	// property y in exchange

// conversion function
function Convert(amount, currencyFrom, currentTo) {
	if (currencyFrom === "aud" && currencyTo === "pound") {
		result = amount * aud.rate
		console.log("$" + amount + " is £" + (result.toFixed(2)));
	} else if (currencyFrom === "pound" && currencyTo === "aud") {
		result = amount * pound.rate
		console.log("£" + amount + " is $" + (result.toFixed(2)));
	} else if (currencyFrom === "aud" && currencyTo === "nzd") {
		result = amount * nzd.rate
		console.log("$" + amount + " is NZ" + (result.toFixed(2)));
	}


	  else {
		console.log("incorrect inputs, try again!");
	}
}

Convert(100, "aud", "pound")
Convert(100, "aud", "nzd")
Convert(100, "pound", "aud")
Convert(100, "pound", "nzd")
Convert(100, "nzd", "aud")
Convert(100, "nzd", "pound")

// Refactoring
//     Can you refactor the code so that it uses functions? Write a function dollarsToPounds that takes a dollar number as input and outputs a string of what the pound equivalent is.
//     Do the same for poundsToDollars
// Bonus points: add a converter for NZ dollars too.