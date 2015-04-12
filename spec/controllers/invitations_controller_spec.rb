require 'rails_helper'

RSpec.describe InvitationsController, :type => :controller do

  login_user
  let(:event) { FactoryGirl.create(:event) }
  let(:invitation) { FactoryGirl.create(:invitation, event_id: event.id) }
  let(:valid_attributes) { FactoryGirl.attributes_for(:invitation, event_id: event.id) }
  let(:invalid_attributes) { { event_id: nil, email: nil} }
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all invitations as @invitations" do
      invitation
      get :index, { event_id: event.id }, valid_session
      expect(assigns(:invitations)).to eq([invitation])
    end
  end

  describe "GET show" do
    it "assigns the requested invitation as @invitation" do
      invitation
      get :show, { event_id: event.id, id: invitation.to_param }, valid_session
      expect(assigns(:invitation)).to eq(invitation)
    end
  end

  describe "GET new" do
    it "assigns a new invitation as @invitation" do
      get :new, { event_id: event.id }, valid_session
      expect(assigns(:invitation)).to be_a_new(Invitation)
    end
  end

  describe "POST create" do
    context "with valid params" do
      let(:valid_post_params) { {event_id: event.id, invitation: valid_attributes} }
      it "creates a new Invitation" do
        expect {
          post :create, valid_post_params, valid_session
        }.to change(Invitation, :count).by(1)
      end

      it "assigns a newly created invitation as @invitation" do
        post :create, valid_post_params, valid_session
        expect(assigns(:invitation)).to be_a(Invitation)
        expect(assigns(:invitation)).to be_persisted
      end

      it "redirects to the created invitation" do
        post :create, valid_post_params, valid_session
        expect(response).to redirect_to(event)
      end
    end

    context "with invalid params" do
      let(:invalid_post_params) { {event_id: event.id, invitation: invalid_attributes} }
      it "assigns a newly created but unsaved invitation as @invitation" do
        post :create, invalid_post_params, valid_session
        expect(assigns(:invitation)).to be_a_new(Invitation)
      end

      it "re-renders the 'new' template" do
        post :create, invalid_post_params, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested invitation" do
      invitation
      expect {
        delete :destroy, {id: invitation.to_param, event_id: event.id}, valid_session
      }.to change(Invitation, :count).by(-1)
    end

    it "redirects to the invitations list" do
      invitation
      delete :destroy, {id: invitation.to_param, event_id: event.id}, valid_session
      expect(response).to redirect_to(event)
    end
  end

end
