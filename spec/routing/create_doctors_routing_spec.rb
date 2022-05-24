require "rails_helper"

RSpec.describe CreateDoctorsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/create_doctors").to route_to("create_doctors#index")
    end

    it "routes to #new" do
      expect(get: "/create_doctors/new").to route_to("create_doctors#new")
    end

    it "routes to #show" do
      expect(get: "/create_doctors/1").to route_to("create_doctors#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/create_doctors/1/edit").to route_to("create_doctors#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/create_doctors").to route_to("create_doctors#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/create_doctors/1").to route_to("create_doctors#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/create_doctors/1").to route_to("create_doctors#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/create_doctors/1").to route_to("create_doctors#destroy", id: "1")
    end
  end
end
