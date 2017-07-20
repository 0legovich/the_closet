class Item
  attr_reader :name, :temperature_min, :temperature_max, :type
  def initialize(item_data)
    @name = item_data[0].chomp
    @type = item_data[1].chomp
    temperature = item_data[2].split(',').map!(&:to_i)
    @temperature_min = temperature[0]
    @temperature_max = temperature[1]
  end

  def to_s
    "#{@name} (#{@type}) #{temperature_min}..#{temperature_max}"
  end
end
