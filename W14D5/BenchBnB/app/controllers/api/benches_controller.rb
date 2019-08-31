class Api::BenchesController < ApplicationController
	def index
		@benches = Bench.all
	end

	def create
		@bench = Bench.create!(bench_params)
		# render something
	end
	
	def show
		@bench = Bench.find(params[:id])
	end

	protected
    def bench_params
        params.require(:bench).permit(:description, :lat, :lng)
    end
    
end
