class SportDataService

  def initialize(user)
    @user = user
  end

  def perform
    {
      last_weeks_dates: last_weeks_dates,
      data: [
        {
          name: 'Baseball',
          data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 34.5]
        },
        {
          name: 'Football',
          data: [19.9, 31.5, 13.4, 19.2, 14.0, 76.0, 3.5]
        }
      ],
      sports_by_date: sports_by_date
    }
  end

  private

    def last_weeks_dates
      dates.map{ |date| date.strftime('%b %d, %Y') }.reverse
    end 

   

    def sports_by_date
      binding.pry
      sports.select("created_at, name").group("created_at, name")
    end


    def dates
      @dates ||= Date.today.downto(Date.today - 7.days)
    end

    def sports
      @sports ||= @user.sports.where('participation_date > ?', 7.days.ago)
    end

end