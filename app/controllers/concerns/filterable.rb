module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter(filtering_params)
      # filtering_params = {category: "music", genre: "Pop"}
      results = self.where(nil)
      # same as saying Event.all / SELECT * FROM events
      filtering_params.each do |key, value|
        results = results.public_send(key, value) if value.present?

        # public_send calls the scope method (e.g. category or genre) defined in the Event model
        # passing the value only if it is present

        # results = results.category("Music").genre("Pop")
        # the scopes are chained but not dependent on each other

      end

      results
    end
  end
end

#   scope :category, ->(category) { where(category: category) }
#   scope :genre, ->(genre) { where(genre: genre) }
#   scope :price, ->(price) { where(price: price) }

# def index
#   @products = Product.where(nil) # an anonymous scope - same as as Event.all
#   filtering_params(params).each do |key, value|
#     @products = @products.public_send(key, value) if value.present?
#   end
# end

# private

# # A list of the param names that can be used for filtering the Product list
# def filtering_params(params)
#   params.slice(:status, :location, :starts_with)
# end
