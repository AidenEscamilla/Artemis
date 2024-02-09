require "rails_helper"

RSpec.describe SupportingDocumentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/supporting_documents").to route_to("supporting_documents#index")
    end

    it "routes to #new" do
      expect(get: "/supporting_documents/new").to route_to("supporting_documents#new")
    end

    it "routes to #show" do
      expect(get: "/supporting_documents/1").to route_to("supporting_documents#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/supporting_documents/1/edit").to route_to("supporting_documents#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/supporting_documents").to route_to("supporting_documents#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/supporting_documents/1").to route_to("supporting_documents#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/supporting_documents/1").to route_to("supporting_documents#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/supporting_documents/1").to route_to("supporting_documents#destroy", id: "1")
    end
  end
end
