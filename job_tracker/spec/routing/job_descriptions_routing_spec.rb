require "rails_helper"

RSpec.describe JobDescriptionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/job_descriptions").to route_to("job_descriptions#index")
    end

    it "routes to #new" do
      expect(get: "/job_descriptions/new").to route_to("job_descriptions#new")
    end

    it "routes to #show" do
      expect(get: "/job_descriptions/1").to route_to("job_descriptions#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/job_descriptions/1/edit").to route_to("job_descriptions#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/job_descriptions").to route_to("job_descriptions#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/job_descriptions/1").to route_to("job_descriptions#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/job_descriptions/1").to route_to("job_descriptions#update", id: "1")
    end

    it "does not routes to #destroy" do
      expect(delete: "/job_descriptions/1").to_not route_to("job_descriptions#destroy", id: "1")
    end
  end
end
