class Api::V1::PostsController < ApplicationController

  before_action :authenticate_user!
  
  def index
    @posts = Post.all
    render json: @posts
  end

  def my_blog_posts
    @posts = current_user.posts
    render json: @posts
  end

  def new
    @post = Post.new
    render json: @post
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      render json: @post, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
    render json: @post
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

    def show
      @post = Post.find(params[:id])
      render json: {
        id: @post.id,
        title: @post.title,
        description: @post.description,
        user: {
          id: @post.user_id,
          email: @post.user.email
        },
        created_at: @post.created_at,
        updated_at: @post.updated_at
      }
    end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    render json: @post
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :user_id)
  end

end