class BooksController < ApplicationController
  def new
  end

  def index
    @user = User.find(current_user.id.to_s)
    @book_new = Book.new
    @books = Book.all
  end

  def show
    @user = User.find(current_user.id.to_s)
    @book_new = Book.new
    @book = Book.find_by(id: params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id), notice: "Successfully created your prototype."
    else
      @user = User.find(current_user.id.to_s)
      @books = Book.all
      @book_new = Book.new
      render :index
    end
  end

  def edit
    @book = Book.find_by(id: params[:id])
  end

  def update
    @book = Book.find_by(id: params[:id])
    @book.update(book_params)
    redirect_to book_path(id: params[:id]), notice: "Successfully updated  your prototype."
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
