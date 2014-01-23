require 'sinatra'
require 'sinatra/reloader' if development?
require 'active_support/all'
require 'active_record'

require 'pry'
require 'pry-debugger'

ActiveRecord::Base.establish_connection(
  :adapter  => 'postgresql',
  :username => 'albertoforni',
  :database => 'wdi_blog'
)

require './models/post'
require './models/comment'

# home => show list
get '/' do
  redirect to '/posts'
end

# show list
get '/posts' do
  @order_by = {
    created_at: 'Created At',
    updated_at: 'Updated At',
    title: 'Title'
  }

  @current_order = params[:sort] && @order_by[params[:sort].to_sym] ? params[:sort].to_sym : :created_at
  @direction = params[:dir] == 'asc' ? :asc : :desc

  @posts = Post.order(@current_order => @direction).all

  erb :list
end

# new form
get '/posts/new' do
  @post = Post.new 
  erb :form
end

# new submit
post '/posts' do
  @post = Post.create(params[:post])

  if @post.valid?
    redirect to '/'
  else
    @errors = @post.errors.messages
    erb :form
  end
end

# display single post
get '/posts/:id' do
  @post = get_post(params[:id])
  @comments = @post.comments

  erb :show
end

# edit post form
get '/posts/:id/edit' do
  @post = get_post(params[:id])

  erb :form
end

# edit post submit
put '/posts/:id' do
  @post = get_post(params[:id])

  @post.update_attributes(params[:post].merge(:updated_at => Time.now))

  if @post.valid?
    redirect to "/posts/#{params[:id]}"
  else
    @errors = @post.errors.messages
    erb :form
  end
end

# delete post
delete '/posts/:id' do
  @post = get_post(params[:id])
  @post.comments.destroy_all

  @post.delete

  redirect to '/'
end

def get_post(id)
  redirect to '/' unless Post.find_by_id(params[:id])
  Post.find(params[:id])
end

# #
# comments
# #

# submit
post '/posts/:id/comments' do
  @comment = Comment.create(params[:comment].merge(:post_id => params[:id]))

  if @comment.valid?
    redirect to "/posts/#{params[:id]}"
  else
    @post = get_post(params[:id])
    @comments = @post.comments
    @errors = @comment.errors.messages
    erb :show
  end
end