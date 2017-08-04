require 'rspec'
require 'wardrobe'
require 'item'

describe 'Wardrobe' do
  let(:count_good_items) {Dir[path_for_good_data + '/*.txt'].count}
  let(:path_for_good_data) {File.dirname(__FILE__) + '/fixtures/good_data'}
  let(:path_for_bad_data) {File.dirname(__FILE__) + '/fixtures/bad_data'}
  let(:wardrobe) {Wardrobe.new(path_for_good_data)}

  describe 'Create wardrobe' do
    it 'create wardrobe' do
      expect(wardrobe.all_items.count).to eq count_good_items
    end
  end

  describe 'raises'
  it 'raises RuntimeError' do
    expect {Wardrobe.new(path_for_bad_data)}.to raise_error(RuntimeError)
  end

  describe 'correctly Wardrobe methods' do
    it '#select_clothes_by_type' do
      expect(wardrobe.select_clothes_by_type('Головной убор').count).to eq 2
      expect(wardrobe.select_clothes_by_type('Штаны').count).to eq 1
      expect(wardrobe.select_clothes_by_type('Вечернее платье').count).to eq 0
    end

    it '#select_clothes_by_temperature' do
      expect(wardrobe.select_clothes_by_temperature(0).count).to eq 3
      expect(wardrobe.select_clothes_by_temperature(-15).count).to eq 2
      expect(wardrobe.select_clothes_by_temperature(30).count).to eq 0
    end

    it '#get_kit_clothes_for_temperetute' do
      expect(wardrobe.get_kit_clothes_for_temperetute(0).count).to eq 2
      expect(wardrobe.get_kit_clothes_for_temperetute(2).count).to eq 1
      expect(wardrobe.get_kit_clothes_for_temperetute(5).count).to eq 0
    end
  end
end
