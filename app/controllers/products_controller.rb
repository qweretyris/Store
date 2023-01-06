class ProductsController < ApplicationController
	
	def show
    @product = Product.find(params[:id])

    @comment = @product.comments.new
	end

end
