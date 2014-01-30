Homework: 
tunr part 2


Add a "pages" controller for static pages.
Add the pages that you have listed in your footer and put some appropriate
text in the templates for each.
use simple routes for thse pages eg: /about_us /contact_us etc
These should be defined using a single line of code in your routes file to
match every static page



Update your app to use shallow nested routes.
So I should be able to put in these URLs:

/artists/42/songs   => returns the list of songs by this artist
/artists/42/albums  => returns a list of albums for this artist
/albums/17/songs    => returns a list of songs on this album

Note that /artists and /albums and /songs should also work and return a list
of all of the appropriate resource
You should
 use the *same* index action to do both!


Add a "playlist" model

playlist HABTM songs (and vice versa)

You should be able to create a new playlist and add any number of songs to it
Add a link to the playlists page to the header
On the playlist show-page - you should list the songs.


Extra credit:

Add a Genre model.
songs HABTM genres (and vice versa)

Add to your song-form a list of genres with checkboxes next to them, that
lets the user select which genres the song belongs to
Figure out what you need to call these fields - in order to be able to just
do: @song = Song.create(params[:song])
ie - you should not need to add a line of code that goes and finds genres to
add them to the newly created song.