class SportDataService

  def initialize(user)
    @user = user
  end

  def perform
    {
      last_weeks_dates: last_weeks_dates,
      data: grouped_sports_by_name,
    }
  end

  private

    def last_weeks_dates
      dates.map{ |date| date.strftime('%b %d, %Y') }.reverse
    end

    #do sorting in ruby, maybe v2 will be raw sql w/ grouping
    def grouped_sports_by_name
      data = []

      #group all sports by nane for enumeration
      sports.group_by(&:name).each do |name, sports|
        hour_data = []

        #group all named sports by day, and add that sports hours
        dates.reverse_each do |d|
          hour_data << sports
                        .select{ |sport| sport.participation_date == d}
                        .sum(&:participation_hours)
        end

        #format hash for js API consumption
        data << {
          name: name,
          data: hour_data
        }
      end

      data
    end


    def dates
      @dates ||= Date.current.downto(Date.current - 7.days)
    end

    def sports
      @sports ||= @user.sports.order(:created_at).where('participation_date > ?', 7.days.ago)
    end

end