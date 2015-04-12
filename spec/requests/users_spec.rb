require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
  	context "with logged user" do
    login_user

	    it "should return status 200 calling users index" do
	      get users_path
	      expect(response.status).to be(200)
	    end
	  end

  	context "with no logged user" do
	    it "should return status 302 calling users index" do
	      get users_path
	      expect(response.status).to be(302)
	    end
		end
  end
end
