require "application_system_test_case"

class VenuesTest < ApplicationSystemTestCase
  test "same number of markers displayed as venues in db" do
    visit root_url
    assert_selector ".marker", count: Venue.count
  end
end
