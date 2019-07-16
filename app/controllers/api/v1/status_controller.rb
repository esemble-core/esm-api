class Api::V1::StatusController < ApplicationController  
  def index
    render json: { status: 'OK', message: 'Service Running' }, status: :ok
  end
end
  