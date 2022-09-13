require "open-uri"
require "httparty"
require 'nokogiri'
require 'byebug'

def scraper
  url = "https://www.eventbrite.co.uk/"
  unparsed_page = HTTParty.get(url)
  parsed_page = Nokogiri::HTML(unparsed_page)
  byebug
end
scraper
