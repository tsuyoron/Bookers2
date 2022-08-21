class UsersController < ApplicationController
  def index
    @user = User.find_by(id: params[:id])
    @book = Book.new
  end



  def show

  end



end
