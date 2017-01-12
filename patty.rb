class Patty
  def initialize(window)
    @patty = Gosu::Image.new('patty.bmp')
    @x = 400
    @y = 550
  end

  def draw
    @patty.draw_rot(@x, @y, 1, 0)
  end

  def go_right
    @x += 5
  end

  def go_left
    @x -= 5
  end

  def go_up
    @y -= 5
  end

  def x
    @x
  end

  def y
    @y
  end
end
