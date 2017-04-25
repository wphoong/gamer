class GamesController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

    def index
      @games = Game.all
    end

    def new
      @game = Game.new
    end

    def create
      @game = current_user.games.create(game_params)
      if @game.valid?
        redirect_to root_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def show
      @game = Game.find(params[:id])
      @comment = Comment.new
    end

    def edit
      @game = Game.find(params[:id])

      if @game.user != current_user
        return render text: 'Not Allowed', status: :forbidden
      end
    end

    def update
      @game = Game.find(params[:id])
      if @game.user != current_user
        return render text: 'Not Allowed', status: :forbidden
      end

      @game.update_attributes(game_params)
      if @game.valid?
        redirect_to root_path
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @game = Game.find(params[:id])
      if @game.user != current_user
        return render text: 'Not Allowed', status: :forbidden
      end
      @game.destroy
      redirect_to root_path
    end

    private

    def game_params
      params.require(:game).permit(:name, :rating, :review)
    end

end
