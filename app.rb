require_relative 'lib/wardrobe'
require_relative 'lib/item'
VERSION = "Приложение \"Гардероб\" версия 1 | \"The Closet\" application  v. 1"

current_path = File.dirname(__FILE__)
path_for_data = current_path + "/data"

wardrobe = Wardrobe.new(path_for_data)

answer = ""
while answer.empty? || !answer.to_i.between?(-50, 50)
  puts "Сколько градусов за окном? (можно с минусом)"
  answer = STDIN.gets.to_s.gsub(/\D*/, "")
end
temperature = answer.to_i

kit = wardrobe.get_kit_clothes_for_temperetute(temperature)

if kit.empty?
  puts "В гардеробе ни чего не найдено."
else
  puts "Предлагаем сегодня надеть:"
  puts kit
end
