class Frigate
  attr_accessor :hitpoints

  def initialize(location = [])
    @location = location
    @hitpoints