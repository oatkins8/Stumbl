require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:event) { Event.new(price: 15.50)}

  context '#price_range method' do
    it "should return the correct price range" do
      expect(event.price_range).to eq("Under £20")
    end
  end
end
