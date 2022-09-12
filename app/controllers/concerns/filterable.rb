module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter(filtering_params)
      # starts as an empty hash {}
      # filtering_params = {category: "music", genre: "DJ", price: "Free" }
      results = self.where(nil)
      # same as saying event.all / SELECT * FROM events


      filtering_params.each do |key, value|
        results = results.public_send(key, value) if value.present?
        # sending the key (which is category/genre/price). public_send - sending a message calling on
        # the key scope method in the model

        # results = result.category("music")
        # results = result.genre("DJ")
        # results = result.price("Free")
        end

        results
    end
  end

end
