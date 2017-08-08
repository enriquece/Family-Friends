class CommentsController < ApplicationController
  before_action :find_picture, only: [:create]

  def index
    @comment = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = @picture.comments.new(commentParams)
    if @comment.save
      flash[:success] = "Comment successfully added"
      redirect_to @picture
    else
      render 'new'
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  private

    def commentParams
      params.require(:comment).permit(:name, :body)
    end

    def find_picture
      @picture = Picture.find(params[:id])
  end
end
