class CategoriesController < ApplicationController
	
	def index
    @categories = Category.all
  end

    def show
  	@category = Category.find(params[:id])
    category_id = @category.id
    @product = Product.find(category_id)

  end
  
  def create
    @category = Category.new(category_params)

  end

  def filter

    params[:title1]
    render 'show'

  end

  private
  def category_params
    params.require(:category).permit(:name)
    end

end
