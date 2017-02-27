class OrganizationsController < ApplicationController

  def index
    @organizations = Organization.all
  end

  def show
    @organization = Organization.includes(teams: {users: :sports}).find(params[:id])
    @organization_data = OrganizationSportDataService.new(@organization).perform
  end

end