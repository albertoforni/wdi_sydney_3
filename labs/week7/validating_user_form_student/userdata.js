$(document).ready(function(){

  //This creates a user object (using Literal Notation)
  var user = {};

  //Store the appropriate items you will be selecting from the DOM into variables for easy usage
var userNameInput = ,
    userAgeInput = ,
    userPhoneInput = ,
    userEmailInput = ,
    userNameError = ,
    userAgeError = ,
    userPhoneError = ,
    userEmailError = ,
    addUserDataForm = ,
    displayData = ;

  // Initially hide the errors.
  // Check the HTML to see how to select all the items that are error messages.


  //Display function blanks out what is currently being displayed in the display_data area then displays the submitted user data as a list
  function display() {
  }

  //ADD_USER FORM SUBMIT EVENT FUNCTION
addUserDataForm.submit(function(){

    //Get values from user inputs
    var userNameVal = ;
    var userAgeVal = ;
    var userPhoneVal = ;
    var userEmailVal = ;

    // Validate the Name. It should return true if the name is greater than or equal 3 characters. If not, it should show the error and return false.
    function validateName() {
    }

    // Validate the Age. It should return true if the age is a number. If not, it should show the error and return false.
    function validateAge() {
    }

    // Validate the Phone Number. It should return true if the phone number matches the regular expression. If not, it should show the error and return false.
    function validatePhone() {
      var p = /^[0-9]+[0-9]+[0-9]+[_.-]+[0-9]+[0-9]+[0-9]+[_.-]+[0-9]+[0-9]+[0-9]+[0-9]$/; //This is a regular expression for a phone
      if(p.test(userPhoneVal)) {
      }
      else {
      }
    }

    // Validate the Email. It should return true if the email matches the regular expression. If not, it should show the error and return false.
    function validateEmail() {
      var e = /^[-a-z0-9~!$%^&*_=+}{\'?]+(\.[-a-z0-9~!$%^&*_=+}{\'?]+)*@([a-z0-9_][-a-z0-9_]*(\.[-a-z0-9_]+)*\.(aero|arpa|biz|com|coop|edu|gov|info|int|mil|museum|name|net|org|pro|travel|mobi|[a-z][a-z])|([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}))(:[0-9]{1,5})?$/; //This is a regular expression for email
      if(e.test(userEmailVal)) {
      }
      else {
      }
    }

    // If all of the items validate, you should update the name, age, phone and email of the user and display it
    if(validateName() & validateAge() & validatePhone() & validateEmail()) {
    }

    return false; //This stops the form from processing (page reload)
  });

  //Clear the object
  // Write a function so that when the clear button is clicked, any data being displayed is erased.


});