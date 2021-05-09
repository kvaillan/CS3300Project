require "rails_helper"


RSpec.describe ProjectsController, type: :controller do
  
include Devise::Test::ControllerHelpers
sign_in @user
sign_in @user, scope: :admin

context "GET #index" do
    it "returns a success response" do
      get :index
      # expect(response.success).to eq(true)
      expect(response).to be_success
    end
  end

  context "GET #show" do
    let!(:project) { Project.create(name: "Test name", description: "Test description") }
    it "returns a success response" do
      get :show, params: { id: project }
      expect(response).to be_success
    end
  end
end