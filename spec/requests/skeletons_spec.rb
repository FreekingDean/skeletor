require 'rails_helper'

RSpec.describe "Skeletons", type: :request do
  describe "GET /skeletons" do
    it "works! (now write some real specs)" do
      get skeletons_path
      expect(response).to have_http_status(200)
    end
  end
end
