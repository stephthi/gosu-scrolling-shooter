# Roughly adapted from the tutorial game. Always faces north.
class Player
  Speed = 7

  attr_reader :score

  def initialize(x, y)
    @image = Gosu::Image.new("media/starfighter.bmp")
    @beep = Gosu::Sample.new("media/beep.wav")
    @lives = 3
    @x, @y = x, y
    @score = 0
  end

  def move_left
    @x = [@x - Speed, 0].max
  end

  def move_right
    @x = [@x + Speed, WIDTH].min
  end

  def forward
    @y = [@y - Speed, 50].max
  end

  def reverse
    @y = [@y + Speed, HEIGHT].min
  end

  def draw
    @image.draw(@x - @image.width / 2, @y - @image.height / 2, ZOrder::Player)
  end

  def collect_stars(stars)
    stars.reject! do |star|
      if Gosu::distance(@x, @y, star.x, star.y) < 35 then
        @lives -= 1
        @beep.play
        true
      else
        false
      end
    end
  end

  def shoot_stars(stars)
    stars.reject! do |star|
      if Gosu::distance(@x, @y, star.x, star.y) < 35 then
        @lives += 1
        @beep.play
        true
      else
        false
      end
    end
  end


end

# Also taken from the tutorial, but drawn with draw_rot and an increasing angle
# for extra rotation coolness!