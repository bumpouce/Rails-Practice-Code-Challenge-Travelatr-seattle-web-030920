class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :like]

    def new
        @post = Post.new
        @bloggers = Blogger.all
        @destinations = Destination.all
    end

    def create
        @post = Post.new(post_params)
        @post.likes = 0
        if @post.save
            redirect_to @post
        else
            render :new
        end
    end

    def edit
        @bloggers = Blogger.all
        @destinations = Destination.all
    end

    def update
        if @post.update(post_params)
            redirect_to @post
        else
            render :new
        end
    end

    def show
    end

    def like
        @post.add_like
        redirect_to @post
    end

    private

    def set_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end
end