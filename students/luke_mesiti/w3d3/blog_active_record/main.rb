require 'pry'
require 'pry-debugger'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'active_record'

ActiveRecord::Base.establish_connection(
    :adapter => "postgresql",
    :database => "blog"
)

class Post < ActiveRecord::Base
    validates :title, :presence => true, :uniqueness => true, length: { maximum: 255 }, length: { minimum: 3 }
    validates :description, :presence => true, :uniqueness => true, length: { maximum: 255 }
    validates :body, :presence => true, :uniqueness => true
    validates :author, :presence => true, :uniqueness => true, length: { maximum: 255 }

    before_update :refresh_updated_date
    before_create :set_created_at

    has_many :comments

    def refresh_updated_date
        self.updated_at = Time.now
    end

    def set_created_at
        self.created_at = Time.now
    end
end

class Comment < ActiveRecord::Base
    validates :content, :presence => true, length: { maximum: 500 }
    validates :author, :presence => true, length: { maximum: 255 }

    belongs_to :post
end
    # binding.pry
get '/' do
    redirect to '/posts'
end

get '/posts' do # list posts
    @sortvar = params[:sort] || "title"
    if @sortvar == "updated_at"
        @rows = Post.order( @sortvar => :desc).all
    else
        @rows = Post.order( @sortvar => :asc).all
    end
    erb :home
end

get '/posts/new' do
    @new_post = Post.new
    erb :new
end

get '/posts/:id' do # retrieve a post
    @blog_post = Post.find(params[:id])
    @c_records = @blog_post.comments # @c_records = Comment.where(:post_id => params[:id])
    erb :posts
end

post '/posts' do # create a new post
    @new_post = Post.new(params[:post])
    if @new_post.save
        redirect to '/posts'
    else
        erb :new
    end
end

post '/posts/:id/comments' do # create a new comment
    @new_comment = Comment.new(params[:comment])
    @blog_post = Post.find(params[:id])
    if @new_comment.save
        redirect to "/posts/#{params[:id]}"
    else
        erb :posts
    end
end

get '/posts/:id/edit' do # route that selects a post to be edited
    @blog_post = Post.find(params[:id])
    erb :edit
end

put '/posts/:id' do # edit post
    @blog_post = Post.find(params[:id])
    if @blog_post.update_attributes(params[:post])
        redirect to '/'
    else
        erb :edit
    end
end

###### DESTROY

delete '/posts/:id' do #### post /destroy
    Post.find(params[:id]).comments.delete_all
    Post.find(params[:id]).delete
    redirect to '/'
end

delete '/posts/:post_id/comments/:comment_id' do #### post/:id/comments/:post_id
    Comment.find(params[:comment_id]).delete
    redirect to "/posts/#{params[:post_id]}"
end
