class GamesController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]

    def index
      @games = Game.all
    end

    def new
      @game = Game.new
    end

    def create
      Game.create(game_params)
      current_user.games.create(game_params)
      redirect_to root_path
    end

    def show
      @game = Game.find(params[:id])
    end

    def edit
      @game = Game.find(params[:id])
    end

    def update
      @game = Game.find(params[:id])
      @game.update_attributes(game_params)
      redirect_to root_path
    end

    private

    def game_params
      params.require(:game).permit(:name, :rating, :review)
    end

end
