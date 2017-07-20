require 'rspec'
require_relative '../lib/item'

describe 'Item' do

  item = Item.new(['Шапка-ушанка меховая', 'Головной убор', '-20, 0'])
  it 'should initialize item' do
    expect(item.name).to eq 'Шапка-ушанка меховая'
    expect(item.type).to eq 'Головной убор'
    expect(item.temperature_min).to eq -20
    expect(item.temperature_max).to eq 0
  end
  it 'should show item for user' do
    expect(item.to_s).to eq 'Шапка-ушанка меховая (Головной убор) -20..0'
  end
end