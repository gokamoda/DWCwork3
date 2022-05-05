class BooksController < ApplicationController
  def new
  end

  def index
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
  end
end
