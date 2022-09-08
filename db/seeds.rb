require "open-uri"
require 'httparty'
require 'nokogiri'
require 'byebug'

puts "Cleaning database ..."
Event.destroy_all
puts "1"
Venue.destroy_all
puts "Creating users, venues and events ..."

def scraper
  user_one = User.create!(
    first_name: "rob",
    last_name: "low",
    email: "evententhusiast123@mail.com",
    password: "stumbl",
    age: rand(15..60)
  )
  puts "created #{user_one[:first_name]} #{user_one[:last_name]}!"

  url = "https://www.songkick.com/metro-areas/24426-uk-london?page=1#metro-area-calendar"
  unparsed_page = HTTParty.get(url)
  parsed_page = Nokogiri::HTML(unparsed_page)
  event_listings = parsed_page.css('li.event-listings-element')

  event_listings.each do |event_listing|
    # file = URI.open("https:#{event_listing.css('div.event-details-wrapper').css('img')[0].attributes['data-src'].value}") #cloudinary
    venue_one = Venue.create(
      name: event_listing.css('div.artists-venue-location-wrapper').css('a.venue-link').text,
      location: "#{event_listing.css('div.artists-venue-location-wrapper').css('a.venue-link').text}, #{event_listing.css('div.artists-venue-location-wrapper').css('span.city-name').text}",
      photo: "",
      website: "venue website url goes here",
      facebook: "facebook icon url goes here",
      instagram: "instagram icon url goes here",
      about: "venue description / overview goes here",
      user: user_one
    )
    puts "created #{venue_one[:name]}!"
    event = Event.new(
      name: event_listing.css('div.artists-venue-location-wrapper').css('strong').text,
      mini_description: "mini description goes here",
      producer: "Support: #{event_listing.css('div.artists-venue-location-wrapper').css('span.support').text}",
      price: "£#{rand(5..50)}",
      about: "full description / overview goes here",
      category: %w(music cinema art sport).sample,
      image: "https:#{event_listing.css('div.event-details-wrapper').css('img')[0].attributes['data-src'].value}",
      venue: venue_one
    )
    # event.image.attach(io: file, filename: "image.jpg", content_type: "image/jpg") #cloudinary
    event.save!
    puts "created #{event[:name]}!"
  end
end

scraper
puts "done"
