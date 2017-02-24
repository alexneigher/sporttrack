class UsersController < ApplicationController


  def index
    #TODO
    #@users = User.includes(teams: :organization).all
    @users = User.order(:id).all
  end

  def show
    #TODO
    #@user = User.includes(teams: :organization).find(params[:id])
    @user = User.find(params[:id])
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