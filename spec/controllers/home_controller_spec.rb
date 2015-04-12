require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "get #index" do
    subject { get :index }

    context "with no logged users" do
      it "should render home#index page" do
        expect(subject).to render_template("home/index")
      end
    end

    context "with logged users" do
      login_user
      it "should render user#index page" do
        expect(subject).to redirect_to(events_path)
      end
    end
  end
end
