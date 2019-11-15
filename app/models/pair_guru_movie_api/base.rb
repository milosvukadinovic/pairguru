module PairGuruMovieApi
    class Base < JsonApiClient::Resource
      self.site = "https://pairguru-api.herokuapp.com/api/v1/"
  
      def self.cached_find(*args)
        Rails.cache.fetch("https://pairguru-api.herokuapp.com/api/v1/#{args.join('/')}", expires_in: 1.hour) do
          self.find(*args)
        end
      end
    end
  end 