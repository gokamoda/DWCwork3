class BooksController < ApplicationController
  def new
  end

  def index
    @book=Book.new
    @books=Book.all
    # @book=Book.find_by(id: params[:id])
    # @user=User.find_by(id: @book.user_id)

    # @user = User.find(params[:id])
    # @books = @user.post_images
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(:id)
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  # def user_params
  #   params.require(:user).permit(:name, :profile_image)
  # end

end
