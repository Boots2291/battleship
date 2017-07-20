require './lib/board'
require './lib/ai'
require './lib/player'
require './lib/messages'

class Battleship
  attr_accessor :player,
                :ai,
                :player_board,
                :ai_board,
                :hit_counter

  def initialize
    @player_board = Board.new
    @ai_board = Board.new
    @hit_counter = 0
    @player = Player.new(player_board, ai_board, hit_counter)
    @ai = AI.new(ai_board, player_board, hit_counter)
    # @display_board = Board.new
  end

  def welcome
    puts "Welcome to BATTLESHIP"
    puts "\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
    start_game
  end

  def start_game
    choice = gets.chomp
    if choice == "p" || choice == "play"
      setup_game
    elsif choice == "i" || choice == "instructions"
      puts "instructions"
      start_game
    elsif choice == "q" || choice == "quit"
      return
    else
      start_game
    end
  end

  def setup_game
    ai.place_patrol_boat
    ai.place_frigate
    puts "Please enter patrol boat coordinates"
    player.get_patrol_boat_coordinates
    puts "Please enter frigate coordinates"
    player.get_frigate_coordinates
    game
  end

  def game
    until (ai.ai_board.hit_counter == 5) || (player.player_board.hit_counter == 5) do
      puts "Computer Board"
      ai.ai_board.display_board.each do |row|
        print row
        print "\n"
      end
      print "\n"
      puts "Player Board"
      player.player_board.display_board.each do |row|
        print row
        print "\n"
      end
      print "\n"
      puts "Computer's turn"
      ai.ai_fire
      puts "Your turn"
      player.player_fire
    end
    if ai.ai_board.hit_counter == 5
      puts "You win!"
    elsif player.player_board.hit_counter == 5
      puts "You lose."
    end
  end
end

bs = Battleship.new
bs.welcome