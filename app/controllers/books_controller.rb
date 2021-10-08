# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :set_book, only: %i[update destroy show]

  def index
    render json: Book.all
  end

  def show
    render json: @book, status: :ok
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
    if @book.update(book_params)
      render json: @book, status: :ok
    else
      render json: @book.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    if @book.destroy
      render json: 'Record removed successfully', status: :ok
    else
      render json: 'An error has occurred while trying to remove the data'
    end
  end

  private

  def book_params
    params
    require('book')
    permit(:title, :published_in, :publisher_id,
           author_books_attributes: %i[author_id main_author],
           genre_books_attributes: %i[genre_id])
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
