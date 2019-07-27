class TracksController < ApplicationController

    def new
        render plain: "TracksController: New"
    end

    def create
        render plain: "TracksController: Create"
    end

    def index
        render plain: "TracksController: Index"
    end

    def show
        render plain: "TracksController: Show"
    end

    def update
        render plain: "TracksController: Update"
    end

    def destroy
        render plain: "TracksController: Destroy"
    end
end