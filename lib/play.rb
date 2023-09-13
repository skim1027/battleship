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
    response = gets.chomp.upcase
    if response == 'TEST' || 'P' || 'Q'
      if response == 'TEST'
        puts "Test game"
        test_place_ships
        place_computer_cruiser
        place_computer_submarine
        display_board_test
        test_game_play
      elsif response == 'P'
        play_game
        place_cruiser
        place_submarine
        sleep(2)
        place_computer_cruiser
        place_computer_submarine
        display_board
        game_play
      elsif response == 'Q'
        puts "Goodbye"
      end
    else 
      puts "Invalid entry, try again"
      start
    end
  end
  
  def welcome_message
    puts 'Welcome to BATTLESHIP'
    puts 'Enter p to play'
    puts 'Enter q to quit'
  end

  def place_cruiser
    puts "Enter the squares for the Cruiser (3 spaces)"
    answer_placement = gets.chomp.to_s
    change_answers = answer_placement.split(" ") 
    
    if @player_board.place(@player_cruiser, change_answers)
      puts @player_board.render(true)
    else
      puts "Not a valid placement, try again"
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
      puts "Not a valid placement, try again"
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
   
  def play_game
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    puts @player_board.render 
  end
  
  def player_turn
    puts "Enter the coordinate for your shots:" 
    shot_placement = gets.chomp.to_s
    if @computer_board.valid_coordinates?(shot_placement) && @computer_board.cells[shot_placement].fired_upon == true
      puts "You already fired on this coordinate"
      player_turn
    elsif @computer_board.valid_coordinates?(shot_placement)
      @computer_board.fire(shot_placement)
      if @computer_board.cells[shot_placement].render == "M"
        puts "Your shot on #{shot_placement} was a miss"
      elsif @computer_board.cells[shot_placement].render == "H"
        puts "Your shot on #{shot_placement} hit their ship"
      elsif @computer_board.cells[shot_placement].render == "X"
        puts "Your shot on #{shot_placement} sunk their ship"
      end
    else
      puts "Not a valid coordinate, try again"
      player_turn
    end
  end
  
  def test_place_ships
    @player_board.place(@player_cruiser, ['A1', 'A2', 'A3'])
    @player_board.place(@player_submarine, ['B1', 'B2'])
    puts "Automated player's ship placement"
    puts @player_board.render(true)
  end

  def computer_turn
    shot_placement = @player_board.cells.keys.sample
    if @player_board.valid_coordinates?(shot_placement) && @player_board.cells[shot_placement].fired_upon == true
      computer_turn
    elsif @player_board.valid_coordinates?(shot_placement)
      @player_board.fire(shot_placement) 
      if @player_board.cells[shot_placement].render == "M"
        puts "The computer's shot on #{shot_placement} was a miss"
      elsif @player_board.cells[shot_placement].render == "H"
        puts "The computer's shot on #{shot_placement} hit your ship"
      elsif @player_board.cells[shot_placement].render == "X"
        puts "The computer's shot on #{shot_placement} sunk your ship"
      end
    else
      computer_turn
    end
  end
  
  def display_board
    puts "=============COMPUTER BOARD============="
    puts @computer_board.render
    puts "===============PLAYER BOARD============="
    puts @player_board.render(true)
    puts "========================================"
  end
  
  def display_board_test
    puts "=============COMPUTER BOARD============="
    puts @computer_board.render(true)
    puts "===============PLAYER BOARD============="
    puts @player_board.render(true)
    puts "========================================"
  end
  
  def report_score
    if @player_cruiser.health == 0 && @player_submarine.health == 0 && @computer_cruiser.health == 0 && @computer_submarine.health == 0
      puts "It's a tie"
      tie_art
    elsif @player_cruiser.health == 0 && @player_submarine.health == 0
      puts "The computer won  ¯\_(✖╭╮✖)_/¯"
    elsif @computer_cruiser.health == 0 && @computer_submarine.health == 0
      puts "You won!"
      game_won_art
    end
    puts "Game Over"
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

  def tie_art
    puts "──────▄▀▄─────▄▀▄"
    puts "─────▄█░░▀▀▀▀▀░░█▄"
    puts "─▄▄──█░░░░░░░░░░░█──▄▄"
    puts "█▄▄█─█░░▀░░┬░░▀░░█─█▄▄█"
  end

  def game_play
    until (@computer_cruiser.health == 0 && @computer_submarine.health == 0) || (@player_cruiser.health == 0 && @player_submarine.health == 0)
      player_turn
      sleep(1)
      computer_turn
      sleep(1)
      display_board
      sleep(1)
    end
    report_score
    board_reset
    sleep(3)
    start
  end

  def test_game_play
    until (@computer_cruiser.health == 0 && @computer_submarine.health == 0) || (@player_cruiser.health == 0 && @player_submarine.health == 0)
      player_turn
      computer_turn
      display_board_test
    end
    report_score
    board_reset
    sleep(3)
    start
  end

  def board_reset
    @player_board.cells.each do |cell|
      cell.last.ship = nil
      cell.last.empty = true
      cell.last.fired_upon = false
    end

    @computer_board.cells.each do |cell|
      cell.last.ship = nil
      cell.last.empty = true
      cell.last.fired_upon = false
    end

    @player_cruiser = Ship.new("Cruiser", 3)
    @computer_cruiser = Ship.new("Cruiser", 3)
    @player_submarine = Ship.new("Submarine", 2)
    @computer_submarine = Ship.new("Submarine", 2)
  end
end

