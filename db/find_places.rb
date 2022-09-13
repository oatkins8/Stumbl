require 'uri'
require 'net/http'
require 'json'
# location = '51.536388,-0.140556'
# type = 'thai restaurant'
# radius = '1500'
# minprice = 3
# maxprice = 3
# # Find the right controller
# # Find the right MVC for this
# def make_json(url)
#   https = Net::HTTP.new(url.host, url.port)
#   https.use_ssl = true
#   request = Net::HTTP::Get.new(url)
#   response = https.request(request)
#   file = response.read_body
#   json_file = JSON.parse(file)
#   return json_file
# end
# def find_places(location, radius, type, minprice, maxprice)
#   id_array = []
#   url = URI("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{location}&radius=#{radius}&keyword=#{type}&minprice=#{minprice}maxprice=#{maxprice}&key=AIzaSyBESAb2LgEWKH77louT0bFz9hH3XBB3U3c")
#   json_file = make_json(url)
#   json_file['results'].each do |place|
#     id_array << place['place_id']
#   end
#   id_array
# end
# def get_info(id)
#   url = URI("https://maps.googleapis.com/maps/api/place/details/json?place_id=#{id}&fields=name%2Cformatted_address%2Cgeometry%2Cprice_level%2Cadr_address%2Crating%2Ctypes&key=AIzaSyBESAb2LgEWKH77louT0bFz9hH3XBB3U3c")
#   json_file = make_json(url)
#   place_hash = {
#     'name' => json_file['result']['name'],
#    #'address' => json_file['result']['formatted_address'],
#    # 'adr_address' => json_file['result']['adr_address'],
#     'price level' => json_file['result']['price_level'],
#    # 'rating' => json_file['result']['rating'],
#   }
#   place_hash
# end
def do_it_all
  location = '51.532580,-0.076810'
  type = 'bar' && 'cafe' && 'restaurant'
  radius = '10000'
  minprice = 3
  maxprice = 3
  # make the json
  url = URI("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{location}&radius=#{radius}&keyword=#{type}&minprice=#{minprice}&maxprice=#{maxprice}&key=AIzaSyBESAb2LgEWKH77louT0bFz9hH3XBB3U3c")
  # puts url
  https = Net::HTTP.new(url.host, url.port)
  https.use_ssl = true
  request = Net::HTTP::Get.new(url)
  response = https.request(request)
  file = response.read_body
  json_file = JSON.parse(file)
  place_ids = []  #ID OF EACH PLACE
  json_file['results'].each do |place|
    place_ids << place['place_id']
  end
  suggestions = []  #ALL PLACE ID
  place_photo= []   #GET THE ID OF THE PHOTO
  place_ids.each_with_index do |place_id, index|
    url = URI("https://maps.googleapis.com/maps/api/place/details/json?place_id=#{place_id}&fields=name%2Cformatted_address%2Cgeometry%2Cprice_level%2Cadr_address%2Crating%2Ctypes%2Cphotos&key=AIzaSyBESAb2LgEWKH77louT0bFz9hH3XBB3U3c")
    # puts url
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true
    request = Net::HTTP::Get.new(url)
    response = https.request(request)
    file = response.read_body
    json_file = JSON.parse(file)
    photo_references = []
    json_file['result']['photos'].each_with_index do |reference, index|
      if index < 4
        photo_url = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=#{reference['photo_reference']}&key=AIzaSyBESAb2LgEWKH77louT0bFz9hH3XBB3U3c"
        photo_references << photo_url

      end
    end
    # puts photo_references
    #places_photo_reference << { 'name_photo' => [ "#{json_file['result']['name']}", "#{json_file['result']['photos'][index]['photo_reference']}"]}
    suggestions << {
      'name' => json_file['result']['name'],
      'address' => json_file['result']['formatted_address'],
      'adr_address' => json_file['result']['adr_address'],
      'price level' => json_file['result']['price_level'],
      'rating' => json_file['result']['rating'],
      'photos' => photo_references[0..3],
    }
    # suggestions.each do |suggestion|
    #   venue = Venue.new(
    #     name: suggestion['name'],
    #     location: listing.css('div.venueAddress').text,
    #     website: inner_parsed_page.css('div.venueRowContent').css('a.url') ? inner_parsed_page.css('div.venueRowContent').css('a.url')[0].attributes["href"].value : "",
    #     facebook: inner_parsed_page.css('div.venueRowContent').css('a.facebookPageLink') ? inner_parsed_page.css('div.venueRowContent').css('a.facebookPageLink')[0].attributes["href"].value : "",
    #     instagram: inner_parsed_page.css('div.venueRowContent').css('a.instagramPageLink') ? inner_parsed_page.css('div.venueRowContent').css('a.instagramPageLink')[0].attributes["href"].value : "",
    #     about: inner_parsed_page.css('div.categories').css('span.unlinkedCategory')&.text,
    #     user: user_one
    #   )
    #   venue.photos.attach(io: file, filename: "venue_image_.jpg", content_type: "image/jpg")
    #   venue.save!
    # end
  end
  # suggestions.each do |suggestion|
  #   p
  #   p suggestion['address']
  #   p suggestion['photos']
  # end
  suggestions
end
puts do_it_all()
