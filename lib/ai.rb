require './lib/board'
require './lib/messages'
require './lib/player'
require './lib/validate_ships'
require 'pry'

class AI
  include ValidateShips
  attr_accessor :ai_board,
                :player_board
                # :hit_counter

  def initialize(ai_board, player_board, hit_counter)
    @ai_board = ai_board
    @player_board = player_board
    # @hit_counter = 0
  end

  def char_set
    ["A", "B", "C", "D"]
  end

  def num_set
    ["1", "2", "3", "4"]
  end

  def generate_first_position
    "#{char_set.sample}#{num_set.sample}"
  end


  def generate_position_for_small_ship(position_1)
    position_2 = patrol_boat_coords_hash[position_1].sample
  end

  def generate_position_for_large_ship(position_1)
    position_3 = frigate_coords_hash[position_1].sample
  end

  def place_patrol_boat
    position_1 = generate_first_position
    position_2 = generate_position_for_small_ship(position_1)
    ai_board.patrol_boat << ["#{position_1}", "#{position_2}"]
    ai_board.place_ship("#{position_1} #{position_2}")
    # @ships_remaining += 1
  end

  def place_frigate
    position_1 = generate_first_position
    positions = generate_position_for_large_ship(position_1)
    position_2 = positions[0]
    position_3 = positions[1]
    if ai_board.patrol_boat[0].include?(position_1)
      place_frigate
    elsif ai_board.patrol_boat[0].include?(position_2)
      place_frigate
    elsif ai_board.patrol_boat[0].include?(position_3)
      place_frigate
    else
      ai_board.frigate << ["#{position_1}", "#{position_2}", "#{position_3}"]
      ai_board.place_ship("#{position_1} #{position_2} #{position_3}")
      # @ships_remaining += 1
    end
  end

  def ai_fire
    # need a message
    fire_at = generate_first_position
    position = player_board.to_coordinates(fire_at)
    player_board.fire(position, fire_at)
  end
end