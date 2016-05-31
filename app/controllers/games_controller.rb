class GamesController < ApplicationController
  def index
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
      redirect_to root_path, flash: { success: "Game entry created." }
    else
      flash[:error] = "Error: #{@game.error_messages}"
      render :new
    end
  end

  private

  def game_params
    params.require(:game).permit(:title, :genre, :description)
  end
end
