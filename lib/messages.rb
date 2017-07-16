require 'pry'
class Messages
  def start_game_message
    puts "Welcome to BATTLESHIP\n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?\n"
    start_input = gets
  end

  def instructions
    puts "Instructions go here"
  end

  def prompt_for_small_ship
    puts "I have laid out my ships on the grid."
    puts "You now need to layout your two ships."
    puts "The first is two units long and the"
    puts "second is three units long."
    puts "The grid has A1 at the top left and D4 at the bottom right."
    puts "\nEnter the squares for the two-unit ship:"
  end
end