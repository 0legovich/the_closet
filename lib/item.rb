class Item
  attr_reader :name, :temperature_min, :temperature_max, :type

  def initialize(item)
    @name = File.readlines(item)[0].chomp
    @type = File.readlines(item)[1].chomp
    temperature = File.readlines(item)[2].split(',').map!(&:to_i)
    @temperature_min = temperature[0]
    @temperature_max = temperature[1]
  end

  def to_s
    "#{@name} (#{@type}) #{temperature_min}..#{temperature_max}"
  end
end
