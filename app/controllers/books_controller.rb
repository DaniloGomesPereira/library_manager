class BooksController < ApplicationController
  def index
    render json: Book.all
  end

  def show
    book = Book.find(params[:id])
    render json: book, status: :ok
  end

  def create
     book = Book.new(book_params)
    if book.save
      render json: book, status: :created
    else
      render json: book.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
     book = Book.find(params[:id])
    if book.update(book_params)
      render json: book, status: :ok
    else
      render json: book.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.delete
      render json: 'Record removed successfully', status: :ok
    else
      render json: 'An error has occurred while trying to remove the data'
  end
end

private
  def book_params
    params.require('book').permit(:title, :published_in, :genre, :publisher_id)
  end
end
