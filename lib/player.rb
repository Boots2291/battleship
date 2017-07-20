require './lib/board'
require './lib/messages'
require './lib/ai'
require './lib/validate_ships'

class Player
  include ValidateShips

  attr_accessor :player_board,
                :ai_board

  def initialize(player_board, ai_board, hit_counter)
    @player_board = player_board
    @ai_board = ai_board
  end

  def char_set
    ["A", "B", "C", "D"]
  end

  def num_set
    ["1", "2", "3", "4"]
  end

  def get_patrol_boat_coordinates
    patrol_boat_coordinates = gets.chomp
    position_1 = patrol_boat_coordinates.split(" ")[0]
    position_2 = patrol_boat_coordinates.split(" ")[1]
    if validate_patrol_boat(patrol_boat_coordinates) == true
      player_board.patrol_boat << position_1
      player_board.patrol_boat << position_2
      player_board.place_ship(patrol_boat_coordinates)
    else
      puts "Try again"
      get_patrol_boat_coordinates
    end
  end

  def validate_patrol_boat(patrol_boat_coordinates)
    position_1 = patrol_boat_coordinates.split(" ")[0]
    position_2 = patrol_boat_coordinates.split(" ")[1]
    if patrol_boat_coords_hash[position_1].include?(position_2)
      true
    else
      false
    end
  end

  def get_frigate_coordinates
    frigate_coordinates = gets.chomp
    if validate_frigate(frigate_coordinates) == true
      player_board.frigate << frigate_coordinates
      player_board.place_ship("#{frigate_coordinates}")
    else
      puts "Try again"
      get_frigate_coordinates
    end
  end

  def validate_frigate(frigate_coordinates)
    position_1 = frigate_coordinates.split(" ")[0]
    position_2 = frigate_coordinates.split(" ")[1]
    position_3 = frigate_coordinates.split(" ")[2]
    coords_to_check = []
    coords_to_check << position_2
    coords_to_check << position_3
    if player_board.patrol_boat.include?(position_1)
      get_frigate_coordinates
    elsif player_board.patrol_boat.include?(position_2)
      get_frigate_coordinates
    elsif player_board.patrol_boat.include?(position_3)
      get_frigate_coordinates
    elsif frigate_coords_hash[position_1].include?(coords_to_check)
      true
    else
      false
    end
  end

  def player_fire
    fire_at = gets.chomp
    position = player_board.to_coordinates(fire_at)
    ai_board.fire(position, fire_at)
  end
end