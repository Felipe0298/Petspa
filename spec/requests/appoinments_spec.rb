require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/appoinments", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Appoinment. As you add validations to Appoinment, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Appoinment.create! valid_attributes
      get appoinments_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      appoinment = Appoinment.create! valid_attributes
      get appoinment_url(appoinment)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_appoinment_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      appoinment = Appoinment.create! valid_attributes
      get edit_appoinment_url(appoinment)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Appoinment" do
        expect {
          post appoinments_url, params: { appoinment: valid_attributes }
        }.to change(Appoinment, :count).by(1)
      end

      it "redirects to the created appoinment" do
        post appoinments_url, params: { appoinment: valid_attributes }
        expect(response).to redirect_to(appoinment_url(Appoinment.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Appoinment" do
        expect {
          post appoinments_url, params: { appoinment: invalid_attributes }
        }.to change(Appoinment, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post appoinments_url, params: { appoinment: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested appoinment" do
        appoinment = Appoinment.create! valid_attributes
        patch appoinment_url(appoinment), params: { appoinment: new_attributes }
        appoinment.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the appoinment" do
        appoinment = Appoinment.create! valid_attributes
        patch appoinment_url(appoinment), params: { appoinment: new_attributes }
        appoinment.reload
        expect(response).to redirect_to(appoinment_url(appoinment))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        appoinment = Appoinment.create! valid_attributes
        patch appoinment_url(appoinment), params: { appoinment: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested appoinment" do
      appoinment = Appoinment.create! valid_attributes
      expect {
        delete appoinment_url(appoinment)
      }.to change(Appoinment, :count).by(-1)
    end

    it "redirects to the appoinments list" do
      appoinment = Appoinment.create! valid_attributes
      delete appoinment_url(appoinment)
      expect(response).to redirect_to(appoinments_url)
    end
  end
end
