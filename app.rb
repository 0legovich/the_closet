require_relative 'lib/clothes'
require_relative 'lib/item'
VERSION = "Приложение \"Гардероб\" версия 1 | \"The Closet\" application  v. 1"

current_path = File.dirname(__FILE__)
path_for_data = current_path + "/data"

clothes = Clothes.new(path_for_data)
puts "Сколько градусов за окном? (можно с минусом)"

answer = STDIN.gets.to_i while answer.nil? || !answer.between?(-50, 50)

if clothes.generate(answer).empty?
  puts "В гардеробе ни чего не найдено."
else
  puts "Предлагаем сегодня надеть:"
  puts clothes.generate(answer)
end
