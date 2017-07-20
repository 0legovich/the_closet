require 'rspec'
require_relative '../lib/clothes'
require_relative '../lib/item'

describe 'Clothes' do
  path_for_data = File.dirname(__FILE__) + '/fixtures'
  clothes = Clothes.new(path_for_data)

  it 'should do initialize clothes' do
    expect(clothes.all_items.size).to eq 2
    expect(clothes.all_items.all? { |i| i.class == Item }).to eq true
    end

  it 'should generate correctly clothes' do
    expect(clothes.generate(0).all?{ |i| i.class == Item }).to eq true
    clothes.generate(0).each do |item|
      expect(0.between?(item.temperature_min, item.temperature_max)).to eq true
    end
  end


end