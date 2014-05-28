class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])

  end

  def new
    @comment = Comment.new
    @comment.user_id = current_user.id
  end

  def create
    @comment = Comment.new
    @comment.content = params[:content]
    @comment.photo_id = params[:photo_id]
    # @comment.user_id = params[:user_id]

    if @comment.save
      redirect_to "/photos/#{@comment.photo.id}", :notice => "Comment created successfully."
    else
      render 'new'
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @comment.user_id = current_user.id
  end

  def update
    @comment = Comment.find(params[:id])

    @comment.content = params[:content]
    @comment.photo_id = params[:photo_id]
    @comment.user_id = params[:user_id]

    if @comment.save
      redirect_to "/comments", :notice => "Comment updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    @comment.destroy

    redirect_to "/comments", :notice => "Comment deleted."
  end
end
