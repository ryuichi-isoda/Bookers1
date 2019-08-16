class BooksController < ApplicationController
  def index
    # 空のモデルの生成
    @book = Book.new
    # 記事の内容を全件取得
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render ("books/new")
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      render ("book/edit")
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:notice] = "Book was successfully destroyed."
     redirect_to books_path
    else
     render ("books/new")
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
