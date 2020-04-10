class DestinationsController < ApplicationController
    before_action :set_destination, only: [:show]

    def show
        @recent = @destination.recent_posts
        @featured = @destination.featured_post
    end

    private

    def set_destination
        @destination = Destination.find(params[:id])
    end
end