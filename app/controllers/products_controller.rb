class ProductsController < ApplicationController
	
	def show
    @product = Product.find(params[:id])
    @comments = @product.comments.page(params[:page])


	end

end
