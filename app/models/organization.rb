class Organization < ApplicationRecord
  has_many :teams
  has_many :users, through: :teams
  has_many :sports, through: :users
end
