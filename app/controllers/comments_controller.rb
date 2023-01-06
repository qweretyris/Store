class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :destroy]

	def create

    @product = Product.find(params[:product_id])
    @comment = @product.comments.create!(comment_params.merge(user_id: current_user.id))


    redirect_to product_path(@product)

  end

  def show
    @comment = Comment.find(params[:id])
    # user_id = @comment.user_id
    # @user = User.find(user_id)
    @user = @comment.user
  end

  	def destroy
	end


    def edit
  end


  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
