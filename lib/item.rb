class Item
  attr_accessor :name, :temperature_min, :temperature_max, :type

  def initialize(item)
    raise "Файл #{item} содержит мало строк." if File.readlines(item).compact.size < 3
    unless File.readlines(item)[2].split(',').size == 2
      raise "В файле #{item} корректно укажите температуру через \",\"."
    end

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
