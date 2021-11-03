# frozen_string_literal: true

class MagazinesController < ApplicationController
  before_action :set_magazine, only: %i[update destroy show]

  def index
    render json: Magazine.all
  end

  def show
    render json: @magazine, status: :ok
  end

  def create
    magazine = Magazine.new(magazine_params)
    if magazine.save
      render json: magazine, status: :created
    else
      render json: magazine.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    if @magazine.update(magazine_params)
      render json: magazine, status: :ok
    else
      render json: magazine.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    if @magazine.destroy
      render json: 'Record removed successfully', status: :ok
    else
      render json: 'An error has occurred while trying to remove the data'
    end
  end

private

  def magazine_params
    params
      .require('magazine')
      .permit(:title, :published_in, :publisher_id,
              genre_magazines_attributes: %i[genre_id])
  end

  def set_magazine
    @magazine = Magazine.find(params[:id])
  end
end
