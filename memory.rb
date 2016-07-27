
suits=["clubs","diamonds","hearts","spades"]
array=(4..55).to_a.shuffle
x=0
52.times do
    card = array.pop
    number=card/4
    suit=card%4
    if number == 1
        number="ace"
    elsif number == 11
        number="jack"
    elsif number == 12
        number="queen"
    elsif number == 13
        number="king"
    end
    unless array[0]
        @answer= "#{number} of #{suits[suit]}"
        break
    end
    puts "#{number} of #{suits[suit]}"
    sleep 2
end


user_input = Thread.new do
  puts "You have 2 minutes to guess the last card"
  Thread.current[:value] = gets.chomp
end

Thread.new { sleep 120; user_input.kill; puts }

user_input.join
if user_input[:value]
    if user_input[:value]==@answer
        puts "Correct!!!!"
    else
        puts "The correct answer is the #{@answer}"
    end
else
  puts "Timer expired, the correct answer is the #{@answer}"
end