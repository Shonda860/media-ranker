class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = current_user
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
    def current
      @current_user = current_user

      unless @current_user
        flash[:error] = "You must log in to do that"
        redirect_to root_path
        return
      end 
    end

end
