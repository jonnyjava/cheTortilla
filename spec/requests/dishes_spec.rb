require 'rails_helper'

RSpec.describe "Dishes", type: :request do
  describe "GET /dishes" do
  	context "with logged user" do
      login_user
	    it "return status 200 calling dishes index" do
	      get dishes_path
	      expect(response.status).to be(200)
	    end
	  end

  	context "with no logged user" do
	    it "return status 302 calling dishes index" do
	      get dishes_path
	      expect(response.status).to be(302)
	    end
	  end
  end
end
