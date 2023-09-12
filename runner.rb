require './spec/spec_helper'

game = Play.new
game.start

# puts 'Welcome to BATTLESHIP'
# puts 'Enter p to play'
# puts 'Enter q to quit'
# response = gets.chomp
#   while
#     if response != 'p' && response != 'q'
#       puts "invalid, try again"
#       response = gets.chomp.to_s
#     elsif response == 'q'
#       puts "goodbye"
#   break
#     elsif response == 'p'
#       player_board = Board.new
#       computer_board = Board.new
#       cruiser = Ship.new("Cruiser", 3)
#       submarine = Ship.new("Submarine", 2)
#       puts "I have laid out my ships on the grid."
#       puts "You now need to lay out your two ships."
#       puts "The Cruiser is three units long and the Submarine is two units long."
#       puts player_board.render
#       puts "Enter the squares for the Cruiser (3 spaces)"
#       answer_placement = gets.chomp.to_s
#       change_answers = answer_placement.split(" ")  

#       while
#       if !player_board.valid_placement?(cruiser, change_answers)
#         puts "try again"
#         answer_placement = gets.chomp.to_s
#         change_answers = answer_placement.split(" ")
#       else
#         player_board.place(cruiser, change_answers)
#         puts player_board.render(true)
#       end
#     end
      
#       puts "Enter the squares for the Submarine (2 spaces)"
#       answer_placement = gets.chomp.to_s
#       change_answers = answer_placement.split(" ")
      
#       while
#         if !player_board.valid_placement?(submarine, change_answers)
#           puts "try again"
#           answer_placement = gets.chomp.to_s
#           change_answers = answer_placement.split(" ")

#         else
#           player_board.place(submarine, change_answers)
#           puts player_board.render(true)
#       end
#     end

#       # Random idea
#       puts "ready to play?"
#       puts "what is your first move" 
#       puts computer_board.render
#       shot_placement = gets.chomp.to_s
#       computer_board.fire(shot_placement)
#       puts computer_board.render
#       puts "Now I will go"
#       puts player_board.render
#       puts "what is your next move" 
#       puts computer_board.render
#       shot_placement = gets.chomp.to_s
#       computer_board.fire(shot_placement)
#       puts computer_board.render
      
#           puts "do you want to play again?"
#           response = gets.chomp.to_s
#     end
#   end

