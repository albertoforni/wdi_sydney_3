require 'pry'
require 'pry-debugger'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'active_support/all'
require 'pg'

get '/' do
    # raise params.inspect
    if params[:sort] == nil
        sql = "SELECT * FROM posts ORDER BY created_at ASC"
    else  
        sql = "SELECT * FROM posts ORDER BY #{params[:sort]} ASC"
    end
    @rows = run_sql(sql)
    erb :home
end

get '/posts' do
    # raise params.inspect
    if params[:sort] == nil
        sql = "SELECT * FROM posts ORDER BY created_at ASC"
    else  
        sql = "SELECT * FROM posts ORDER BY #{params[:sort]} ASC"
    end
    @rows = run_sql(sql)
    erb :home
end

get '/posts/new' do #### /new
    erb :new
end

get '/posts/:id' do
    sql = "SELECT * FROM posts WHERE id = #{params[:id]}"
    @records = run_sql(sql)
    @blog_post = @records[0]
    c_sql = "SELECT comments.author, comments.created_at, comments.content, comments.id FROM comments JOIN posts ON (comments.post_id = posts.id) WHERE posts.id = #{params[:id]} ORDER BY comments.created_at ASC;"
    @c_records = run_sql(c_sql)
    erb :posts
end

post '/posts' do #### /create
    sql = "INSERT INTO posts (title, description, body, author, created_at) VALUES('#{params[:title]}', '#{params[:description]}', '#{params[:body]}', '#{params[:author]}', '#{Time.now}')"
    run_sql(sql)
    redirect to '/'
end

post '/posts/:id/comments' do ### c_create
    sql = "INSERT INTO comments (content,author,created_at,post_id) VALUES ('#{params[:content]}', '#{params[:author]}', '#{Time.now}', '#{params[:post_id]}')"
    run_sql(sql)
    redirect to "/posts/#{params[:id]}"
end

get '/posts/:id/edit' do
    # show form again to edit existing cat
    sql = "SELECT * FROM posts WHERE id = #{params[:id]}"
    @records = run_sql(sql)
    @blog_post = @records[0]
    @e_id = params[:id]
    # binding.pry 
    erb :edit
end

put '/posts/:id' do #### post
    # update the record
    sql = "UPDATE posts SET title='#{params[:title]}', description='#{params[:description]}', body='#{params[:body]}', author='#{params[:author]}', updated_at='#{Time.now}' WHERE id = #{params[:id]}"
    run_sql(sql)
    redirect to '/'
end

###### DESTROY

delete '/posts/:id' do #### post /destroy
    sql = "DELETE FROM comments WHERE post_id = #{params[:id]}"
    run_sql(sql)

    sql = "DELETE FROM posts WHERE id= #{params[:id]}"
    run_sql(sql)
    redirect to '/'
end

delete '/posts/:post_id/comments/:comment_id' do #### post/:id/comments/:post_id
    sql = "DELETE FROM comments WHERE id = #{params[:comment_id]}"
    run_sql(sql)

    redirect to "/posts/#{params[:post_id]}"
end

def run_sql(sql)
    # connect to the blog db
    conn = PG.connect(:dbname => 'blog')
    # execute the sql in the argument
    res = conn.exec(sql)
    # close the db connection
    conn.close
    # return the result of the sql
    res
end
