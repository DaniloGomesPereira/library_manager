class GenresController < ApplicationController
	def index
		render json: Genre.all
	end

	def show
		genre = Genre.find(params[:id])
		render json: genre, status: :ok
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
		genre = Genre.find(params[:id])
		if genre.update(genre_params)
			render json: genre, status: :ok
		else
			render json: genre.errors.full_messages, status: :unprocessable_entity
		end
	end

	def destroy
		genre = Genre.find(params[:id])
		if genre.delete
			render json: 'Record removed successfully', status: :ok
		else
			render json: 'An error has occurred while trying to remove the data'
		end
	end

	private

	def genre_params
		params.require('genre').permit(:literary_genres)
	end
end