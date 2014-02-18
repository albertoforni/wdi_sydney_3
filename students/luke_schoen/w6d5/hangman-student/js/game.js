window.onload = function(){

	// instances of view elements
	var guessesLeft = document.getElementById('guessesLeft'); 		// DOM 1
	var guessedLetters = document.getElementById('guessedLetters');	// DOM 2
	var letterField = document.getElementById('letterField');		// DOM 3
	letterField.setAttribute('maxlength', "1"); // limit to single letter guess
	var giveUpButton = document.getElementById('giveUpButton'); 	// DOM 4
	var resetButton = document.getElementById('resetButton'); 		// DOM 5
	var wordString = document.getElementById('wordString');			// DOM 6
	var secretWordWithBlanks = [];

	//var secretWord = ""; // input is sample word from wordList array (use 'underscorejs.org' _.sample([1,2,3]);

	// object 'word' containing labels and properties
	var word = {
		secretWord: "", // word.secretWord;
		secretWordArray: [],
	  	wordList: ['ruby', 'rails', 'javascript', 'array', 'hash', 'underscore', 'sinatra', 'model', 'controller', 'view', 'devise', 'authentication', 'capybara', 'jasmine', 'cache', 'sublime', 'terminal', 'system', 'twitter', 'facebook', 'function', 'google', 'amazon', 'development', 'data', 'design', 'inheritance', 'prototype', 'gist', 'github', 'agile', 'fizzbuzz', 'route', 'gem', 'deployment', 'database'],

	  	// call with word.setSecretWord();
		setSecretWord: function(){ 
			// 1. select random word from word list sets secret word
			console.log("word list is: " + this.wordList);
			//this.secretWord = _.sample(this.wordList,1); // this does not work (weird!!)
			this.secretWord = (_.first(_.shuffle(this.wordList,1))).toUpperCase(); // sets random array element to secret
			console.log(_.isString(this.secretWord));
			console.log("secret word generated is: " + this.secretWord);
			this.secretWordArray = _.toArray(this.secretWord).slice(0); // converts string to array of letters starting first
			console.log("array of secret word is: " + this.secretWordArray);
			var secretWordCount = this.secretWordArray.length; // returns number of letters in word
			console.log("letter count of secret word is: " + secretWordCount);
			secretWordWithBlanks = _.range(secretWordCount); // create word with length of secret word count for initializing game
			secretWordWithBlanks.forEach(function(item, i) { if (item !== null) secretWordWithBlanks[i] = "_"; }); 
			// replace all elements in array with "_" underscore value
			console.log("secret word with blanks is: " + secretWordWithBlanks);

			return secretWordWithBlanks;

		},

		checkLetters: function(guessedLetters){
			console.log("guessed letters variable is: " + guessedLetters);
			var match = _.find(this.secretWordArray, function(letter){ return letter === guessedLetters; });
			var matchIndex = this.secretWordArray.indexOf(guessedLetters);
			//guessedLetters = "test";
			if (match !== undefined) {
				console.log("matched letter: " + match);
				console.log("matched index: " + matchIndex);
				console.log("secretWordArray is: " + this.secretWordArray);	
				console.log("secretWordWithBlanks is: " + secretWordWithBlanks);
				this.secretWordArray.forEach(function(item, j) { 
					console.log("current secretWordArray letter: " + item + " being compared with guessedLetters of: " + guessedLetters);
					if (item === guessedLetters) {					
						secretWordWithBlanks[j] = guessedLetters; 
					}
				});
				//_.map([1, 2, 3], function(num){ return num * 3; });
				console.log("new array after match is: " + secretWordWithBlanks);
				return true; // return true to makeGuessto indicate no change to guessesLeft
			} else {
				console.log("no match: " + match + matchIndex);
				return false; // return false to makeGuess to indicate reduce guessesLeft
			}
			// 2. compare input array against the secret word 
			//_.contains('');

			// 3. return array of strings. letters for correct guesses, underscores for incorrect
			
			//_.join('');
			//_.map('');
			//_.each('');

		}
	};

	// object 'player' containing labels and properties
	var player = {
		MAX_GUESSES: 8,
	  	guessedLettersArray: [], // 1. updates with strings returned from checkLetters function (except underscores)

	  	// takes a new letter as input and updates the game
	  	makeGuess: function(letter){
	  		// 1. input is new letter user input from #letterField
			var newGuess = letterField.value.toUpperCase();
			console.log(newGuess); // displays value entered into letterField after user presses 'enter' key
			
			player.guessedLettersArray.unshift(newGuess);
			
			if (word.checkLetters(newGuess) === false) { // if no letter match, reduce guessesLeft
				player.MAX_GUESSES -= 1;
				if (player.MAX_GUESSES === 0) {
					alert("Last Attempt!");
				}
			} 
			
			this.checkWin(); // check if all no more underscores is word indicating user has won

			game.updateDisplay(secretWordWithBlanks, player.guessedLettersArray, player.MAX_GUESSES);
		},

		// check if the player has won and end the game if so
		checkWin: function(){
			//var secretWordWithBlanksCount = this.secretWordWithBlanks.length; // returns number of letters in word
			//console.log("letter count of secret word with blanks is: " + secretWordWithBlanksCount);

			var countUnderscores = 1; // default is > 0
			var countUnderscoresArray = []; 
			secretWordWithBlanks.forEach(function(item, i) { if (item === "_") countUnderscoresArray[i] = "1"; }); 
			// count number of underscores left to guess and add to countUnderscoresArray
			countUnderscores = countUnderscoresArray.length; // check length of countUnderscoresArray, indicates how many guesses left
			if (countUnderscores === 0) {
				var countUnderscores = 1; // reset this value for next game
				letterField.value = null; // reset 
				alert("Congratulations, You WON!! Press any key to play again ...\nSecret word was: " + secretWordWithBlanks);
				if (event.keyCode === 13) { // add extra to account for pressing enter to restart reducing guesses immediately
					player.MAX_GUESSES = 9;
					game.resetGame();
				} else if (event.keyCode === 13 && window.onmousedown){		
					alert("not pressed enter key")			
					player.MAX_GUESSES = 8 // unsuccessful attempt to not compensate when click with mouse (also considered enter)
					game.resetGame();
				}
			}
			console.log("you have not won yet");
			console.log("secret word with blanks is: " + secretWordWithBlanks);

		},

		// check if the player has lost and end the game if so
		checkLose: function(wrongLetters){
			if (player.MAX_GUESSES === 0) { 
				letterField.value = null;
				alert("No more guesses! Press any key to restart ...");
				if (event.keyCode === 13) { // add extra to account for pressing enter to restart reducing guesses immediately
					player.MAX_GUESSES = 9;
					game.resetGame();
				} else if (event.keyCode === 13 && window.onmousedown){		
					alert("not pressed enter key")			
					player.MAX_GUESSES = 8 // unsuccessful attempt to not compensate when click with mouse (also considered enter)
					game.resetGame();
				};
			};
		}
	};

	// object 'game' containing labels and properties
	var game = {
		// resets the game
	  	resetGame: function(){
			player.guessedLettersArray = [];
			guessedLetters.innerHTML = 0;
			letterField.value = null;
			console.log('reset triggered');
			// add event listener to #letterField to get guessed letters 
	  		// letterField.addEventListener('keyup', makeGuess(letterField.value); 
	  		// --> the above will not work as no value inputted on load
			game.updateDisplay(word.setSecretWord(), 0, player.MAX_GUESSES); // init set random secret word and display it 
			return true;
	  	},

	  	// reveals the answer to the secret word and ends the game
	  	giveUp: function(){
			console.log('giveup triggered');
			game.updateDisplay(word.secretWordArray, 0, player.MAX_GUESSES); 
			alert("It's tough isn't it. We've revealed the solution for you. Press any key to try again ...");
			game.resetGame();
	  	},

	  	// update the display with the parts of the secret word guessed, the letters guessed, and the guesses remaining
	  	updateDisplay: function(secretWordWithBlanks, guessedLettersNow, guessesLeftNow){
			// 1. output is initial secretWordWithBlanks
			console.log("in update display with inputs: " + secretWordWithBlanks + guessedLetters + guessesLeft);
			console.log(_.isString(guessedLetters));
			wordString.innerHTML = secretWordWithBlanks;
			guessedLetters.innerHTML = guessedLettersNow;
			guessesLeft.innerHTML = guessesLeftNow;
			letterField.value = null; // after display new letter test in lettersGuessed, reset the field to blank for next entry

			// 2. input is updated array of guessedLetters variable

			// 3. input is updated number from guessedLetters constant

			// 4. input is updated with strings returned from checkLetters function (including underscores)
			
	  	}
	};

	// run this initialisation on window load or user request to reset game
	game.resetGame();	// start a new game
	
	console.log("initial display shown, enter letter guess!"); 

	letterField.addEventListener('keyup', function() { // anonymous function
		if (event.keyCode === 13) { // enter pressed
			if (!(letterField.value.toLowerCase().match(/[a-z]/))) { 
				console.log("no letter detected: " + guessedLetters);
				letterField.value = null;
				return false;			
			} else {
				console.log("letter detected: " + letterField.value);
				console.log('enter pressed');
				if (player.MAX_GUESSES > 0) {
					player.makeGuess();
				} else { // check if no more guesses left causing them to lose
					player.checkLose();
				}	
			};	

		}
	});
	
	// add event listener to #resetButton to reset the game when clicked
	resetButton.addEventListener('click', game.resetGame); 

	// add event listener to #giveUpButton to give up when clicked
	giveUpButton.addEventListener('click', game.giveUp); 

};

// NOTES:
// Structure - http://css-tricks.com/how-do-you-structure-javascript-the-module-pattern-edition/
