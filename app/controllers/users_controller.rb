class UsersController < ApplicationController


  def index
    #TODO
    #@users = User.includes(teams: :organization).all
    @users = User.includes(:sports).order(:id).all
  end

  def show
    @user = User.includes(:sports, teams: :users).find(params[:id])
    authenticate_and_maybe_redirect
  end


  private
    def authenticate_and_maybe_redirect
      if @user.private_profile?
        unless @user == current_user
          flash[:error] = 'This user is private'
          redirect_to root_path
        end
      end
    end

end