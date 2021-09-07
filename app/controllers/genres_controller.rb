class GenresController < ApplicationController
	before_action :set_genre, only: %i[update destroy show]

	def index
		render json: Genre.all
	end

	def show
	  render json: @genre, status: :ok
	end

	def create
		genre = Genre.new(genre_params)
		if genre.save
			render json: genre, status: :created
		else
			render json: genre.errors.full_messages, status: :unprocessable_entity
		end
	end

	def update
		if @genre.update(genre_params)
			render json: @genre, status: :ok
		else
			render json: @genre.errors.full_messages, status: :unprocessable_entity
		end
	end

	def destroy
		if @genre.delete
			render json: 'Record removed successfully', status: :ok
		else
			render json: 'An error has occurred while trying to remove the data'
		end
	end

	private

	def genre_params
		params.require('genre').permit(:literary_genres)
	end

	def set_genre
		@genre = Genre.find(params[:id])
	end
end