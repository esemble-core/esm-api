module Api
  module V1
    class UsersController < ApplicationController  
      def index
        users = User.order('created_at DESC')
        render json: {status: 'SUCCESS', message: 'Loaded users', data: users},status: :ok
      end
      
      def show
        user = User.find(params[:id])
        render json: {status: 'SUCCESS', message: 'Loaded user', data: user},status: :ok
      end

      def create
        user = User.new(user_params)

        if user.save
          render json: {status: 'SUCCESS', message: 'Saved user', data: user},status: :ok
        else
          render json: {status: 'ERROR', message: 'User not saved', data: user.errors},status: :unprocesseble_entity
        end
      end

      def destroy
        user = User.find(params[:id])
        user.destroy
        render json: {status: 'SUCCESS', message: 'Deleted user', data: user},status: :ok
      end


      def update
        user = User.find(params[:id])

        if (user.update_attributes(user_params))
          render json: {status: 'SUCCESS', message: 'Updated article', data: user},status: :ok
        else
          render json: {status: 'ERROR', message: 'Article not updated', data: user.errors},status: :unprocesseble_entity
        end
      end

      private

      def user_params
        params.permit(:name, :eth_addr)
      end
    
    end
  end
end



#class UsersController < ApplicationController
  #before_action :set_user, only: [:show, :update, :destroy]


    # Only allow a trusted parameter "white list" through.
   #def user_params
   #   params.require(:user).permit(:id, :name, :eth_addr)
   # end
#end
