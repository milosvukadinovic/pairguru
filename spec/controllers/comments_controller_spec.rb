require "rails_helper"
require "pry"

describe CommentsController, type: :controller do
  
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:movie) { create(:movie) }
  let(:comment) { create(:comment, movie_id: movie.id, user_id: user.id) }
  let(:params) { { comment: { content: comment.content }, movie_id: comment.movie.id } }

  describe "POST /movies/:movie_id/comments" do
    subject { post(:create, params: params) }

    before do
      sign_in(user)
      user.confirm
    end

    context "when user is authenticated and comments twice the same movie" do
      it "responds with status 200 " do
        expect(response.status).to eq(200)
      end

      it "does not save comment" do
        subject
        expect { subject }.to change(Comment, :count).by(0)
      end

      it "responds with alert" do
        subject
        expect(flash[:alert]).to match "You already added your comment!"
      end

      context "when another user comments the same movie" do
        let!(:comment) { create(:comment, movie_id: movie.id, user_id: user2.id) }

        it "saves the comment" do
          expect { subject }.to change(Comment, :count).by(1)
        end

        it "responds with notice" do
          subject
          expect(flash[:notice]).to match "Comment was added!"
        end
      end

      describe "DESTROY /movies/:movie_id/comments/:id" do
        let!(:params) { { movie_id: movie.id, id: comment.id } }
        it "deletes the created comment" do
          expect { delete(:destroy, params: params) }.to change(Comment, :count).by(-1)
        end
      end
    end
  end
end