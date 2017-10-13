require "TDD"

RSpec.describe TDD do
  describe "#my_uniq" do
    subject(:test) { TDD.new }
    it 'returns an array without duplicates' do
      expect(test.my_uniq([1,1,2,3])).to eq([1,2,3])
    end
  end

  describe "#my_transpose" do
    subject(:test) { TDD.new }
    it 'correctly transposes new array' do
      expect(test.my_transpose).to eq([[0, 3, 6],[1, 4, 7],[2, 5, 8]])
    end
  end

  describe "#stock_picker" do
    subject(:test) { TDD.new }
    it 'picks most profitable day to buy and sell' do
      expect(test.stock_picker([9,2,6,3,8])).to eq([1,4])
    end
  end  
end
