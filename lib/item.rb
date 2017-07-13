class Item
  attr_reader :temperature
  def initialize(item_data)
    @name = item_data[0].chomp
    @type = item_data[1].chomp
    @temperature = item_data[2].split(',').map!(&:to_i)
  end

  def to_s
    "#{@name} (#{@type}) #{temperature[0]}..#{temperature[1]}"
  end
end