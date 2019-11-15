class Comment < ApplicationRecord
    belongs_to :movie
    belongs_to :user
    validates :content, presence: true
    validates :user_id, uniqueness: { scope: :movie_id, message: "You have a comment on this movie." }
  end 