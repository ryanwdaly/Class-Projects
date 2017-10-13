require "towers_of_hanoi"

RSpec.describe "TowersOfHanoi" do
  subject(:test) { TowersOfHanoi.new }


  describe "#initialize" do
    it 'initializes 3 arrays' do
      expect(test.tower1).to eq([1, 2 ,3])
      expect(test.tower2).to eq([])
      expect(test.tower3).to eq([])
    end
  end

  describe '#valid_move?' do
    it 'return true for valid_move' do
      expect(test.valid_move?(test.tower1, test.tower2)).to eq(true)
    end
    it 'returns false for invalid move' do
      expect(test.valid_move?(test.tower2, test.tower1)).to eq(false)
    end
  end

  # describe '#move' do
  #   test.move(test.tower1, test.tower2)
  #   expect(test.tower1).to eq([2,3])
  #   expect(test.tower2).to eq([1])
  # end


#   #it 'picks most profitable day to buy and sell' do
#     expect(test.stock_picker([9,2,6,3,8])).to eq([1,4])
#   end
#
#   it 'picks most profitable day to buy and sell' do
#     expect(test.stock_picker([9,2,6,3,8])).to eq([1,4])
#   end
end
