class AlbumsController < ApplicationController
    
    def new
        render plain: "AlbumsController: New"
    end

    def create
        render plain: "AlbumsController: Create"
    end

    def index
        render plain: "AlbumsController: Index"
    end

    def show
        render plain: "AlbumsController: Show"
    end

    def update
        render plain: "AlbumsController: Update"
    end

    def destroy
        render plain: "AlbumsController: Destroy"
    end
end