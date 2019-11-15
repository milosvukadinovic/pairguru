describe Movie do
    it 'raises exception for undefined hostname' do
      expect(PairGuruMovieApi).to receive(:hostname).and_call_original
      expect(PairGuruMovieApi.hostname).to eq(ENV['PAIR_GURU_MOVIE_API_HOSTNAME'])
    end
  end