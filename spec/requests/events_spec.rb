require 'rails_helper'

RSpec.describe "Events", :type => :request do
  describe "GET /events" do
    context "with logged user" do
      login_user
      it "should return status 200 calling events index" do
        get events_path
        expect(response.status).to be(200)
      end
    end

    context "with no logged user" do
      it "should return status 302 calling events index" do
        get events_path
        expect(response.status).to be(302)
      end
    end
  end
end
