### Movies
* Name: Movies App

###Summary

Create an app that renders a basic form with a text input. When the user type in a movie name and submit the form the app will retreive JSON information using the OMDb API and render it on the page.

* http://omdbapi.com/

###HTTParty example usage

* HTTParty.get(http://www.omdbapi.com/?t=jaws)

#Prerequisites:
- Ruby
- Sinatrat
- ERB
- HTML Forms
- active_support
- HTTParty
- JSON

###extension 1

Instead of returning a single title the OMDb API allows you to do a search whichs returns multiple titles. For example searching for Jaws may return a list:

* Jaws
* Jaws 2
* Jaws 3-D
* Jaws Special
* Jaws Wired Shut 

So update your app so when the user type in a title it shows a list of results that the user can click into to view the details of that movie


