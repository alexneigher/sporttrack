class UsersController < ApplicationController


  def index
    @users = User.includes(:sports).order(:id).all
  end

  def show
    @user = User.includes(:sports, teams: :users).find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :height_meters, :weight_kilograms, :private_profile)
    end

end