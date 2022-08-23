class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @user = User.find(current_user.id.to_s)
    @book = Book.new
    @book.user_id = current_user.id
    @users = User.all
  end

  def show
    @user = User.find(current_user.id.to_s)
    @book = Book.new
    @book.user_id = current_user.id
    @books = Book.all
  end

  def edit
    @user = User.find(current_user.id.to_s)
  end

  def update
    @user = User.find(current_user.id.to_s)
    if @user.update(user_params)
      redirect_to user_path(current_user.id.to_s), notice: "successfully"
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(user_path(current_user.id.to_s)) unless @user == current_user
  end

end
