require './spec/spec_helper'
puts 'Welcome to BATTLESHIP'
puts 'Enter p to play'
puts 'Enter q to quit'
response = gets.chomp

if response == 'p'
  board = Board.new
  cruiser = Ship.new("Cruiser", 3)
  submarine = Ship.new("Submarine", 2)
  puts "I have laid out my ships on the grid."
  puts "You now need to lay out your two ships."
  puts "The Cruiser is three units long and the Submarine is two units long."
  puts board.render
  puts "Enter the squares for the Cruiser (3 spaces)"

  answer_placement = gets.chomp.to_s
  change_answers = answer_placement.split(" ")
while true
  if board.valid_placement?(cruiser, change_answers) == true
    board.place(cruiser, change_answers)
    puts board.render(true)
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
  if board.valid_placement?(submarine, change_answers) == true
    board.place(submarine, change_answers)
    puts board.render(true)
    break
  else
    puts "try again"
    answer_placement = gets.chomp.to_s
    change_answers = answer_placement.split(" ")
  end
end
  


end