class Clothes
  attr_accessor :all_items

  def initialize(path_for_data)
    @all_items = get_form_dir(path_for_data)
  end

  #answer - Integer
  def generate(answer)
    generated_clothes = []
    @all_items.each do |item|
      generated_clothes << item if answer.between?(item.temperature_min, item.temperature_max)
    end
    kit(generated_clothes)
  end

  private

  def get_form_dir(path_for_data)
    if Dir.exist?(path_for_data)
      Dir[path_for_data + '/*.txt'].map { |item| Item.new(File.readlines(item)) }
    else
      raise "Данных о вещах не найдено."
    end
  end

  #generated_clothes - массив элементов Item
  def kit(generated_clothes)
    types = generated_clothes.map { |item| item.type }.uniq
    types.map { |type| generated_clothes.select { |item| item.type == type}.sample }
  end
end
