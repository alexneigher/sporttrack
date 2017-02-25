class Sport < ApplicationRecord
  belongs_to :user


  # TODO normalized total hours cache_counter
  
  #after_save :update_hours_cache_counter
end
