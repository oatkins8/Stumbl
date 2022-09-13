require "open-uri"
require 'httparty'
require 'nokogiri'
require 'byebug'
require 'faker'

puts "Cleaning database ..."
Event.destroy_all
puts "1"
Venue.destroy_all
puts "Creating users, venues and events ..."
User.destroy_all

USER_ONE = User.create!(
  first_name: "rob",
  last_name: "low",
  email: "evententhusiast12345@mail.com",
  password: "stumbl",
  age: rand(15..60)
)
puts "created #{USER_ONE[:first_name]} #{USER_ONE[:last_name]}!"

# url = "https://www.songkick.com/metro-areas/24426-uk-london?page=1#metro-area-calendar"
# unparsed_page = URI.open(url)
# parsed_page = Nokogiri::HTML(unparsed_page)
# event_listings = parsed_page.css('li.event-listings-element')

# event_listings.each do |event_listing|
#   file = URI.open("https:#{event_listing.css('div.event-details-wrapper').css('img')[0].attributes['data-src'].value}")
#   venue_one = Venue.new(
#     name: event_listing.css('div.artists-venue-location-wrapper').css('a.venue-link').text,
#     location: "#{event_listing.css('div.artists-venue-location-wrapper').css('a.venue-link').text}, #{event_listing.css('div.artists-venue-location-wrapper').css('span.city-name').text}",
#     website: "venue website url goes here",
#     facebook: "facebook icon url goes here",
#     instagram: "instagram icon url goes here",
#     about: "venue description / overview goes here",
#     user: user_one
#   )
#   venue_one.photos.attach(io: file, filename: "venue_image_.jpg", content_type: "image/jpg")
#   venue_one.save!
#   puts "created #{venue_one[:name]}!"
#   event = Event.new(
#     name: event_listing.css('div.artists-venue-location-wrapper').css('strong').text,
#     mini_description: "mini description goes here",
#     producer: "Support: #{event_listing.css('div.artists-venue-location-wrapper').css('span.support').text}",
#     price: rand(5..50),
#     about: "full description / overview goes here",
#     category: %w(music cinema art sport).sample,
#     venue: venue_one,
#     date: "Mon, 12 Sep 2022",
#     time: "Sat, 01 Jan 2000 14:06:00.000000000 UTC +00:00"
#   )
#   file = URI.open("https:#{event_listing.css('div.event-details-wrapper').css('img')[0].attributes['data-src'].value}")
#   event.images.attach(io: file, filename: "venue_image_.jpg", content_type: "image/jpg")
#   event.save!
#   puts "created #{event[:name]}!"
# end

# MANUAL SEED ---------------------------------------


def event_one
  venue = Venue.new(
    name: "Hoxton Grill",
    location: "81 Great Eastern Street Hoxton Hotel, London EC2A 3HU England",
    website: "https://www.hoxtongrill.com/",
    facebook: "https://www.facebook.com/pages/Hoxton-Grill/157964827593237?ref=br_tf",
    instagram: "https://www.instagram.com/hoxtongrill/",
    about: "Bar, International, European",
    user: USER_ONE
  )
  v_file = URI.open("https://thehoxton.com/wp-content/uploads/sites/5/2020/06/HOXTON_GRILL_SHOREDITCH_061117_5044.jpg")
  l_file = URI.open("https://thehoxton.com/wp-content/uploads/sites/5/2020/06/HOXTON_GRILL_SHOREDITCH_061117_5044.jpg")
  venue.photos.attach(io: v_file, filename: "venue_image_.jpg", content_type: "image/jpg")
  venue.logo.attach(io: l_file, filename: "venue_image_.jpg", content_type: "image/jpg")
  venue.save!
  puts "created #{venue[:name]}!"
  event = Event.new(
    name: "Mahjong Happy Hour x Lan Su Gardens",
    mini_description: "Lan Su Gardens",
    producer: "Lan Su Gardens",
    price: 0,
    category: "food & drink",
    venue: venue,
    time: Faker::Time.forward(days: 5,  period: :evening, format: :long),
    about: "Join us for a game of Mahjong once a month thanks to our pals at Lan Su Gardens. Plus, we've got cocktails on the cheap from Lovely Rita."
  )
  e_file = URI.open("https://thehoxton.com/wp-content/uploads/sites/5/2020/06/HOXTON_GRILL_SHOREDITCH_061117_5044.jpg")
  event.images.attach(io: e_file, filename: "venue_image_.jpg", content_type: "image/jpg")
  event.save!
  puts "created #{event[:name]}!"
end
event_one

