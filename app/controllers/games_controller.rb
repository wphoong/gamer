class GamesController < ApplicationController
    
    def index
      @games = Game.all
    end

    def new
      @game = Game.new
    end

    def create
      Game.create(game_params)
      redirect_to root_path
    end

    private

    def game_params
      params.require(:game).permit(:name, :rating, :review)
    end

end
