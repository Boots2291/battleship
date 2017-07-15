class Battleship

  def start_game_message
    puts "Welcome to BATTLESHIP\n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?\n"
    start_input = gets
  end

end

battle = Battleship.new
battle.start_game_message