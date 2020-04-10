class BloggersController < ApplicationController
    before_action :set_blogger, only: [:show, :edit, :update]

    def index
        @bloggers = Blogger.all
    end

    def new
        @blogger = Blogger.new
    end

    def create
        @blogger = Blogger.new(blogger_params)
        @blogger.age = @blogger.age.to_i
        if @blogger.save
            redirect_to blogger_path(@blogger)
        end
    end

    def show
        @count = @blogger.posts.count
        @featured = @blogger.featured_post
        @top_destinations = @blogger.top_destinations
    end

    private

    def set_blogger
        @blogger = Blogger.find(params[:id])
    end

    def blogger_params
        params.require(:blogger).permit(:name, :bio, :age)
    end
end