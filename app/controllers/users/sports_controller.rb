class Users::SportsController < ApplicationController
  before_action :fetch_user

  def new
    @sport = Sport.new
  end

  def create
    @sport = @user.sports.create(sport_params)
  end

  def update
    @sport = @user.sports.find(params[:id])
    @sport.update(sport_params)
    
    render :create
  end

  def edit
    @sport = @user.sports.find(params[:id])
  end

  private

    def fetch_user
      @user = User.find(params[:user_id])
    end

    def sport_params
      params.require(:sport).permit(:participation_hours, :participation_date, :name)
    end
end