require 'rails_helper'

RSpec.describe GamesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    let(:game) { create(:game) }
    
    it "returns http success" do
      get :show, id: game.id

      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new

      expect(response).to render_template(:new)
    end

    it "creates a game" do
      get :new

      expect(assigns(:game)).to_not be_nil
    end
  end

  describe "POST #create" do
    let(:params) { { game: attributes } }
    let(:attributes) { { title: "ok", genre: "ok", description: "ok" } }

    it "redirects to root path" do
      post :create, params

      expect(response).to redirect_to root_path
    end

    it "creates the game" do
      post :create, params

      expect(assigns(:game)).to be_persisted 
    end
  end
end
