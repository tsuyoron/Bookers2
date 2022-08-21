class UsersController < ApplicationController
  def index
    @user = User.find_by(id: params[:id])
    @book = Book.new
    @book.user_id = current_user.id
    @books = Book.all
    

  end



  def show

  end



end
