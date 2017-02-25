module UsersHelper

  def percent_of_total_hours(sport, total)
    (sport.participation_hours.to_f / total) * 100
  end
end
