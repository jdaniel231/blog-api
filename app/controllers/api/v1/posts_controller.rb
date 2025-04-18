class Api::V1::PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
    render :index, formats: :json
  end

  def my_blog_posts
    @posts = current_user.posts
    render :my_blog_posts, formats: :json
  end

  def new
    @post = Post.new
    render :new, formats: :json
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      render :show, formats: :json, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
    render :edit, formats: :json
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      render :show, formats: :json
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
    render :show, formats: :json
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    render :show, formats: :json
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :user_id)
  end
end
