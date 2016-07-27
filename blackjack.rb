puts "shuffling cards"
sleep 3
values = {2=>2,3=>3,4=>4,5=>5,6=>6,7=>7,8=>8,9=>9,10=>10,"jack"=>10,"queen"=>10,"king"=>10,"ace"=>11}
total = 0
deck = (2..10).to_a
deck << "jack"
deck << "queen"
deck << "king"
deck << "ace"
deck = deck*32
deck=deck.shuffle


    dealer1=deck.pop
    dealer2=deck.pop
    player1=deck.pop
    player2=deck.pop
    puts "dealer shows: #{dealer1}"
    puts "player cards: #{player1} #{player2}"
    total=values[player1]+values[player2]
    dealer_total=values[dealer1]+values[dealer2]
    if total == 21
        puts "Blackjack!!!!"
    else
        while total<21
            puts "what would you like to do(select number)"
            puts "1. hit"
            puts "2. stand"
            choice = gets.chomp
            
            if choice == "1"
                puts "player hits"
                hit = deck.pop
                puts hit
                total += values[hit]
                puts "player has #{total}"
            else 
                puts "player stays with #{total}"
                break
            end
            
        end
    end
    if dealer_total == 21 
        puts "dealer has 21"
    elsif dealer_total < 21 && dealer_total > 17
        puts "dealer has #{dealer_total}"
    else
        while dealer_total<17
            puts "dealer has #{dealer_total}"
            puts "dealer hits"
            hit = deck.pop
            puts hit
            dealer_total+=values[hit]
            puts "dealer has #{dealer_total}"
        end
    end
