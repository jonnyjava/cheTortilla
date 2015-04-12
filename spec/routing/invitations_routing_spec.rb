require "rails_helper"

RSpec.describe InvitationsController, type: :routing do
  describe "routing" do

    it "should route to #index" do
      expect(get: "/events/1/invitations").to route_to("invitations#index", event_id: "1")
    end

    it "should route to #new" do
      expect(get: "/events/1/invitations/new").to route_to("invitations#new", event_id: "1")
    end

    it "should route to #show" do
      expect(get: "/events/1/invitations/1").to route_to("invitations#show", id: "1", event_id: "1")
    end

    it "should route to #create" do
      expect(post: "/events/1/invitations").to route_to("invitations#create", event_id: "1")
    end

    it "should route to #destroy" do
      expect(delete: "/events/1/invitations/1").to route_to("invitations#destroy", id: "1", event_id: "1")
    end

    it "" do
      expect(get: "invitations/token_verification/1").to route_to("invitations#token_verification", token: "1")
    end
  end
end
