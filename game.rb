require 'gosu'
require_relative 'patty'
require_relative 'ruby'

class Game < Gosu::Window
  RUBY_MAKING_FREQ = 0.04
  def initialize
    super(800,600)
    self.caption = 'patty in the sky with diamonds'
    @sky = Gosu::Image.new('sky.png')

    @patty = Patty.new(self)
    @rubies = []

    @font = Gosu::Font.new(30)
    @score = 0
    @game = true
  end

  def draw
    @sky.draw(0, 0, 0)
    @patty.draw
    @rubies.each do |ruby|
      ruby.draw
    end

    @font.draw(@score.to_s, 730, 20, 2)
    @font.draw("s", 50, 20, 2)
    @font.draw(@time_left.to_s, 20, 20, 2)

    unless @game
      @font.draw('Game Over', 400, 300, 1)
    end
  end

  def update
    if @game
      @rubies.each do |ruby|
        ruby.move
      end

      @patty.go_left if button_down?(Gosu::KbLeft)
      @patty.go_right if button_down?(Gosu::KbRight)
      @patty.go_up if button_down?(Gosu::KbUp)

      if rand < RUBY_MAKING_FREQ
        @rubies << Ruby.new(self)
      end

      @rubies.each do |ruby|
        if Gosu.distance(ruby.x, ruby.y, @patty.x, @patty.y) < 50
          @rubies.delete(ruby)
          @score += 5
        end
      end

      @time_left = (15 - (Gosu.milliseconds / 1000))
      @game = false if @time_left <= 0
    end
  end

end

window = Game.new
window.show
