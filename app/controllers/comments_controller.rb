class CommentsController < ApplicationController
    before_action :find_picture

  def index
    @comment = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = @picture.create(commentParams)
    if @comment.save
      flash[:success] = "Comment successfully added"
      redirect_to comments_path(@comment)
    else
      render 'new'
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  private

    def commentParams
      params.require(:comment).permit(:comment)
    end

    def find_picture
      @picture = Picture

  end
end
