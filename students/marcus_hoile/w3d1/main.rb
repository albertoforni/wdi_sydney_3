require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require 'active_support/all'
require 'cgi'
require 'net/http'
use Rack::MethodOverride

get '/' do
	redirect to '/posts'
end



get '/posts' do
	if params[:sort_by] == "date"
	sql = "SELECT * from posts ORDER by created_at desc"
	elsif params[:sort_by] == "title"
	sql = "select * from posts ORDER by title"
	else
	sql = "SELECT * FROM posts ORDER BY updated_at desc"
	end
	@rows = run_sql(sql)


erb :home
end

get '/posts/new' do

	erb :new
end

post '/posts' do 
	# insert into the db
	# i need to have character support

	sql = "INSERT INTO posts (title, description, body, author, created_at) VALUES ('#{CGI.escape(params[:title])}', '#{CGI.escape(params[:description])}', '#{CGI.escape(params[:body])}', '#{params[:author]}', '#{Time.now}')"
	# run sql to insert into database
	run_sql(sql)
	# once done go back to home page
	redirect to '/'
end

get '/posts/:id' do
	# use the post id to query sql
	sql_post = "SELECT * FROM posts WHERE ID = #{params[:id]}"
	records = run_sql(sql_post)
	@post = records[0]
	# comments are in a diff table so need a separate query
	sql_comments = "SELECT * FROM comments WHERE post_id = #{params[:id]}"
	@results = run_sql(sql_comments)
	@date = Time.parse(@post["created_at"])

	erb :post
end


###

delete '/posts/:id' do
	# have to delete comments first then you can delete the post
	run_sql("DELETE FROM COMMENTS where post_id=#{params[:id]}")
	sql = "DELETE FROM posts WHERE ID = #{params[:id]}"
	run_sql(sql)
	redirect to '/'	
end

get '/posts/:id/edit' do
	sql = "SElECT * from posts where id = #{params[:id]}"
	@records = run_sql(sql)
	@post = @records[0]

	erb :edit
end


#####
put '/posts/:id' do 
	sql = "UPDATE posts SET title = '#{CGI.escape(params[:title])}', description = '#{CGI.escape(params[:description])}', body = '#{CGI.escape(params[:body])}', author = '#{params[:author]}', updated_at = '#{Time.now}' WHERE id = #{params[:id]} "
	run_sql(sql)
	redirect to "/"

end


post '/posts/:id/comments' do
	# will add the comment to its own table
	# and reference the post id 
	sql = "INSERT INTO comments (comment, author, post_id, created_at) VALUES ('#{CGI.escape(params[:comment])}', '#{params[:author]}', '#{params[:id]}', '#{Time.now}'	)"
	run_sql(sql)
	redirect to "/posts/#{params[:id]}"
end


def run_sql(sql)
	# connect to the cats database
	conn = PG.connect(:dbname => 'blog')
	# exec the sql in the argument
	res = conn.exec(sql)
	# close the db connection
	conn.close
	# return the result of the sql
	res
end
