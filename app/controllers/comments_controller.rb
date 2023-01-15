class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :destroy, :update]

	def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.create!(comment_params.merge(user_id: current_user.id))
    redirect_to product_path(@product)

  end

  def destroy
    @comment = Comment.find(params[:id])
    @product = Product.find(params[:product_id])

    redirect_to product_path(@product)
	end

  def edit
    @product = Product.find(params[:product_id])
    @comment = Comment.find(params[:id])

  end

  def update
    @product = Product.find(params[:product_id])
    #@comment = Comment.find(params[:id])
    @product.comments.find(params[:id]).update(comment_params)

    redirect_to product_path(@product)

  end


  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
