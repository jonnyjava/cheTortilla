class InvitationsController < ApplicationController
  before_action :set_invitation, only: [:show, :destroy]
  before_action :set_event, except: :user_invitation

  def index
    @invitations = Invitation.by_event(@event)
  end

  def user_invitations
    @invitations = Invitation.by_email(current_user.email)
  end

  def show
  end

  def new
    @invitation = @event.invitations.new
  end

  def create
    @invitation = Invitation.new(invitation_params)
    if @invitation.save
      redirect_to @event, notice: 'Invitation was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @invitation.destroy
    redirect_to @event, notice: 'Invitation was successfully destroyed.'
  end

  def accept_invitation
    if @invitation = Invitation.find_by_token(params[:token])
      raise @invitation
    else
      #redirect_to error_404_path
      redirect_to root_path
    end
  end

  def reject_invitation
    if @invitation = Invitation.find_by_token(params[:token])
      raise @invitation
    else
      #redirect_to error_404_path
      redirect_to root_path
    end
  end


  private
    def set_invitation
      @invitation = Invitation.find(params[:id])
    end

    def set_event
      @event = Event.find_by_id(params[:event_id])
    end

    def invitation_params
      params.require(:invitation).permit(:email, :event_id)
    end
end
