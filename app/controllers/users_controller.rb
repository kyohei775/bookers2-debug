class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:update, :edit]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    @book = Book.new
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice]="You have updated user successfully."
      redirect_to user_path(current_user)
    else
      @book = Book.new
      render :edit
    end
  end

  def follow
      @user  = User.find(params[:id])
      @users = @user.follower
      render 'show_follow'
  end

  def unfollow
    @user  = User.find(params[:id])
    @users = @user.follower
    render 'show_follower'
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
