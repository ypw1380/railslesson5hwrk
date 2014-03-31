class UsersController < ApplicationController
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
     flash[:notice] = 'User was deleted successfully.'
    else
     flash[:alert] = 'There was a problem deleting 
     the user.'
    end
     redirect_to '/users'
    
  end
  
  def new
     @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "User saved successfully."
      redirect_to '/users'
    else
      flash[:alert] = "Error encountered while creating."
      redirect_to '/users/new'
    end
  end
  
  def edit
    @user = User.find(params[:id])    
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "User edited successfully."
      redirect_to '/users'
    else
      flash[:alert] = "Error encountered while editing."
      redirect_to '/users/new'
    end
  end
  
  
  
   
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
