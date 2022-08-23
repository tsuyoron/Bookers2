class BooksController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy]


  def new
  end

  def index
    @user = User.find(current_user.id.to_s)
    @book_new = Book.new
    @books = Book.all
  end

  def show
    @book_new = Book.new
    @book = Book.find_by(id: params[:id])
    @user = @book.user
  end

  def create
    @book_new = Book.new(book_params)
    @book_new.user_id = current_user.id
    if @book_new.save
      redirect_to book_path(@book_new.id), notice: "successfully"
    else
      @user = User.find(current_user.id.to_s)
      @books = Book.all
      # @book = Book.find(id: params[:id])
      # @book.user.name = User.find_(current_user.id.to_s).name
      render :index
    end
  end

  def edit
    @book = Book.find_by(id: params[:id])
  end

  def update
    @book = Book.find_by(id: params[:id])
    if @book.update(book_params)
      redirect_to book_path(id: params[:id]), notice: "successfully"
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
    #params.permit(:title, :body, :id)
  end

  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end

end
