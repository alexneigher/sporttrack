class Users::ProfileController < ApplicationController


  def show
    @user = User.find(params[:user_id])
    @sport_data = SportDataService.new(@user).perform
    authenticate_and_maybe_redirect
  end

  private
    def authenticate_and_maybe_redirect
      if @user.private_profile?
        flash[:error] = 'This user is private'
        redirect_to root_path
      end
    end
end