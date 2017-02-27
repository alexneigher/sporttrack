class Invitation < ApplicationRecord
  belongs_to :team
  belongs_to :user


  def self.find_for_redemption(token)
    @invitation = self.where(authentication_token: token, authentication_token_redeemed_at: nil).last
  end

  def mark_redeemed!
    self.update(authentication_token_redeemed_at: Date.current, authentication_token: nil)
  end

  def associate_team_and_build_user(team)
    user = self.build_user(email: self.email, name: self.name)
    user.teams << team
    user.save
  end
end
