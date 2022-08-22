class UsersController < ApplicationController
  def index
    @user = User.find_by(current_user.id.to_s)
    @book = Book.new
    @book.user_id = current_user.id
    @books = Book.all


  end



  def show

  end



end
