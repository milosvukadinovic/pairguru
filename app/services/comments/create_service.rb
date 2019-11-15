module Comments
    class CreateService
  
      def initialize(params:, user:, movie:)
        @params = params
        @user = user
        @movie = movie
      end
  
      def call
        create
      end
  
    private
  
        attr_accessor :params, :user, :movie
  
        def create
            comment = Comment.new(params)
            comment.user = user
            comment.movie = movie
            comment
        end
  
    end
  end