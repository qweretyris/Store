class CategoriesController < ApplicationController
	
	def index
    @categories = Category.all
  end

    def show
  	@category = Category.find(params[:id])
    @products = @category.products.page(params[:page])
    case params[:order]
      when 'new' 
        @products = @products.order(id: :desc)
      when 'name'
        @products = @products.order(:name)
      when'lower'
        @products = @products.order(:price)
      when'higher'
        @products = @products.order(price: :desc)
    end


  end
  
  def create
    @category = Category.new(category_params)

  end

  def filter
    @category = Category.find(params[:id])
    @products = @category.products.min_price(params[:min])
    render 'show'

  end

  def search
    @result = params[:search]
    @products = Product.all.searching(@result).page(params[:page])


  end


  private
  def category_params
    params.require(:category).permit(:name)
    end

end
