class InvitationsController < ApplicationController
  before_action :set_invitation, only: [:show, :destroy]
  before_action :set_event

  def index
    @invitations = Invitation.all
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
