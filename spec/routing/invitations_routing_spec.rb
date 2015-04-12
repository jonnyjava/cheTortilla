require "rails_helper"

RSpec.describe InvitationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(get: "/events/1/invitations").to route_to("invitations#index", event_id: "1")
    end

    it "routes to #new" do
      expect(get: "/events/1/invitations/new").to route_to("invitations#new", event_id: "1")
    end

    it "routes to #show" do
      expect(get: "/events/1/invitations/1").to route_to("invitations#show", id: "1", event_id: "1")
    end

    it "routes to #create" do
      expect(post: "/events/1/invitations").to route_to("invitations#create", event_id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/events/1/invitations/1").to route_to("invitations#destroy", id: "1", event_id: "1")
    end

  end
end