def event_two
  venue = Venue.new(
    name: "Cocotte Shoreditch",
    location: "8 Hoxton Square, London N1 6NU England",
    website: "http://mycocotte.uk/",
    facebook: "http://mycocotte.uk/",
    about: "French, European, British",
    user: USER_ONE
  )
  v_file = URI.open("https://images.squarespace-cdn.com/content/v1/5ae84b394611a0664801a2ab/1630486392785-12KFWZM8GX2WLRBMZRNM/Shoreditch+terrace_Cocotte+%281%29+2.jpg?format=1000w")
  l_file = URI.open("https://images.squarespace-cdn.com/content/v1/5ae84b394611a0664801a2ab/1630486392785-12KFWZM8GX2WLRBMZRNM/Shoreditch+terrace_Cocotte+%281%29+2.jpg?format=1000w")
  venue.photos.attach(io: v_file, filename: "venue_image_.jpg", content_type: "image/jpg")
  venue.logo.attach(io: l_file, filename: "venue_image_.jpg", content_type: "image/jpg")
  venue.save!
  puts "created #{venue[:name]}!"
  event = Event.new(
    name: "PDX Jazz with Lovely Rita",
    mini_description: "Lovely Rita",
    producer: "Lan Su Gardens",
    price: 10,
    category: "Music",
    venue: venue,
    time: Faker::Time.forward(days: 5,  period: :evening, format: :long),
    about: "PDX Jazz performing with Lovely Rita int the lobby every Thursday with happy hour priced cocktails"
  )
  e_file = URI.open("https://thehoxton.com/wp-content/uploads/sites/5/2022/06/hoxrun3-4.jpg?resize=900,700&quality=90")
  event.images.attach(io: e_file, filename: "venue_image_.jpg", content_type: "image/jpg")
  event.save!
  puts "created #{event[:name]}!"
end
event_two

def event_three
  venue = Venue.new(
    name: "Brewhouse & Kitchen - Hoxton",
    location: "397-400 Geffrye Street, London E2 8HZ England",
    website: "https://www.brewhouseandkitchen.com/venue/hoxton/",
    instagram: "https://www.instagram.com/brewhouse_and_kitchen",
    facebook: "https://www.facebook.com/bkhoxton",
    about: "Bar, British, Brew Pub, Pub",
    user: USER_ONE
  )
  v_file = URI.open("https://www.brewhouseandkitchen.com/wp-content/uploads/2018/06/BK-Hoxton-JustinDeSouza-143-1024x683.jpg")
  l_file = URI.open("https://www.brewhouseandkitchen.com/wp-content/themes/wppt/assets/img/logo.png")
  venue.photos.attach(io: v_file, filename: "venue_image.jpg", content_type: "image/jpg")
  venue.logo.attach(io: l_file, filename: "venue_logo.jpg", content_type: "image/png")
  venue.save!
  puts "created #{venue[:name]}!"
  event = Event.new(
    name: "BREWERY EXPERIENCE DAY",
    mini_description: "Spend the day brewing a beer with one of our award-winning brewers!",
    producer: "Brewhouse Brewers",
    price: 95,
    category: "Food & Drink",
    venue: venue,
    time: Faker::Time.forward(days: 5,  period: :evening, format: :long),
    about: "Our microbrewery sits right in the heart of our beautiful brewpub, you will be treated to breakfast, lunch and a lot of beers throughout the day."
  )
  e_file = URI.open("https://www.brewhouseandkitchen.com/wp-content/uploads/2020/02/Brewery-Day1-1024x683.jpg")
  event.images.attach(io: e_file, filename: "venue_image_.jpg", content_type: "image/jpg")
  event.save!
  puts "created #{event[:name]}!"
end
event_three

def event_four
  venue = Venue.new(
    name: "Busaba Hoxton Square",
    location: "319 Old Street Hoxton, London EC1V 9LE England",
    website: "http://www.busaba.com/locations/busaba-hoxton-square",
    facebook: "https://www.instagram.com/busabaeathai/",
    instagram: "https://www.instagram.com/hoxtongrill/",
    about: "Asian, Thai, Vegetarian, Friendly",
    user: USER_ONE
  )
  v_file = URI.open("https://res.cloudinary.com/tf-lab/image/upload/w_600,h_337,c_fill,q_auto,f_auto/restaurant/e0a63bc2-f99b-48cf-a152-d143be822ed0/4689a65e-872b-4d52-8410-ffdc47061589.jpg")
  l_file = URI.open("https://www.busaba.com/wp-content/themes/busaba-reskin-2019/assets/images/logo.svg")
  venue.photos.attach(io: v_file, filename: "venue_image.jpg", content_type: "image/jpg")
  venue.logo.attach(io: l_file, filename: "venue_logo.jpg", content_type: "image/svg")
  venue.save!
  puts "created #{venue[:name]}!"
  event = Event.new(
    name: "Climb & Dine at Busaba",
    mini_description: "A delicious Two-course meal at Busaba after climbing the 02",
    producer: "02 x Busaba",
    price: 95,
    category: "Food & Drink",
    venue: venue,
    time: Date.today,
    about: "Up at The O2 takes you on an exhilarating 90-minute climb over the roof of the world’s most popular entertainment venue, then join us for a delicious two-course meal at Busaba."
  )
  e_file = URI.open("https://cdn.getyourguide.com/img/tour/5dce8e9d8d4e4.jpeg/98.jpg")
  event.images.attach(io: e_file, filename: "venue_image_.jpg", content_type: "image/jpg")
  event.save!
  puts "created #{event[:name]}!"
