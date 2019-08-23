class TodosController < ApplicationController
    def show
      render json: Todolist.find(params[:id])
    end

    def index
        @todolists = Todolist.all
    end

    def create
      @todolist = Todolist.new(todolist_params)
      if @todolist.save
        render json: @todolist
      else
        render json: @todolist.errors.full_messages, status: 422
      end
    end

    def update
      
    end

    def destroy

    end

    private
    def todolist_params
        params.require(:todolist).permit(:body, :title, :done)
    end

end