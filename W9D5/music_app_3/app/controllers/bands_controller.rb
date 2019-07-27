class BandsController < ApplicationController
    
    def index
        render plain: "BandsController: Index"
    end

    def new
        render plain: "BandsController: New"
    end

    def create
        render plain: "BandsController: Create"
    end

    def show
        render plain: "BandsController: Show"
    end

    def update
        render plain: "BandsController: Update"
    end

    def destroy
        render plain: "BandsController: Destroy"
    end
end