end
event_four


# v_four = Venue.new(
#   name: "Queen of Hoxton",
#   location: "1 Curtain Road Hoxton, London EC2A 3JX England",
#   website: "https://queenofhoxton.com/",
#   facebook: "https://www.facebook.com/thequeenofhoxton",
#   instagram: "https://www.instagram.com/queenofhoxtonldn/",
#   about: "Bar",
#   user: user_one
# )
# file = URI.open("https://queenofhoxton.com/wp-content/uploads/2022/01/Untitled-design-30-1024x1024.png")
# v_four.photos.attach(io: file, filename: "venue_image_.jpg", content_type: "image/jpg")
# v_four.save!
# puts "created #{v_four[:name]}!"


# v_five = Venue.new(
#   name: "Hoxton Cabin",
#   location: "132 Kingsland Road, London E2 8DP England",
#   website: "https://www.hoxtoncabin.com/",
#   facebook: "https://www.facebook.com/hoxtoncabin/",
#   instagram: "https://www.instagram.com/hoxtoncabin/?hl=en",
#   about: "Brew Pub, Bar, Cafe, British, Pub",
#   user: user_one
# )
# file = URI.open("https://static.wixstatic.com/media/8602e5_71d6cf4ddfb24a9abb5f031c2535b27e~mv2.jpg/v1/fill/w_640,h_494,fp_0.50_0.50,q_80,usm_0.66_1.00_0.01,enc_auto/8602e5_71d6cf4ddfb24a9abb5f031c2535b27e~mv2.jpg")
# v_five.photos.attach(io: file, filename: "venue_image_.jpg", content_type: "image/jpg")
# v_five.save!
# puts "created #{v_five[:name]}!"


# v_seven = Venue.new(
#   name: "MEATliquor Shoreditch",
#   location: "15 Hoxton Market, London N1 6HG England",
#   website: "https://meatliquor.com/restaurant/meatliquor-shoreditch/",
#   facebook: "https://www.facebook.com/MEATliquorShoreditch/",
#   instagram: "https://www.instagram.com/meatgram/",
#   about: "American, Bar",
#   user: user_one
# )
# file = URI.open("https://meatliquor.com/wp-content/uploads/2020/05/MeatMission-Hoxton-2.jpg")
# v_seven.photos.attach(io: file, filename: "venue_image_.jpg", content_type: "image/jpg")
# v_seven.save!
# puts "created #{v_seven[:name]}!"


# v_eight = Venue.new(
#   name: "Bunbunbun Vietnamese Food",
#   location: "134B Kingsland Road, London E2 8DY England",
#   website: "http://www.bunbunbun.co/",
#   facebook: "https://www.facebook.com/bunldn",
#   instagram: "https://instagram.com/bunldn",
#   about: "Asian, Vietnamese",
#   user: user_one
# )
# file = URI.open("https://b.zmtcdn.com/data/pictures/4/6126604/c2f42686b5a8392e9fd8249aa1f24ede.jpg")
# v_eight.photos.attach(io: file, filename: "venue_image_.jpg", content_type: "image/jpg")
# v_eight.save!
# puts "created #{v_eight[:name]}!"


# v_nine = Venue.new(
#   name: "Troy Bar",
#   location: "10 Hoxton Street, London N1 6NG England",
#   website: "https://troybar.co.uk/",
#   facebook: "https://www.facebook.com/troybarofficialpage",
#   instagram: "http://www.instagram.com/troybarofficial/",
#   about: "Lunch, live music",
#   user: user_one
# )
# file = URI.open("https://live.staticflickr.com/8534/8695240383_32c70cde32_b.jpg")
# v_nine.photos.attach(io: file, filename: "venue_image_.jpg", content_type: "image/jpg")
# v_nine.save!
# puts "created #{v_nine[:name]}!"


# v_ten = Venue.new(
#   name: "Gloria",
#   location: "54-56 Great Eastern Street, London EC2A 3QR England",
#   website: "https://www.bigmammagroup.com/en/trattorias/gloria",
#   facebook: "https://www.facebook.com/bigmammagroup",
#   instagram: "https://www.instagram.com/bigmamma.uk/",
#   about: "Italian, Pizza, Mediterranean, European, Neapolitan",
#   user: user_one
# )
# file = URI.open("https://cdn.vox-cdn.com/thumbor/WGp5O8-ipmVCVa9-N-Evi2ZOGmo=/1400x1050/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/13752034/Gloria_Italian_trattoria_shoreditch_restaurant_margherita_pizza.0.jpg")
# v_ten.photos.attach(io: file, filename: "venue_image_.jpg", content_type: "image/jpg")
# v_ten.save!
# puts "created #{v_ten[:name]}!"


# # scraper

# puts "done"
