@humans = 10
@machines = 10
# ----------------------------------------------------------------------+
# вспомогательные методы                                                |
# ----------------------------------------------------------------------+

# Метод luck возвращает случайное значение true или false
def luck?
  rand(0..1) == 1
end

# Метод boom считает оставшихся и показывает количество потерь
def boom
  diff = rand(1..5)
  if luck?
    @machines -= diff
    puts "#{diff} машин уничтожено"
  else
    @humans -= diff
    puts "#{diff} людей погибло"
  end
end

# Метод для прибавления юнитов
def new_unit
  diff = rand(1..5)
  if luck?
    @machines += diff
    puts "#{diff} машин прибавилось"
  else
    @humans += diff
    puts "#{diff} людей прибавилось"
  end
end

# Метод random_city возвращает случайный город
def random_city
  dice = rand(1..5)
  case dice
    when 1; 'Сеул'
    when 2; 'Лос-Анджелес'
    when 3; 'Пекин'
    when 4; 'Лондон'
    else 'Москва'
  end
end

# Метод для рандомной задержки
def random_sleep
  sleep rand(0.3..1.5)
end

# Прогресс бар
def progress_bar
  50.times do |i|
    print "-"*i+">"+" "*(49-i)+"|<\r"
    sleep 0.015
  end
  sleep 1; puts
end

# Вывод промежуточных итогов
def stats
  puts "Осталось #{@humans} людей и #{@machines} машин"
end

# ----------------------------------------------------------------------+
# события                                                               |
# ----------------------------------------------------------------------+
def event1
  puts "Запущена ракета по городу #{random_city}"
  progress_bar
  boom
  random_sleep
  new_unit
end
def event2
  puts "Применено радиоактивное оружие в городе #{random_city}"
  progress_bar
  boom
  random_sleep
  new_unit
end
def event3
  puts "Группа солдат прорывает оборону противника в городе #{random_city}"
  progress_bar
  boom
  random_sleep
  new_unit
end

# ----------------------------------------------------------------------+
# проверка победы                                                       |
# ----------------------------------------------------------------------+
def check_victory?
  win = 'Люди победили'
  los = 'Люди проиграли'
  if @humans <=0
    print los
    true
  elsif @machines <= 0
    print win
    true
  end
end

# ----------------------------------------------------------------------+
# главный цикл                                                          |
# ----------------------------------------------------------------------+
loop do
  # условие победы и завершения программы
  if check_victory?
    exit
  end
  # подбрасываем кость
  dice = rand(1..3)
  event1 if dice == 1
  event2 if dice == 2
  event3 if dice == 3
  # отображаем промежуточные итоги
  stats
  # задержка перед следующей итерацией
  random_sleep
end