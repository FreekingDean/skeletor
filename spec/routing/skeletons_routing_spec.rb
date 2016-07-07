require "rails_helper"

RSpec.describe SkeletonsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/skeletons").to route_to("skeletons#index")
    end

    it "routes to #new" do
      expect(:get => "/skeletons/new").to route_to("skeletons#new")
    end

    it "routes to #show" do
      expect(:get => "/skeletons/1").to route_to("skeletons#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/skeletons/1/edit").to route_to("skeletons#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/skeletons").to route_to("skeletons#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/skeletons/1").to route_to("skeletons#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/skeletons/1").to route_to("skeletons#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/skeletons/1").to route_to("skeletons#destroy", :id => "1")
    end

  end
end
