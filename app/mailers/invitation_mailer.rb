class InvitationMailer < ApplicationMailer
  include Rails.application.routes.url_helpers

  def default_url_options
    Rails.application.config.action_mailer.default_url_options
  end

  def invitation_email(team, invitation)
    @team = team
    @invitation = invitation
    @email = invitation.email

    # just for local dev purposes (NOOP on heroku for now)
    @url  = "http://localhost:3000/invitations/#{invitation.authentication_token}"
    mail(to: @email, subject: "You've been invited to the #{team.name}")
  end

end