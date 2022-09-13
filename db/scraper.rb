require "open-uri"
require "httparty"
require 'nokogiri'
require 'byebug'

# def scraper
#   url = "https://www.eventbrite.co.uk/"
#   unparsed_page = HTTParty.get(url)
#   parsed_page = Nokogiri::HTML(unparsed_page)
#   byebug
# end
# scraper

# venues = []
# v_one = Venue.new(
#   name: "Hoxton Grill",
#   location: "81 Great Eastern Street Hoxton Hotel, London EC2A 3HU England",
#   website: "https://www.hoxtongrill.com/",
#   facebook: "https://www.facebook.com/pages/Hoxton-Grill/157964827593237?ref=br_tf",
#   instagram: "https://www.instagram.com/hoxtongrill/",
#   about: "Bar, International, European",
#   user: user_one
# )
# file = URI.open("https://thehoxton.com/wp-content/uploads/sites/5/2020/06/HOXTON_GRILL_SHOREDITCH_061117_5044.jpg")
# event.images.attach(io: file, filename: "venue_image_.jpg", content_type: "image/jpg")
# event.save!
# venues << v_one

# v_two = Venue.new(
#   name: "Cocotte Shoreditch",
#   location: "8 Hoxton Square, London N1 6NU England",
#   website: "http://mycocotte.uk/",
#   facebook: "http://mycocotte.uk/",
#   instagram:,
#   about: "French, European, British",
#   user: user_one
# )
# file = URI.open("https://images.squarespace-cdn.com/content/v1/5ae84b394611a0664801a2ab/1630486392785-12KFWZM8GX2WLRBMZRNM/Shoreditch+terrace_Cocotte+%281%29+2.jpg?format=1000w")
# event.images.attach(io: file, filename: "venue_image_.jpg", content_type: "image/jpg")
# event.save!
# venues << v_two

# v_three = Venue.new(
#   name: "Busaba Hoxton Square",
#   location: "319 Old Street Hoxton, London EC1V 9LE England",
#   website: "http://www.busaba.com/locations/busaba-hoxton-square",
#   facebook: "https://www.instagram.com/busabaeathai/",
#   instagram: "https://www.instagram.com/hoxtongrill/",
#   about: "Asian, Thai, Vegetarian, Friendly",
#   user: user_one
# )
# file = URI.open("https://res.cloudinary.com/tf-lab/image/upload/w_600,h_337,c_fill,q_auto,f_auto/restaurant/e0a63bc2-f99b-48cf-a152-d143be822ed0/4689a65e-872b-4d52-8410-ffdc47061589.jpg")
# event.images.attach(io: file, filename: "venue_image_.jpg", content_type: "image/jpg")
# event.save!
# venues << v_three

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
# event.images.attach(io: file, filename: "venue_image_.jpg", content_type: "image/jpg")
# event.save!
# venues << v_four

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
# event.images.attach(io: file, filename: "venue_image_.jpg", content_type: "image/jpg")
# event.save!
# venues << v_five

# v_five = Venue.new(
#   name: "Brewhouse & Kitchen - Hoxton",
#   location: "397-400 Geffrye Street, London E2 8HZ England",
#   website: "https://www.brewhouseandkitchen.com/venue/hoxton/",
#   about: "Brew Pub, Bar, Cafe, British, Pub",
#   user: user_one
# )
# file = URI.open("https://www.brewhouseandkitchen.com/wp-content/uploads/2018/06/BK-Hoxton-JustinDeSouza-143-1024x683.jpg")
# event.images.attach(io: file, filename: "venue_image_.jpg", content_type: "image/jpg")
# event.save!
# venues << v_five

# v_six = Venue.new(
#   name: "MEATliquor Shoreditch",
#   location: "15 Hoxton Market, London N1 6HG England",
#   website: "https://meatliquor.com/restaurant/meatliquor-shoreditch/",
#   facebook: "https://www.facebook.com/MEATliquorShoreditch/",
#   instagram: "https://www.instagram.com/meatgram/",
#   about: "American, Bar",
#   user: user_one
# )
# file = URI.open("https://meatliquor.com/wp-content/uploads/2020/05/MeatMission-Hoxton-2.jpg")
# event.images.attach(io: file, filename: "venue_image_.jpg", content_type: "image/jpg")
# event.save!
# venues << v_six

# v_seven = Venue.new(
#   name: "Bunbunbun Vietnamese Food",
#   location: "134B Kingsland Road, London E2 8DY England",
#   website: "http://www.bunbunbun.co/",
#   facebook: "https://www.facebook.com/bunldn",
#   instagram: "https://instagram.com/bunldn",
#   about: "Asian, Vietnamese",
#   user: user_one
# )
# file = URI.open("https://b.zmtcdn.com/data/pictures/4/6126604/c2f42686b5a8392e9fd8249aa1f24ede.jpg")
# event.images.attach(io: file, filename: "venue_image_.jpg", content_type: "image/jpg")
# event.save!
# venues << v_seven

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
# event.images.attach(io: file, filename: "venue_image_.jpg", content_type: "image/jpg")
# event.save!
# venues << v_nine

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
# event.images.attach(io: file, filename: "venue_image_.jpg", content_type: "image/jpg")
# event.save!
# venues << v_ten

require 'faker'

 p Faker::Time.forward(days: 5,  period: :evening, format: :long)
