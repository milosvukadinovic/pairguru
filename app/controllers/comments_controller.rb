class CommentsController < ApplicationController

    def create
      if comment.save
        flash[:notice] = 'The comment was created.'
        redirect_to movie_path(movie)
      else
        flash[:error] = 'You already have a comment.'
        redirect_to movie_path(movie)
      end
    end
  
    def destroy
      comment = Comment.find(params[:id])
      comment.destroy
      redirect_to movie_path(movie)
      flash[:notice] = 'The comment was deleted.'
    end
  
    private

        def comment
            Comments::CreateService.new(params: comment_params, user: current_user, movie: movie).call
        end
  
        def movie
            Movie.find(params[:movie_id])
        end
  
        def comment_params
            params.require(:comment).permit(:content)
        end
  
  end 