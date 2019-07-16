module Api
  module V1
    class StatusController < ApplicationController  
      def index
        render json: {status: 'OK', message: 'Service Running'},status: :ok
      end
    end
  end
end