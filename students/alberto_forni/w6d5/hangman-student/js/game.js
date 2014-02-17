var word = {
  secretWord: "",
  wordList: ['ruby', 'rails', 'javascript', 'array', 'hash', 'underscore', 'sinatra', 'model', 'controller', 'view', 'devise', 'authentication', 'capybara', 'jasmine', 'cache', 'sublime', 'terminal', 'system', 'twitter', 'facebook', 'function', 'google', 'amazon', 'development', 'data', 'design', 'inheritance', 'prototype', 'gist', 'github', 'agile', 'fizzbuzz', 'route', 'gem', 'deployment', 'database'],

  // Selects a random word from the word list sets the secret word
  setSecretWord: function(){
    this.secretWord = _.sample(this.wordList);
  },

  // Takes an array of letters as input and returns an array of two items:
  // 1) A string with the parts of the secret word that have been guessed correctly and underscore for the parts that haven't
  // 2) An array of all the guessed letters that were not in the secret word
  checkLetters: function(guessedLetters){
    var stringArray = this.secretWord.split("");
    var match = _.map(stringArray, function(letter) {
      var IsGuessLetterInWord = _.contains(guessedLetters, letter);
      if (IsGuessLetterInWord) {
        return letter;
      } else {
        return '_';
      }
    }).join('');

    var noMatch = _.difference(guessedLetters, stringArray);

    return [match, noMatch];
  }
};

var player = {
  MAX_GUESSES: 8,
  guessedLetters: [],
  allLetters: [],

  // Takes a new letter as input and updates the game
  makeGuess: function(letter){
    if (typeof letter === 'undefined') return

    this.allLetters.push(letter);
    var response = word.checkLetters(this.allLetters);

    this.guessedLetters = response[1];
    var secretWordWithBlanks = response[0];

    var guessesLeft = this.MAX_GUESSES - this.guessedLetters.length;

    this.checkWin(secretWordWithBlanks);
    this.checkLose(this.guessedLetters);


    game.updateDisplay(secretWordWithBlanks, this.guessedLetters.join(" "), guessesLeft);
  },

  // Check if the player has won and end the game if so
  checkWin: function(wordString){
    if (wordString === word.secretWord) {
      alert ("You win!!!");
      game.resetGame();
    }
  },

  // Check if the player has lost and end the game if so
  checkLose: function(wrongLetters){
    if (wrongLetters.length === this.MAX_GUESSES) {
      alert ("You lose!!! The word was " + word.secretWord);
      game.resetGame();
    }
  }
};

var game = {
  // Resets the game
  resetGame: function(){
    word.setSecretWord();
    player.guessedLetters = [];
    player.allLetters = [];
    this.updateDisplay("", "", player.MAX_GUESSES);
  },

  // Reveals the answer to the secret word and ends the game
  giveUp: function(){
    alert("The solution is " + word.secretWord);
    this.resetGame();
  },

  // Update the display with the parts of the secret word guessed, the letters guessed, and the guesses remaining
  updateDisplay: function(secretWordWithBlanks, guessedLetters, guessesLeft){
    document.getElementById("guessesLeft").textContent = guessesLeft;
    document.getElementById("guessedLetters").textContent = guessedLetters;
    document.getElementById("wordString").textContent = secretWordWithBlanks;
  }
};

window.onload = function(){
  // Start a new game
  word.setSecretWord();
  // Add event listener to the letter input field to grab letters that are guessed
  var input = document.getElementById("letterField");
  input.addEventListener('keyup', function(e) {
    player.makeGuess(e.target.value[0]);
    input.value = '';
  });

  // Add event listener to the reset button to reset the game when clicked
  var resetButton = document.getElementById("resetButton");
  resetButton.addEventListener('click', function(e) {
    game.resetGame();
  });

  // Add event listener to the give up button to give up when clicked
  var giveup = document.getElementById("giveUpButton");
  giveup.addEventListener('click', function(e) {
    game.giveUp();
  });
};