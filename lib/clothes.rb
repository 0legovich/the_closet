class Clothes
  attr_accessor :all_items

  def initialize
    @all_items = create_all_items
  end

  def path_for_data
    File.dirname(__FILE__) + "/../data"
  end

  def create_all_items
    if Dir.exist?(path_for_data)
      Dir[path_for_data + '/*.txt'].map { |item| Item.new(File.readlines(item)) }
    else
      raise "Данных о вещах не найдено."
    end
  end

  def kit(generated_clothes)
    types = generated_clothes.map { |item| item.type }.uniq
    types.map { |type| generated_clothes.select { |item| item.type == type}.sample }
  end

  def generate(answer)
    generated_clothes = []
    @all_items.each do |item|
      generated_clothes << item if answer.between?(item.temperature_min, item.temperature_max)
    end
    kit(generated_clothes)
  end
end
