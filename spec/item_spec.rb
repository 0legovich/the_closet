require 'rspec'
require 'item'

describe 'Item' do
  let(:good_file) {File.dirname(__FILE__) + '/fixtures/good_data/1.txt'}
  let(:item) {Item.new(good_file)}

  describe '#initialize' do

    let(:file_with_few_lines) {File.dirname(__FILE__) + '/fixtures/bad_data/1_few_lines.txt'}
    let(:file_incorrect_temp) {File.dirname(__FILE__) + '/fixtures/bad_data/5_incorrect_temp.txt'}

    it 'should initialize item' do
      expect(item.name).to eq 'Шапка-ушанка меховая'
      expect(item.type).to eq 'Головной убор'
      expect(item.temperature_min).to eq -20
      expect(item.temperature_max).to eq 0
    end

    it 'call raise becaise file has only a few lines' do
      expect {Item.new(file_with_few_lines)}.to raise_error("Файл #{file_with_few_lines} содержит мало строк.")
    end

    it 'call raise becaise file has incorrect temperature' do
      expect {Item.new(file_incorrect_temp)}.to raise_error(
                                                  "В файле #{file_incorrect_temp}"\
                                                  " корректно укажите температуру через \",\"."
                                                )
    end

  end

  describe '#to_s' do
    it 'shows the item in a formatted fashion' do
      expect(item.to_s).to eq 'Шапка-ушанка меховая (Головной убор) -20..0'
    end
  end
end