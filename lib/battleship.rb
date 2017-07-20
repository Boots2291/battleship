require './lib/board'
require './lib/ai'
require './lib/player'
require './lib/messages'

class Battleship
  attr_accessor :player,
                :ai,
                :player_board,
                :ai_board,
                :hit_counter,
                :shot_counter

  def initialize
    @player_board = Board.new
    @ai_board = Board.new
    @hit_counter = 0
    @player = Player.new(player_board, ai_board)
    @ai = AI.new(ai_board, player_board)
  end

  def welcome
    puts "Welcome to BATTLESHIP"
    puts "\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
    start_game
  end

  def instructions
    print "You will be prompted to place your patrol boat (2 units) and\n"
    print "your frigate (3 units). Please enter those coordinates carefully.\n"
    print "Remember that the first character is an uppercase letter, and the\n"
    print "second character is a number. Ex: C3\n"
    print "After that, empty boards will be displayed. Please carefully enter\n"
    print "the coordinate that you would like to shoot at. The game goes until\n"
    print "all ships on one side are sunk."
  end

  def start_game
    @start_time = Time.now
    choice = gets.chomp
    if choice == "p" || choice == "play"
      setup_game
    elsif choice == "i" || choice == "instructions"
      puts instructions
      puts "'p' to play, 'q' to quit"
      start_game
    elsif choice == "q" || choice == "quit"
      return
    else
      start_game
    end
  end

  def prompt_for_small_ship
    puts "I have laid out my ships on the grid."
    puts "You now need to layout your two ships."
    puts "The first is two units long and the"
    puts "second is three units long."
    puts "The grid has A1 at the top left and D4 at the bottom right."
    puts "\nEnter the squares for the two-unit ship:"
  end

  def setup_game
    ai.place_patrol_boat
    ai.place_frigate
    prompt_for_small_ship
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
      @finish = Time.now
      diff = @finish - @start
      puts "You win!"
      puts "Time took: #{diff}"
    elsif player.player_board.hit_counter == 5
      @finish_time = Time.now
      diff = @finish_time - @start_time
      puts diff.round(2)
      puts "You lose."
      puts "Time took: #{diff}"
    end
  end
end

bs = Battleship.new
bs.welcome