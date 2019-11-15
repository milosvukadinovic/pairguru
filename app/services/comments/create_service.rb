module Comments
  class CreateService
    def initialize(params:, movie:)
      @params = params
      @movie = movie
    end

    def call
      create
    end

    private

    attr_accessor :params, :movie

    def create
      movie.comments.create(params)
    end
  end
end