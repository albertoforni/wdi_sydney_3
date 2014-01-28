***** Homework

Rebuild HappiTails in Sinatra+Active Record

Your app should have all the correct tables and classes.
It won't need any of the other functionality from your old app.

Rebuild (in sinatra) the following functionality:
1) a page that lists all the shelters
2) clicking on a shelter will take you to the shelter's "show" page that will let you see the details for that shelter.
3) At the top of the shelter's "show" page is a button "donate pet"
4) clicking that button takes you to a form that lets you fill in the details of a pet - and if you hit "submit" it creates that pet and assigns it to the shelter.
5) At the bottom of the shelter's "show" page, you should see a list of pets at that shelter
6) next to each pet, is an "adopt 
pet" button
7) clicking that button will remove the pet from the shelter (it just disappears into your home for now)

Next:

8) add a column to pets to remember the date/time they were donated to the shelter. On the shelter-page, order the pets (by default) such that the pet that has been in the shelter the longest - is at the top of the list
9) Add an ability to sort the pets by other features (name, species, breed, age, etc)
10) add a maximum-capacity to each shelter. If a person tries to donate a pet to a full shelter - apologies, say it's full and give a list of shelters that are not yet full (for the user to choose).
11) You can already sort the pets by species/breed... but now add an ability to *filter* by species, or breed (eg somebody wants to see only cats, or only Persians).
12) let the user filter by age (eg only age <= 2). It'd be best if you could
let them enter a range....

Extra Credit

Instead of destroying a pet when it's donated, the pet gets a new attribute: "adopted" which is set to TRUE (when it's still in the shelter it's FALSE).
The shelter main page lists only pets that have not been adopted out.
Add a link to the shelter-show page called "past pets".
Clicking "past pets" takes the user to a list of pets that used to belong to
the shelter, but have been adopted out.

update the shelter to have different housing for different species, with a
different capacity for each (eg 20 cages for cats, 15 for dogs, 12 cages for
birds etc).
Now when adding a new pet to the shelter - it has to check the capacity for
this specific species - and the list of alternate shelters must likewise
show shelters that have space for this species.
You will have to decide how to alter your database to reflect this...