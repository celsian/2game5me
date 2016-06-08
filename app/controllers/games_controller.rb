class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to game_path(@game), flash: { success: "Game entry created." }
    else
      flash[:error] = "Error: #{@game.error_messages}"
      render :new
    end
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    game = Game.find(params[:id])
    if game.update_attributes(game_params)
      redirect_to game_path(game), flash: { success: "Game entry updated." }
    else
      flash[:error] = "Error: #{game.error_messages}"
      render :edit
    end
  end

  private

  def game_params
    params.require(:game).permit(:id, :title, :genre, :description, :release_date)
  end
end
