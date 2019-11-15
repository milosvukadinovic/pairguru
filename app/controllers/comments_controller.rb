class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    return redirect_to movie_path(movie), notice: "Comment was added!" if comment.save
    redirect_to movie_path(movie), alert: "You already added your comment!"
  end

  def destroy
    find_comment.destroy
    redirect_to movie_path(movie), notice: "Comment was removed!"
  end

  private

  def comment
    @comment ||= Comments::CreateService.new(params: comment_params, movie: movie).call
  end

  def movie
    @movie ||= Movie.find(params[:movie_id])
  end

  def find_comment
    @find_comment ||= Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content).merge!(user_id: current_user.id)
  end
end