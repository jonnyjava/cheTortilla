require 'rails_helper'

RSpec.describe "Invitations", :type => :request do
  describe "GET event/:id//invitations" do
    context "with logged user" do
      let(:event) { FactoryGirl.create(:event) }
      login_user
      it "should return status 200 calling invitations index" do
        get event_invitations_path(event)
        expect(response.status).to be(200)
      end
    end
  end
end
