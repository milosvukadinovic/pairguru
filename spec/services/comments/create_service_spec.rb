require "rails_helper"

describe Comments::CreateService, type: :service do
  subject { described_class.new(params: params, movie: movie).call }

  let (:params) { { "content" => content } }
  let (:content) { "super film" }
  let (:movie) { build_stubbed(:movie) }

  context "when the comment object is created" do
    describe "#call" do
      it "is expected to assign attributes to comment" do
        expect(subject).to have_attributes(content: "super film",
                                           movie_id: movie.id)
      end
    end
  end
end