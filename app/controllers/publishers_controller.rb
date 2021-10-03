# frozen_string_literal: true

class PublishersController < ApplicationController
  def index
    render json: Publisher.all
  end

  def show
    publisher = Publisher.find(params[:id])
    render json: publisher, status: :ok
  end

  def create
   publisher = Publisher.new(publisher_params)
   if publisher.save
    render json: publisher, status: :created
  else
    render json: publisher.errors.full_messages, status: :unprocessable_entity
  end
end

def update
  publisher = Publisher.find(params[:id])
  if publisher.update(publisher_params)
    render json: publisher, status: :ok
  else
    render json: publisher.errors.full_messages, status: :unprocessable_entity
  end
end

def destroy
  publisher = Publisher.find(params[:id])
  if publisher.delete
    render json: 'Record removed successfully', status: :ok
  else
    render json: 'An error has occurred while trying to remove the data'  
  end
end

private

def publisher_params
  params.require('publisher').permit(:name, :fundation, :country)
end
end
