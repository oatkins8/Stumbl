require "application_system_test_case"

class VenuesTest < ApplicationSystemTestCase
  test "A signed in user can create a venue" do
    visit "users/sign_in"
    login_as users(:alex)
    visit "users/:id"

    click_on "My Venues"
    click_on "New Venue"

    fill_in "venue_name", with: "Venue Name"
    fill_in("Location", with: "Shoreditch High Street")
    fill_in "venue_about", with: "Venue Description"
    fill_in "venue_website", with: ""
    fill_in "venue_facebook", with: ""
    fill_in "venue_instagram", with: ""
    attach_file "venue_logo", "#{Rails.root}/test/fixtures/files/sbucks_logo.png"
    attach_file "venue_photos", "#{Rails.root}/test/fixtures/files/starbucks_1.jpeg"
    attach_file "venue_photos", "#{Rails.root}/test/fixtures/files/starbucks_2.jpeg"
    attach_file "venue_photos", "#{Rails.root}/test/fixtures/files/starbucks_3.jpeg"

    click_on "Submit"
    visit "users/:id"
    click_on "My Venues"


    # assert_text "Event Name"
    assert_selector ".card-product-user", count: Venue.count
    save_and_open_screenshot
  end
end


# test "lets a signed in user create a new product" do
#   login_as users(:george) # Warden::TestHelpers (see test_helper.rb)
#   visit "/products/new"
#   # save_and_open_screenshot

#   fill_in "product_name", with: "Le Wagon"
#   fill_in "product_tagline", with: "Change your life: Learn to code"
#   # save_and_open_screenshot


#   click_on "Create Product"
#   # save_and_open_screenshot


#   # should be directed back to the Home with a new product
#   assert_text "Change your life: Learn to code"
# end

# end
