class AuthorsController < ApplicationController
  def index
    render json: Author.all
  end

  def show
    author = Author.find(params[:id])
    render json: author, status: :ok
  end

  def create
    author = Author.new(author_params)
    if author.save
      render json: author, status: :created
    else
      render json: author.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    author = Author.find(params[:id])
    if author.update(author_params)
      render json: author, status: :ok
    else
      render json: author.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    author = Author.find(params[:id])
    if author.delete
      render json: 'Record removed successfully', status: :ok
    else
      render json: 'An error has occurred while trying to remove the data'
    end
  end

  private

  def author_params
    params.require('author').permit(:name, :birthday, :nationality)
  end
end
