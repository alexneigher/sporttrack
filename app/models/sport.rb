class Sport < ApplicationRecord
  belongs_to :user
  belongs_to :team
  #normalized total hours cache_counter
  after_save :sync_user_hours_cache_counter

  CATEGORIES = ['soccer', 'football', 'baseball', 'lacrosse', 'running', 'swimming', 'rowing', 'cycling', 'chess', 'basketball']

  private
    #not a real cache counter, but hack using lifecycle event
    def sync_user_hours_cache_counter
      hours = self.user.sports.sum(:participation_hours)
      self.user.update(total_participation_hours: hours)
    end
end
