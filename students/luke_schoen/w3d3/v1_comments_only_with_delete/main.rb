# ruby mainrb
# localhost:4567

require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'active_support/all'
require 'pg'

use Rack::MethodOverride # allows use put and delete HTTP instead of just post / get

# if use a 'before do' block - everytime before every route perform these actions

#before do
#	
#end

#get '/' do
#	redirect to '/posts'
#end


# GET COLLECTION OF POSTS AND DISPLAY
get '/' do #####
# in homepage if want list of gets
	if params[:sort_by] == "created_at" 
		#sql = "SELECT * FROM blog_posts ORDER BY #{params[:sort_by]} DESC;"

		sql = "SELECT * FROM blog_posts LEFT OUTER JOIN blog_comments ON blog_posts.id = blog_comments.post_id ORDER BY #{params[:sort_by]} DESC;"
		@sort_type1a = "id"
		@sort_type1b = "ID"
		@sort_type2a = "title"
		@sort_type2b = "Title"
		@sort_type3a = "updated_at"
		@sort_type3b = "Last Updated"
		@sort_type_sw_date4a = "created_at"
		@sort_type_sw_date4b = "Creation Date"
	elsif params[:sort_by] == "title" 
		#sql = "SELECT * FROM blog_posts ORDER BY #{params[:sort_by]} DESC;"
		sql = "SELECT * FROM blog_posts LEFT OUTER JOIN blog_comments ON blog_posts.id = blog_comments.post_id ORDER BY #{params[:sort_by]} DESC;"
		@sort_type1a = "id"
		@sort_type1b = "ID"
		@sort_type2a = "created_at"
		@sort_type2b = "Creation Date"
		@sort_type3a = "updated_at"
		@sort_type3b = "Last Updated"
		@sort_type_sw_date4a = @sort_type2a 
		@sort_type_sw_date4b = @sort_type2b
	elsif params[:sort_by] == "updated_at" 
		#sql = "SELECT * FROM blog_posts ORDER BY #{params[:sort_by]} DESC;"
		sql = "SELECT * FROM blog_posts LEFT OUTER JOIN blog_comments ON blog_posts.id = blog_comments.post_id ORDER BY #{params[:sort_by]} DESC;"
		@sort_type1a = "id"
		@sort_type1b = "ID"
		@sort_type2a = "title"
		@sort_type2b = "Title"
		@sort_type3a = "created_at"
		@sort_type3b = "Creation Date"
		@sort_type_sw_date4a = "updated_at"
		@sort_type_sw_date4b = "Last Updated"
	elsif params[:sort_by] == "id" 
		#sql = "SELECT * FROM blog_posts ORDER BY id"
		sql = "SELECT * FROM blog_posts LEFT OUTER JOIN blog_comments ON blog_posts.id = blog_comments.post_id ORDER BY #{params[:sort_by]} ASC;"
		@sort_type1a = "created_at"
		@sort_type1b = "Creation Date"
		@sort_type2a = "title"
		@sort_type2b = "Title"
		@sort_type3a = "updated_at"
		@sort_type3b = "Last Updated"
		@sort_type_sw_date4a = @sort_type1a 
		@sort_type_sw_date4b = @sort_type1b
	elsif !(params[:sort_by].present?)
		#sql = "SELECT * FROM blog_posts ORDER BY id"
		sql = "SELECT * FROM blog_posts LEFT OUTER JOIN blog_comments ON blog_posts.id = blog_comments.post_id ORDER BY id ASC;"
		@sort_type1a = "created_at"
		@sort_type1b = "Creation Date"
		@sort_type2a = "title"
		@sort_type2b = "Title"
		@sort_type3a = "updated_at"
		@sort_type3b = "Last Updated"
		@sort_type_sw_date4a = @sort_type1a 
		@sort_type_sw_date4b = @sort_type1b
	end
		@res = run_sql(sql)

		erb :display
end

