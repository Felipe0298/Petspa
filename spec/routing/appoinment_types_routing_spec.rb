require "rails_helper"

RSpec.describe AppoinmentTypesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/appoinment_types").to route_to("appoinment_types#index")
    end

    it "routes to #new" do
      expect(get: "/appoinment_types/new").to route_to("appoinment_types#new")
    end

    it "routes to #show" do
      expect(get: "/appoinment_types/1").to route_to("appoinment_types#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/appoinment_types/1/edit").to route_to("appoinment_types#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/appoinment_types").to route_to("appoinment_types#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/appoinment_types/1").to route_to("appoinment_types#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/appoinment_types/1").to route_to("appoinment_types#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/appoinment_types/1").to route_to("appoinment_types#destroy", id: "1")
    end
  end
end
