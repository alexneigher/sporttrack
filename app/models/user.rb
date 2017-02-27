class User < ApplicationRecord
  enum units_preference: [ :metric, :imperial ]
  #TODO implement unit rendering and selection options

  has_and_belongs_to_many :teams
  has_many :sports

end
