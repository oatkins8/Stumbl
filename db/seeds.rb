require "open-uri"
require 'httparty'
require 'nokogiri'
require 'byebug'

puts "Cleaning database ..."
Event.destroy_all
puts "1"
Venue.destroy_all
puts "Creating users, venues and events ..."
User.destroy_all

def scraper
  user_one = User.create!(
    first_name: "rob",
    last_name: "low",
    email: "evententhusiast12345@mail.com",
    password: "stumbl",
    age: rand(15..60)
  )
  puts "created #{user_one[:first_name]} #{user_one[:last_name]}!"

  url = "https://www.songkick.com/metro-areas/24426-uk-london?page=1#metro-area-calendar"
  unparsed_page = URI.open(url)
  parsed_page = Nokogiri::HTML(unparsed_page)
  event_listings = parsed_page.css('li.event-listings-element')

  event_listings.each_with_index do |event_listing, i|
    p "#{event_listing.css('div.event-details-wrapper').css('img')[0].attributes['data-src'].value}"
    file = URI.open("https:#{event_listing.css('div.event-details-wrapper').css('img')[0].attributes['data-src'].value}")
    venue_one = Venue.new(
      name: event_listing.css('div.artists-venue-location-wrapper').css('a.venue-link').text,
      location: "#{event_listing.css('div.artists-venue-location-wrapper').css('a.venue-link').text}, #{event_listing.css('div.artists-venue-location-wrapper').css('span.city-name').text}",
      website: "venue website url goes here",
      facebook: "facebook icon url goes here",
      instagram: "instagram icon url goes here",
      about: "venue description / overview goes here",
      user: user_one
    )
    venue_one.photos.attach(io: file, filename: "venue_image_#{i}.jpg", content_type: "image/jpg")
    venue_one.save!
    puts "created #{venue_one[:name]}!"
    event = Event.new(
      name: event_listing.css('div.artists-venue-location-wrapper').css('strong').text,
      mini_description: "mini description goes here",
      producer: "Support: #{event_listing.css('div.artists-venue-location-wrapper').css('span.support').text}",
      price: "£#{rand(5..50)}",
      about: "full description / overview goes here",
      category: %w(music cinema art sport).sample,
      venue: venue_one,
      cash: true,
      card: true,
      date: "Mon, 12 Sep 2022",
      time: "Sat, 01 Jan 2000 14:06:00.000000000 UTC +00:00"
    )
    file = URI.open("https:#{event_listing.css('div.event-details-wrapper').css('img')[0].attributes['data-src'].value}")
    event.images.attach(io: file, filename: "venue_image_#{i * i}.jpg", content_type: "image/jpg")
    event.save!
    puts "created #{event[:name]}!"
  end
end

scraper
puts "done"
