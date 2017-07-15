class Board
  attr_reader :grid

  def initialize
    @grid = [[false, false, false, false],
             [false, false, false, false],
             [false, false, false, false],
             [false, false, false, false]]
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
    coordinate << [character_to_index(pos)]
    coordinate << [number_to_index(pos)]
    coordinate
  end

  def place_ship(pos_1, pos_2, pos_3 = false)

  end
end