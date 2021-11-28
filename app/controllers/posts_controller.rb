class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to(@post)
  end
  
  def update
    @post = Post.find(params[:id])
    p comment_params
    new_commment = Comment.create(comment_params)
    @post.comments << new_commment
    redirect_to post_path(@post)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name])
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id, user_attributes: [:username])
  end
end
