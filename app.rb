require_relative './lib/clothes'
require_relative './lib/item'
VERSION = "Приложение \"Гардероб\" версия 1 | \"The Closet\" application  v. 1"

clothes = Clothes.new
puts "Сколько градусов за окном? (можно с минусом)"
answer = ""
answer = STDIN.gets.to_i while answer == "" || !answer.between?(-50, 50)

if clothes.generate(answer).empty?
  puts "В гардеробе ни чего не найдено."
  else
  puts "Предлагаем сегодня надеть:"
  puts clothes.generate(answer)
end