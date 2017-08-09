require 'rspec'
require 'wardrobe'
require 'item'

describe 'Wardrobe' do
  let(:count_good_items) {Dir[path_for_good_data + '/*.txt'].count}
  let(:path_for_good_data) {File.dirname(__FILE__) + '/fixtures/good_data'}
  let(:path_for_bad_data) {File.dirname(__FILE__) + '/fixtures/bad_data'}
  let(:wardrobe) {Wardrobe.new(path_for_good_data)}

  describe '#initialize' do
    it 'create wardrobe' do
      expect(wardrobe.all_items.count).to eq count_good_items
    end

    it 'call raise RuntimeError' do
      expect {Wardrobe.new(path_for_bad_data)}.to raise_error(RuntimeError)
    end
  end

  describe '#types_items' do
    it 'select 2 type items for good data' do
      expect(wardrobe.types_items).to match_array(['Штаны', 'Головной убор'])
    end
  end

  describe '#select_clothes_by_type' do
    it 'select array of 2 items by type' do
      expect(wardrobe.select_clothes_by_type('Головной убор').count).to eq 2
    end

    it 'select array of 1 item by type' do
      expect(wardrobe.select_clothes_by_type('Штаны').count).to eq 1
    end
    it 'select empty array of items by type' do
      expect(wardrobe.select_clothes_by_type('Вечернее платье').count).to eq 0
    end
  end

  describe '#select_clothes_by_temperature' do
    #вытащим все шмотки
    it 'select array of 3 items by temperature' do
      expect(wardrobe.select_clothes_by_temperature(0).count).to eq 3
    end
    #вытащим только штаны
    it 'select array of 2 items by temperature' do
      expect(wardrobe.select_clothes_by_temperature(-15).count).to eq 2
    end
    #невытащим ни чего
    it 'select empty array of items by temperature' do
      expect(wardrobe.select_clothes_by_temperature(30).count).to eq 0
    end
  end

  describe '#get_kit_clothes_by_temperetute' do
    #вытащим один Головной убор и одни штаны
    it 'get array of 2 kits clothes by temperetute' do
      expect(wardrobe.get_kit_clothes_by_temperetute(0).count).to eq 2
    end
    #вытащим только штаны
    it 'get array of 1 kit clothes by temperetute' do
      expect(wardrobe.get_kit_clothes_by_temperetute(2).count).to eq 1
    end
    #ни чего не вытащим = "В гардеробе ни чего не найдено."
    it 'get empty array of kits clothes by temperetute' do
      expect(wardrobe.get_kit_clothes_by_temperetute(5).count).to eq 0
    end
  end
end
