class Teams::InvitationsController < ApplicationController
  before_filter :find_team, only: [:new, :create]

  def new
    @invitation = @team.invitations.new()
  end

  def create
    #random "enough", maybe check db for uniqueness in V2
    token = SecureRandom.uuid
    @invitation = @team
                    .invitations
                    .build(invitation_params.merge(authentication_token: token))

    @invitation.associate_team_and_build_user(@team)

    @invitation.save #propagates down to user

    InvitationMailer.invitation_email(@team, @invitation).deliver
  end

  def redeem
    @invitation = Invitation.find_and_authenticate(params[:authentication_token])
    if !@invitation
      flash[:error] = 'Whoops this link has expired'
      redirect_to root_path
    else
      flash[:success] = 'Welcome! This is your profile page. Add some information!'
      @invitation.mark_redeemed!
      redirect_to user_path(@invitation.user)
    end
  end

  private

    def find_team
      @team = Team.find(params[:team_id])
    end

    def invitation_params
      params.require(:invitation).permit(:email, :name)
    end

end