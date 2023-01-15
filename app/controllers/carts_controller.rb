class CartsController < ApplicationController
	 before_action :authenticate_user!, only: [:index, :crete, :destroy]

	def index
		@user = current_user
		@carts = Cart.all.where(user_id: @user.id)


		#@products = @user.products
		#@products = @carts.products

	end

	def show
	end

	def destroy
		@cart = Cart.find(params[:id])
		@cart.destroy

    redirect_to carts_path, notice: "The item has been deleted."
	end



	def create
		@product = Product.find(params[:product_id])
		@cart = Cart.new(product_id: params[:product_id], user_id: params[:user_id])
		if @cart.save
			redirect_to product_path(@product), notice: "The item has been added to shopping cart."
		end
	end
end
