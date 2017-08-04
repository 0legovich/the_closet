require 'rspec'
require 'item'

describe 'Item' do
  let(:good_file) {File.dirname(__FILE__) + '/fixtures/good_data/1.txt'}
  let(:item) {Item.new(good_file)}

  describe "good create item" do
    it 'should initialize item' do
      expect(item.name).to eq 'Шапка-ушанка меховая'
      expect(item.type).to eq 'Головной убор'
      expect(item.temperature_min).to eq -20
      expect(item.temperature_max).to eq 0
    end
  end

  describe "raises" do
    let(:file_with_few_lines) {File.dirname(__FILE__) + '/fixtures/bad_data/1_few_lines.txt'}
    let(:file_incorrect_temp) {File.dirname(__FILE__) + '/fixtures/bad_data/5_incorrect_temp.txt'}

    it 'raises few lines' do
      expect {Item.new(file_with_few_lines)}.to raise_error("Файл #{file_with_few_lines} содержит мало строк.")
    end

    it 'raises incorrect temperature' do
      expect {Item.new(file_incorrect_temp)}.to raise_error(
                                                  "В файле #{file_incorrect_temp}"\
                                                  " корректно укажите температуру через \",\"."
                                                )
    end
  end

  it 'should show item for user' do
    expect(item.to_s).to eq 'Шапка-ушанка меховая (Головной убор) -20..0'
  end
end