class Organizations::TeamsController < ApplicationController

  def index
    @org = Organization.includes(teams: :users).find(params[:organization_id])
    @teams = @org.teams
    
    render 'users/teams/index'
  end

end