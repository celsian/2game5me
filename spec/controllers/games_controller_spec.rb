require 'rails_helper'

RSpec.describe GamesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns all games" do
      create_list(:game, 3)
      get :index

      expect(assigns(:games)).to eq(Game.all)
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

  describe "GET #show" do
    let(:game) { create(:game) }
    
    it "returns http success" do
      get :show, id: game.id

      expect(response).to render_template(:show)
    end
  end

  describe "POST #create" do
    let(:params) { { game: attributes } }
    let(:attributes) { { title: "ok", genre: "ok", description: "ok", release_date: "Soon™" } }

    it "redirects to created games path" do
      post :create, params

      expect(response).to redirect_to(game_path(Game.last))
    end

    it "creates the game" do
      post :create, params

      expect(assigns(:game)).to be_persisted 
    end
  end

  describe "GET #edit" do
    let(:game) { create(:game) }

    it "returns http success" do
      get :edit, id: game.id

      expect(response).to render_template(:edit)
    end

    it "selects the right game" do
      get :edit, id: game.id

      expect(assigns(:game)).to eq(game)
    end

    describe "PATCH #update" do
      let(:game) { create(:game) }
      let(:id) { game.id }
      let(:params) { { id: id, game: attributes } }
      let(:attributes) { { title: "ok", genre: "ok", description: "ok", release_date: "delayed" } }

      it "updates the proper game" do
        patch :update, params

        expect((game.reload).title).to eq("ok")
      end

      it "redirects to the game show page" do
        patch :update, params

        expect(response).to redirect_to(game_path(game))
      end
    end

  end
end
