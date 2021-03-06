class Wardrobe
  attr_accessor :all_items

  def initialize(path_for_data)
    @all_items = get_form_dir(path_for_data)
  end

  def types_items
    @all_items.map(&:type).uniq
  end

  def select_clothes_by_type(type)
    @all_items.select {|item| item.type == type}
  end

  def select_clothes_by_temperature(temperature)
    @all_items.select do |item|
      temperature.between?(item.temperature_min, item.temperature_max)
    end
  end

  def get_kit_clothes_by_temperetute(temperature)
    types_items.map do |type|
      (select_clothes_by_type(type) & select_clothes_by_temperature(temperature)).sample
    end.compact
  end

  private

  def get_form_dir(path_for_data)
    if Dir.exist?(path_for_data)
      Dir[path_for_data + '/*.txt'].map {|item| Item.new(item)}
    else
      raise "Данных о вещах не найдено."
    end
  end
end
