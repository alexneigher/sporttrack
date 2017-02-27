class OrganizationSportDataService

  def initialize(org)
    @org = org #includes team/users via controller
  end

  def perform
    {
      sport_categories: sport_categories,
      participation_data: participation_data
    }
  end

  private

    #format array of hashes for js API consumption
    def participation_data
      data = {}
      sport_categories.map do |category|
        data[category] ||= categorized_participation_data(category)
      end
      return data
    end

    def categorized_participation_data(category)
      grouped_sports = sports.where(name: category).group_by(&:team)
      grouped_sports.map do |team, sports|
        {
          name: team.name,
          y: sports.sum(&:participation_hours)
        }
      end

    end

    def sport_categories
      sports.map(&:name).uniq
    end

    def sports
      @sports ||= @org.sports.includes(:team)
    end

end