require './spec/spec_helper'
puts 'Welcome to BATTLESHIP'
puts 'Enter p to play'
puts 'Enter q to quit'
response = gets.chomp

while true
  if response != 'p' && response != 'q'
    puts "invalid, try again"
    response = gets.chomp.to_s
  elsif response == 'q'
    puts "goodbye"
    break
  elsif response == 'p'
    computer_board = Board.new
    player_board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    puts player_board.render
    puts "Enter the squares for the Cruiser (3 spaces)"

    answer_placement = gets.chomp.to_s
    change_answers = answer_placement.split(" ")
    while true
      if player_board.valid_placement?(cruiser, change_answers) == true
        player_board.place(cruiser, change_answers)
        puts player_board.render(true)
        break
      else
        puts "try again"
        answer_placement = gets.chomp.to_s
        change_answers = answer_placement.split(" ")
      end
    end
      puts "Enter the squares for the Submarine (2 spaces)"
      answer_placement = gets.chomp.to_s
      change_answers = answer_placement.split(" ")
      while true
      if player_board.valid_placement?(submarine, change_answers) == true
        player_board.place(submarine, change_answers)
        puts player_board.render(true)
        break
      else
        puts "try again"
        answer_placement = gets.chomp.to_s
        change_answers = answer_placement.split(" ")
      end
      break
    end
    puts "do you want to play again?"
    response = gets.chomp.to_s
  end
end