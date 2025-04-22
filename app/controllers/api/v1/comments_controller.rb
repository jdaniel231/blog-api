class Api::V1::CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @comments = Comment.where(post_id: params[:post_id])
    render :index, formats: :json    
  end

  def new
    @comment = Comment.new
    render :new, formats: :json
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.post = Post.find(params[:post_id])
    @comment.user = current_user
    if @comment.save
      render :show, formats: :json, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    render :edit, formats: :json
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      render :show, formats: :json
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def show
    @comment = Comment.find(params[:id])
    render :show, formats: :json
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    render :show, formats: :json
  end 

  private

  def comment_params
    params.require(:comment).permit(:commit)
  end
end