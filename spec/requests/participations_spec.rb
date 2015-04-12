require 'rails_helper'

RSpec.describe "Participations", type: :request do
  describe "GET /participations" do
    context "with logged user" do
      login_user
      it "should return status 200 calling participations index" do
        get participations_path
        expect(response.status).to be(200)
      end
    end

    context "with logged user" do
      it "should return status 302 calling participations index" do
        get participations_path
        expect(response.status).to be(302)
      end
    end
  end
end
