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