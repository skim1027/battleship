class Play
  def initialize
    @player_board = Board.new
    @computer_board = Board.new
    @player_cruiser = Ship.new("Cruiser", 3)
    @computer_cruiser = Ship.new("Cruiser", 3)
    @player_submarine = Ship.new("Submarine", 2)
    @computer_submarine = Ship.new("Submarine", 2)
  end
  def start
    welcome_message
    response = gets.chomp
    if response == 'p'
      play_game
      place_cruiser
      place_submarine
      place_computer_cruiser
      place_computer_submarine
      display_board
      game_play
    elsif response == 'q'
      puts "Goodbye"
    else 
      puts "invalid, try again"
      start
    end
  end
  def welcome_message
    puts 'Welcome to BATTLESHIP'
    puts 'Enter p to play'
    puts 'Enter q to quit'
  end
  def play_game
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    puts @player_board.render
  end
  
  def place_cruiser
    puts "Enter the squares for the Cruiser (3 spaces)"
    answer_placement = gets.chomp.to_s
    change_answers = answer_placement.split(" ") 
    
    if @player_board.place(@player_cruiser, change_answers)
      puts @player_board.render(true)
    else
      puts "try again"
      place_cruiser
    end
  end
  def place_submarine
    puts "Enter the squares for the Submarine (2 spaces)"
    answer_placement = gets.chomp.to_s
    change_answers = answer_placement.split(" ")
    
    if @player_board.place(@player_submarine, change_answers)
      puts @player_board.render(true)
    else
      puts "try again"
      place_submarine
    end
  end
  def place_computer_cruiser
    if @computer_board.place(@computer_cruiser, @computer_board.cells.keys.sample(3))
    else
      place_computer_cruiser
    end
  end
  def place_computer_submarine
    if @computer_board.place(@computer_submarine, @computer_board.cells.keys.sample(2))
    else
      place_computer_submarine
    end
  end
  def display_board
    puts "=============COMPUTER BOARD============="
    puts @computer_board.render(true)
    puts "===============PLAYER BOARD============="
    puts @player_board.render(true)
  end
  def player_turn
    puts "Enter the coordinate for your shots:" 
    shot_placement = gets.chomp.to_s
    if @computer_board.valid_coordinates?(shot_placement) 
      @computer_board.fire(shot_placement)
    # elsif @player_board.cells[shot_placement].fired_upon == true
    #   puts "You've already shot on that spot" 
    else
      puts "try again"
      player_turn
    end
    if @computer_board.cells[shot_placement].render == "M"
      puts "your shot on #{shot_placement} was a miss"
    elsif @computer_board.cells[shot_placement].render == "H"
      puts "your shot on #{shot_placement} was a hit"
    elsif @computer_board.cells[shot_placement].render == "X"
      puts "your shot on #{shot_placement} sunk the ship"
    end
  end
  def computer_turn
    shot_placement = @computer_board.cells.keys.sample
    if @player_board.valid_coordinates?(shot_placement)
      @player_board.fire(shot_placement)
    else
      computer_turn
    end
    if @player_board.cells[shot_placement].render == "M"
      puts "the computer's shot on #{shot_placement} was a miss"
    elsif @player_board.cells[shot_placement].render == "H"
      puts "the computer's shot on #{shot_placement} was a hit"
    elsif @player_board.cells[shot_placement].render == "X"
      puts "the computer's shot on #{shot_placement} sunk the ship"
    end
  end
  def game_play
    until (@computer_cruiser.health == 0 && @computer_submarine.health == 0) || (@player_cruiser.health == 0 && @player_submarine.health == 0)
      player_turn
      computer_turn
      display_board

    end
    report_score
  end

  def report_score
    if @player_cruiser.health == 0 && @player_submarine.health == 0

      puts "The computer won  ¯\_(✖╭╮✖)_/¯"
    elsif @computer_cruiser.health == 0 && @computer_submarine.health == 0
      puts "You won!"
      game_won_art
    end
    puts "Game Over"
    start
  end

  def game_won_art
    puts "┈┈┈┈┈┈▕▔╲┈┈┈┈┈┈"
    puts "┈┈┈┈┈┈┈▏▕┈ⓈⓊⓅⒺⓇ"
    puts "┈┈┈┈┈┈┈▏▕▂▂▂┈┈┈"
    puts "▂▂▂▂▂▂╱┈▕▂▂▂▏┈┈"
    puts "▉▉▉▉▉┈┈┈▕▂▂▂▏┈┈"
    puts "▉▉▉▉▉┈┈┈▕▂▂▂▏┈┈"
    puts "▔▔▔▔▔▔╲▂▕▂▂▂▏┈┈"
  end
end