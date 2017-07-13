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
      abort "Данных о вещах не найдено."
    end
  end

  def generate(answer)
    generated_clothes = []
    @all_items.each { |item| generated_clothes << item if answer.between?(item.temperature[0], item.temperature[1]) }
    generated_clothes
  end
end