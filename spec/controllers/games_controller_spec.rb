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

end
