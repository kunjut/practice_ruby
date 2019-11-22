puts 'Введите ваш возраст'
age = gets.to_i
if age < 18
  puts 'Сорян. Это взрослые игры'
  exit
end

@balance = 100

def comb
  x = rand(0..5)
  y = rand(0..5)
  z = rand(0..5)
  w = x, y, z
  @result = w.join
  20.times do
    print "#{rand(000..999)}\r"; sleep 0.05
  end
end

def score
  case @result
    when '0'*3; @balance = 0
    when '1'*3; @balance += 10
    when '2'*3; @balance += 20
    when '6'*3; @balance /= 2
    when '7'*3; puts 'ДжекПот, ты сорвал лям'; exit
    else @balance -= 1
  end
end

loop do
  if @balance > 0
    comb; sleep 0.5; puts "#{@result}"
    score; puts "#{@balance}"
    sleep 0.3
  else
    puts 'Баланс высох, приходи завтра'
    exit
  end
end

