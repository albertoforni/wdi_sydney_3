window.onload = function(){

	// instances of view elements
	var guessesLeft = document.getElementById('guessesLeft'); 		// DOM 1
	var guessedLetters = document.getElementById('guessedLetters');	// DOM 2
	var letterField = document.getElementById('letterField');		// DOM 3
	var giveUpButton = document.getElementById('giveUpButton'); 	// DOM 4
	var resetButton = document.getElementById('resetButton'); 		// DOM 5

	var secretWord = ""; // input is sample word from wordList array (use 'underscorejs.org' _.sample([1,2,3]);

	// object 'word' containing labels and properties
	var word = {
		secretWord: "", // word.secretWord;
	  	wordList: ['ruby', 'rails', 'javascript', 'array', 'hash', 'underscore', 'sinatra', 'model', 'controller', 'view', 'devise', 'authentication', 'capybara', 'jasmine', 'cache', 'sublime', 'terminal', 'system', 'twitter', 'facebook', 'function', 'google', 'amazon', 'development', 'data', 'design', 'inheritance', 'prototype', 'gist', 'github', 'agile', 'fizzbuzz', 'route', 'gem', 'deployment', 'database'],

	  	// call with word.setSecretWord();
		setSecretWord: function(){ 
		// this.secretWord = _.sample(word.wordList); // sets secret word of variable within parent

	  		// 1. select random word from word list sets secret word

		},

		checkLetters: function(guessedLetters){
			// 1. input validate array of strings (letters) from makeGuess function. use reg expression

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
	  	guessedLetters: [], // 1. updates with strings returned from checkLetters function (except underscores)

	  	// takes a new letter as input and updates the game
	  	makeGuess: function(letter){
	  		// 1. input is new letter user input from #letterField

		},

		// check if the player has won and end the game if so
		checkWin: function(wordString){

		},

		// check if the player has lost and end the game if so
		checkLose: function(wrongLetters){

		}
	};

	// object 'game' containing labels and properties
	var game = {
		// resets the game
	  	resetGame: function(){
			console.log('reset triggered');
	  	},

	  	// reveals the answer to the secret word and ends the game
	  	giveUp: function(){
			console.log('giveup triggered');
	  	},

	  	// update the display with the parts of the secret word guessed, the letters guessed, and the guesses remaining
	  	updateDisplay: function(secretWordWithBlanks, guessedLetters, guessesLeft){
			// 1. input is updated array of guessedLetters variable

			// 2. input is updated number from guessedLetters constant

			// 3. input is updated with strings returned from checkLetters function (including underscores)
	  	}
	};

  	game.resetGame();	// start a new game
  	// add event listener to #letterField to get guessed letters 
  	// letterField.addEventListener('keyup', makeGuess(letterField.value); 
  	// --> the above will not work as no value inputted on load

	letterField.addEventListener('keyup', function() { // anonymous function
		if (event.keyCode === 13) { // enter pressed
			console.log('enter pressed');
			player.makeGuess();
		}
	});
	
	// add event listener to #resetButton to reset the game when clicked
	resetButton.addEventListener('click', game.resetGame); 

	// add event listener to #giveUpButton to give up when clicked
	giveUpButton.addEventListener('click', game.giveUp); 

};

// NOTES:
// Structure - http://css-tricks.com/how-do-you-structure-javascript-the-module-pattern-edition/
