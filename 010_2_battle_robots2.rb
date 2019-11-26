# Игра:
# Есть две команды роботов, в каждой по 10 юнитов, у каждого юнита по 100% здоровья.
# По очереди команды наносят удары, каждый удар отнимает разное кол-во здовровья у одного юнита.
# Команда, у которой все юниты потеряют здоровье до 0% — проиграет!
# Да начнется битва!
puts "В каком режиме запустить? 0 - Авто (между атаками 0.5 сек) 1 - Ручной (для очередной атаки жать Enter)"
@mode = gets.to_i


@team1 = Array.new(10, 100) # [100, 100, 100, 100, 100, 100, 100, 100, 100, 100]
@team2 = Array.new(10, 100) # [100, 100, 100, 100, 100, 100, 100, 100, 100, 100]

#Атака
def attack arr
  i = rand(0..9)
  damage = rand(30..100)
  if arr[i] > 0
    arr[i] -= damage
    if arr[i] <= 0
      arr[i] = 0
      puts "-#{i}- робот уничтожен | Урон #{damage}%"
    else
      puts "У робота -#{i}- осталось #{arr[i]}% здоровья | Урон #{damage}%"
    end
  else
    puts "(#{i}) промах по роботу "
  end

  if @mode == 0
    sleep 0.2
  end

end

# Условие победы
def victory?
  robots_left1 = @team1.count {|x| x>0}
  robots_left2 = @team2.count {|x| x>0}
  if robots_left1 == 0
    puts "Команда 2 победила, роботов осталось: #{robots_left2}"
    return true
  end
  if robots_left2 == 0
    puts "Команда 1 победила, роботов осталось: #{robots_left1}"
    return true
  end
  false
end
# Статистика
def stats
  cnt1 = @team1.count {|x| x>0}
  cnt2 = @team2.count {|x| x>0}
  puts "В команде1: #{cnt1} роботов в строю #{@team1}"
  puts "В команде2: #{cnt2} роботов в строю #{@team2}"
end
# основной цикл
loop do
  puts "\nВторая команда атакует"
  attack @team1
  puts "\nПервая команда атакует"
  attack @team2

  if @mode == 0
    sleep 0.2
  end

  exit if victory?
  stats

  if @mode == 1
    gets
  end
end


