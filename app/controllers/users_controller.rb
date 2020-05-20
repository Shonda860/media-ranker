class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    user_id = session[:user_id]
    @user = User.find_by(id: user_id )
    if @user.nil?
      redirect_to users_path
      return
    end
  end

  def login_form 
    @user = User.new
  end

  def login
    username = params[:user][:username]
    user = User.find_by(username: username)
    if user
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in as existing user #{username}"
    else
      user = User.create(username: username)
      session[:user_id] = user.id
      flash[:success] = "Successfully created new user #{username} with ID #{user.id}"
    end
    
    redirect_to root_path
    return
  end

  def logout
    if session[:user_id]
      user = User.find_by(id: session[:user_id])
 
        session[:user_id] = nil
        flash[:notice] = "You are now logged out"
     
     redirect_to root_path
     return
    end
  end

  def current
    @current_user = User.find_by(id: session[:user_id])
    if @current_user.nil?
      redirect_to root_path
      flash[:error] = "You must log in to do that"
      return
    end 
  end
end


