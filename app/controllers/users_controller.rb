class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    if @user.nil?
      redirect_to root_path
    end
    @appoinments = current_user.appoinments.order(created_at: :desc)
  end
  
end