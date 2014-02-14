class PostsController < ApplicationController
    def index
        @post = Post.all
    end

    def show
        @post = Post.find(params[:id])
        # if @post.blank?
        #     redirect_to posts_url, status: :not_found
        # end
    end

    def new
        @post = Post.new
    end

    def create
        post = Post.create(post_params)
        redirect_to post
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        post = Post.find(params[:id])
        post.update_attributes(post_params)
        redirect_to post
    end

    def destroy
        post = Post.find(params[:id])
        post.destroy
        redirect_to posts_path
    end

    def post_params
        params.require(:post).permit(:title,:description,:body,:author)
    end


end
