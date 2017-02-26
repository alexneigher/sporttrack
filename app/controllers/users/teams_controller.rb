class Users::TeamsController < ApplicationController
  
  def index
    @user = User.includes(teams: :users).find(params[:user_id])
    @teams = @user.teams
  end

end
