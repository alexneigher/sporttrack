class SportsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @sport = Sport.new
  end

  def create
  end

  def update
  end

  def edit
  end

end