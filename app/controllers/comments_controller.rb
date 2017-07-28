class CommentsController < ApplicationController
  before_action :set_comment, only: :show

  def new
    @comment = Comment.new
  end

  def show
  end

  def create
    if user_signed_in?
      dataComments = comment_params;
      dataComments[:user_id] = current_user.id;
      @comment = Comment.new dataComments
      respond_to do |format|
        if @comment.save
          format.js {render "create.js.erb"}
        else
          binding.pry
          format.html { render :new }
          format.json { render json: @comment.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:warning] = "Please login!!!"
      redirect_to root_url
    end
  end

  private

  def set_comment
    @article = Commment.find params[:id]
  end

  def comment_params
    params.require(:comment).permit :content, :post_id
  end
end
