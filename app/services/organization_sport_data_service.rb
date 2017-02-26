class OrganizationSportDataService

  def initialize(org)
    @org = org #includes team/users via controller
  end

  def perform
    {
      team_names: @org.teams.map(&:name),
      participation_data: participation_data
    }
  end


  private

    #format array of hashes for js API consumption
    def participation_data
      binding.pry
      {

      }
    end


end