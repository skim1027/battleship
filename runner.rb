require './spec/spec_helper'

puts "Welcome to Battleship of Brendan and Sooyung"
puts "If you want to play, press p, if not, hit q to quit"
response = gets.chomp

if response == 'p'
  board = Board.new
  cruiser = Ship.new("Cruiser", 3)
  submarine = Ship.new("Submarine", 2)
  puts "I have laid out my ships on the grid."
  puts "You now need to lay out your two ships."
  puts "The Cruiser is three units long and the Submarine is two units long."
  puts "Remember, you can't put diagonal spaces. Make sure the spaces are consecutive."
  puts board.render
  puts "Enter the squares for the Cruiser (3 spaces)"

  answer_placement = gets.chomp.to_s
  change_answers = answer_placement.split(" ")

  coordinate_check = change_answers.each do |coordinate|
    if board.valid_coordinates?(coordinate) == true
      true
    else
      false
    end
  end
  
  loop do  
    puts "try again"
    new_response = gets.chomp
    break if board.place(cruiser, change_answers)
    puts board.render
  end

  puts
  puts "Enter the squares for the Submarine (2 spaces)"

  second_placement = gets.chomp.to_s


else
  puts "goodbye"
end