# GET CREATE FORM AND DISPLAY
get '/posts/create' do
# show the actual form
# _menu_sub_create.erb
	erb :create
end

# GET FROM COLLECTION OF POSTS A SPECIFIC ID AND DISPLAY (IF USER CLICK 'VIEW DETAILS')
get '/posts/:id' do
# if user go to this route it should show the form again
# links for each must be shown in the home.erb, so if user clicks link it will go to page of anchor
	#sql = "SELECT * FROM blog_posts WHERE id=#{params[:id]};"
	sql = "SELECT * FROM blog_posts LEFT OUTER JOIN blog_comments ON blog_posts.id = blog_comments.post_id AND blog_posts.id = #{params[:id]};"
	@records = run_sql(sql) # returns a list of records 
	@blog = @records[0] # @blog is actually a collection in sql
	erb :post
end

# UPATE POST RESOURCE WITH SPECIFIC ID (ID AUTO CREATED) AFTER USER COMPLETES 'CREATE POST FORM'
#post '/posts/:id' do
#another route to do the updates to an individual cat's record
#first you need the sql
#	redirect to '/'
#end

# new route to create and save to database
# 
post '/posts' do
	sql = "INSERT INTO blog_posts (title, abstract, body_text, author, created_at) values ('#{params[:title]}', '#{params[:abstract]}', '#{params[:body_text]}', '#{params[:author]}', '#{Time.now}');" 
	run_sql(sql)
# post redirect pattern - after finishing post, you start a new page, so user can't refresh and resubmit the same stuff
	redirect to '/'
end

################ EDIT POST ##################
get '/posts/:id/edit' do
	sql = "SELECT * FROM blog_posts WHERE id=#{params[:id]}"
	@records = run_sql(sql) # returns a list of records 
	@blog = @records[0] 
	erb :edit
end

post '/posts/:id' do
	sql = "UPDATE blog_posts set title = '#{params[:title]}', abstract = '#{params[:abstract]}', body_text = '#{params[:body_text]}', author = '#{params[:author]}', updated_at = '#{Time.now}' WHERE id = #{params[:id]};"
	run_sql(sql)
	redirect to '/'
end

################ CREATE COMMENT ##################
get '/posts/comments/:id/:boolean' do
	# SHOW TOP PART OF CREATE COMMENT SECTION SHOWING ONLY THE ID FOR WHICH COMMENT TO BE CREATED
	if params[:boolean] == "true"  
		sql = "SELECT * FROM blog_posts WHERE id=#{params[:id]}"
		@records = run_sql(sql) 
		@blog = @records[0] 
		erb :comment_create
	elsif params[:boolean] == "false" ## GO TO EDIT MENU OR NO ACTION
		redirect to '/'
	end
end

#get '/posts/:id/comments' do
#	#sql = "SELECT * FROM blog_posts WHERE id=#{params[:id]}"
#	sql = "SELECT * FROM blog_comments WHERE post_id=#{params[:id]}"
#	@records = run_sql(sql) # returns a list of records 
#	@blog = @records[0] 
#	erb :comment_create
#end

post '/comments/:id' do
	sql = "INSERT INTO blog_comments (c_comment, c_author, c_created_at, post_id) values ('#{params[:c_comment]}', '#{params[:c_author]}', '#{Time.now}', '#{params[:id]}');" 
	run_sql(sql)
	redirect to '/'
end

################ DELETE POST ##################
delete '/posts/:id' do
	sql = "DELETE FROM blog_comments WHERE post_id = #{params[:id]};"
	run_sql(sql)
	sql = "DELETE FROM blog_posts WHERE id = #{params[:id]};"
	run_sql(sql)

	redirect to '/'
end

def run_sql(sql)
# connect to the cats db
	conn = PG.connect(:dbname => 'crud_blog')
# exec the sql in the argument
	res = conn.exec(sql)
#close the db connection
	conn.close
# return the result of the sql
	res
# note: use of 'helper' allows it to also be available and shown in 'views'
	
end