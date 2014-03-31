class PostsController < ApplicationController
  
  
  def index
    @user = User.find(params[:user_id])
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @post = Post.new
    @user = User.find(params[:user_id])
  end
  
  def create
    @post = Post.new(params[:post])
    @post.user_id = params[:user_id]
    if @post.save
      flash[:notice] = "The post was saved successfully."
      redirect_to user_post_path(@post.user, @post)
    else
      flash[:alert] = "There was a problem."
      redirect_to new_user_post_path(@post.user)
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
    
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:notice] = "Updated successfully."
    else
      flash[:alert] = "There was a problem."
    end  
      redirect_to user_post_path(@post.user, @post)
  end
    
  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "Was deleted."
      redirect_to user_posts_path(@post.user)
    else
      flash[:alert] = "Was an error deleting."
      redirect_to :back
    end
    
  end
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
