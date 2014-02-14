Build a simple blog
This is a CRUD app with the resource being the "post"

posts have:
1) title
2) short description/abstract
3) body text (possibly very long)
4) author (just a single string for the name)
5) date+time created (call it created_at)


Your app should let you:
1. display a list of posts
2. each item on the list has a title and the short description
3. the title should take the user to the "show" page for a post
4. the URL for showing a post should be like: /posts/1234
where 1234 is the id of the post
5. the "show" page shoud list allt he relevant details of a post
6. the list page should have a "create" button that takes the user to the
form that lets you create a new post. 
7. the form should POST the details to the /posts URL
8. The user shouldn't be allowed to update the "created_at" field... that will be
set just in your code before you save the information to the database

This seems like a huge set of things... don't try to build it all at once.
1) First - spend *at least* 15min writing down a full list of things you need to do as a todo list. you will do that right now before we leave.
2) Then decide which thing is the simplest thing you could do, and do that first.
3) check it works! if it doesn't fix it before moving on
4) repeat steps 2-4


Extra credit:
8. The "show" page for a post should have a "delete" button that will delete the post by POSTing to /posts/1234/destroy
9. The "show" page for a post should have an "edit" button that will take you to a page where you can edit and re-save the post. The URL for this should be /posts/1234/edit and the form should POST to /posts/1234 - the show page should still work with the same URL!
10. Refactor the database connection initialization so that it appears ONLY ONCE in the program (ie db = PgConn.new...)  ( Hint : before ... do )
11. Use the sinatra/rails convention for changing a POST to a DELETE and change sinatra to respond to a delete instead



Remember - it's not important to get this site pretty. 
Meet the spec *first* and when you're done with that - then spend time on
nice-to-haves like prettiness or any neat ideas you come up with along the
way.
Put those nice-to-haves in your todo list so that you don't lose them, but
put them last on the list so you know that you shouldn't be working with
them until the end.


---------------------------------------------------------------------------------------------


I'd like you to update your blog project:
  - update the ordering of your blog list page to order from newest to
    oldest by default
  - add links to the "list" page that lets you choose to order
    the posts alphabetically by their titles vs by the previous date order
    eg /posts?sort=title  vs /posts?sort=date
    This would be a good excuse for another navigator (eg top-menu or side-bar)



  When you've done the "edit" page part of your blog app:
  - add an "updated_at" column to the posts table (the date+time the post was last edited)
  - set this to the current date+time every time that the page is
    successfully edited (again, don't put it in the form for the user to
    modify)
  - add a new link on the "list" page that lets you choose to order the
    posts by the most recently-updated date, rather than the save-date.


---------------------------------------------------------------------------------------------


add comments to your blog-app

  you will need to add a comments table to your blog database.
  It will need at least:
  - the id of the post that the comment is for (post_id)
  - the text of the comment
  - the author of the comment
  - the date the comment was created (call it created_at)

  For any post - you should list any existing comments at the bottom of
  the page (along with authors and date posted) ordered by the date it was
  created.
  Check this works by just manually putting some data into the comments
  table to start with.

  Then at the bottom of the blogpost-show page, add a form that will let you
  enter a comment for the blogpost. For now you can only create new comments
  - you can't edit or delete them


  you don't want the user to be able to change the date or the id of the
  blogpost (if they're on the page for blogpost id 1, then they shouldn't be
  able to enter a comment for blogpost id 4)


---------------------------------------------------------------------------------------------


update your blog app to use Active Record instead of raw SQL
then add validations
1. posts require the title, body, created_at, author to be present
2. comments require at least the text and author
3. post title should be unique
4. look at your table definition and see how long the varchar field is for
your string fields - add a validates length checker to make sure they're all
under that limit
5. post title should be at least three characters long
6. comment title should be at most 255 characters long - but only if they've
entered one!
7. put an appropriate limit on the size of the comment-text (you don't want
anybody writing a thesis there)



