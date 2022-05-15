class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]


  def index
    @user=User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end



  # def create
  #   # @book = Book.new(book_params)
  #   # @book.user_id = current_user.id
  #   # @book.save
  #   # redirect_to book_path(@book.id)
  # end


  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] ="You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render:edit
    end
    # @book = Book.new(book_params)
    # @book.user_id = current_user.id
    # @book.save
    # redirect_to book_path(@book.id)
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image,:introduction)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(user_path(current_user.id)) unless @user == current_user
  end


  # def book_params
  #   params.require(:book).permit(:title, :body)
  # end

end
