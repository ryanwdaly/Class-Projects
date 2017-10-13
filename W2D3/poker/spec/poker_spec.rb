require "card"
require "dealer"

RSpec.describe "Card Class" do
  subject(:test) { Card.new("Hearts", 11) }


  describe "#initialize" do
    it 'Takes in suit' do
      expect(test.suit).to eq("Hearts")
    end
    it 'Takes in value' do
      expect(test.value).to eq(11)
    end
  end

  describe '#title' do
    it 'Return correct title of card value' do
      expect(test.title(11)).to eq("Jack")
    end
  describe '#to_s' do
    it 'Prints correct string' do
      expect(test.to_s).to eq("Jack of Hearts")
      end
    end
  end
end

RSpec.describe "Dealer Class" do
  subject(:test) { Dealer.new }


  describe "#initialize" do
    it 'Creates an empty deck' do
      expect(test.deck).to eq([])
    end
  end

  describe '#build_deck' do
    it 'Creates a 52 card deck' do
      test.build_deck
      test.deck.length == 52
    end
  # describe '#to_s' do
  #   it 'Prints correct string' do
  #     expect(test.to_s).to eq("Jack of Hearts")
  #     end
  #   end
  end
end
