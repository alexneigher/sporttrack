class Team < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :sports
  has_many :invitations
  belongs_to :organization
end
