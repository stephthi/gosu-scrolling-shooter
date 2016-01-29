# These are bullets shot by the player's ship
class Bullet
  Speed = 8
  BoomOffset = 10

  # Constructor
  def initialize(x, y)
    super()

    @image = Gosu::Image.from_text("Y", 3)
    @x = x
    @y = y
    @radius = 8
  end
end