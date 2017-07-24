require 'rspec'
require_relative '../lib/clothes'
require_relative '../lib/item'

describe 'Clothes' do
  let(:path_for_data) { File.dirname(__FILE__) + '/fixtures' }
  let(:clothes) { Clothes.new(path_for_data) }
  let(:count_items) { Dir[path_for_data + '/*.txt'].count }

  it 'creates collection items' do
    expect(clothes.all_items.size).to eq count_items
    expect(clothes.all_items.all? { |i| i.class == Item }).to eq true
  end

  it 'generates correctly clothes' do
    expect(clothes.generate(0).all?{ |i| i.class == Item }).to eq true
    clothes.generate(0).each do |item|
      expect(0.between?(item.temperature_min, item.temperature_max)).to eq true
    end
  end
end
