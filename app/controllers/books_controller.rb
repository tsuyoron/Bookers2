class BooksController < ApplicationController
  def new
  end

  def index
  end

  def show
    @user = User.find_by(current_user.id.to_s)
    @book_new = Book.new
    @book = Book.find_by(id: params[:id])
  end

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    book.save
    redirect_to book_path(book.id)
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
