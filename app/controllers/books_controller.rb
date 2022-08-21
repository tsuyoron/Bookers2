class BooksController < ApplicationController
  def new
  end

  def index
  end

  def show
  end

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    book.save
    redirect_to book_path(book.id)
  end

  private

  def book_params
    params.require(:book).permit(:name, :introduction)
  end

end
