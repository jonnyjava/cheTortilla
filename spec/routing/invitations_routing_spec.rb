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

    it "should route to #accepted" do
      expect(post: "invitations/accepted/1").to route_to("invitations#accepted", token: "1")
    end

    it "should route to #reject_invitation" do
      expect(post: "invitations/reject_invitation/1").to route_to("invitations#reject_invitation", token: "1")
    end
  end
end
