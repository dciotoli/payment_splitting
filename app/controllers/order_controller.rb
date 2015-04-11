class OrderController < ApplicationController

	def new
    
    end

    def create
    	@order = Order.new
    	@order.name = params[:name]
    end

    def show
    	@orders = Order.all
    end
end
