class Ruby
  def initialize(window)
    @ruby = Gosu::Image.new('ruby.png')
    @x = rand(10..750)
    @y = 10
    @velocity = rand(2..5)
  end

  def draw
    @ruby.draw(@x, @y, 1)
  end

  def move
    @y += @velocity
  end

  def x
    @x
  end

  def y
    @y
  end
end
