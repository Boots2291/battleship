require './lib/ai'
require './lib/player'
require 'pry'

class Board
  attr_accessor :grid,
                :patrol_boat,
                :frigate,
                :ships_remaining

  def initialize
    @grid = [[false, false, false, false],
             [false, false, false, false],
             [false, false, false, false],
             [false, false, false, false]]
    @patrol_boat = []
    @frigate = []
    @ships_remaining = 0
  end

  def character_to_index(pos)
    character = pos.chars[0]
    lib = {"A" => 0, "B" => 1, "C" => 2, "D" => 3}
    lib[character]
  end

  def number_to_index(pos)
    number = pos.chars[1]
    lib = {"1" => 0, "2" => 1, "3" => 2, "4" => 3}
    lib[number]
  end

  def to_coordinates(pos)
    coordinate = []
    coordinate << character_to_index(pos)
    coordinate << number_to_index(pos)
    coordinate
  end

  def place_ship(input)
    positions = input.split(" ")
    pos_1 = to_coordinates(positions[0])
    pos_2 = to_coordinates(positions[1])
    grid[pos_1[0]][pos_1[1]] = true
    grid[pos_2[0]][pos_2[1]] = true
    if positions.count > 2
      pos_3 = to_coordinates(positions[2])
      grid[pos_3[0]][pos_3[1]] = true
    end
    @ships_remaining += 1
  end

  def fire(fire_at)
    if ai_board.patrol_boat[0].include?(fire_at)
      "You hit the patrol boat!"
      ai_board_display[position[0]][position[1]] = "H"
    elsif ai_board.frigate[0].include?(fire_at)
      "You hit the frigate!"
      ai_board_display[position[0]][position[1]] = "H"
    elsif ai_board.grid[position[0]][position[1]] == "H"
      "You already shot there"
    elsif ai_board.grid[position[0]][position[1]] == "M"
      "You already shot there"
    else
      ai_board_display[position[0]][position[1]] = "M"
    end
  end
end