class UsersController < ApplicationController
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

end
