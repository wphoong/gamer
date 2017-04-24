class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @game = Game.find(params[:game_id])
    @game.comments.create(comment_params.merge(user: current_user))
    redirect_to game_path(@game)
  end

  private

  def comment_params
    params.require(:comment).permit(:message, :rating)
  end
end
