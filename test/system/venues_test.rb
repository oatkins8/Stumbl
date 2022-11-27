require "application_system_test_case"

class VenuesTest < ApplicationSystemTestCase
  test "A signed in user can create a venue" do
    visit "users/sign_in"
    login_as users(:alex)
    visit "users/:id"

    click_on "My Venues"
    click_on "New Venue"

    fill_in "venue_name", with: "Saints Coffee"
    fill_in "Location", with: "This will return the default venue location"
    fill_in "venue_about", with: "Specialty coffee shop, cocktail bar, pop-up collaborator, event venue ..."
    fill_in "venue_website", with: "https://www.saintscoffee.co.uk/"
    fill_in "venue_facebook", with: "https://www.facebook.com/saintscoffeeshop"
    fill_in "venue_instagram", with: "https://www.instagram.com/saintscoffee_/"
    attach_file "venue_logo", "#{Rails.root}/test/fixtures/files/saints-logo.webp"
    attach_file "venue_photos", "#{Rails.root}/test/fixtures/files/saints-coffee1.jpeg"
    attach_file "venue_photos", "#{Rails.root}/test/fixtures/files/saints-coffee2.jpeg"

    click_on "Submit"
    assert_text "Saints Coffee"

    visit "users/:id"
    click_on "My Venues"
    assert_selector "h2", text: "Saints Coffee"
  end
end
