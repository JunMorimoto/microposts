class UsersController < ApplicationController
  before_action :set_params, only: [:show, :edit, :update]
  before_action :collect_user, only: [:edit, :update]

  def show
    @microposts = @user.microposts.order(created_at: :desc)
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Updated your Plofile"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def following
    @user = User.find(params[:id])
    @following = @user.following_users.order(created_at: :desc)
  end
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.follower_users.order(created_at: :desc)
  end

  private
  
  def set_params
    @user = User.find(params[:id])
  end
  
  def collect_user
    redirect_to root_path if @user != current_user
  end

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :location, :birthday, :comment, :hobby)
  end
end