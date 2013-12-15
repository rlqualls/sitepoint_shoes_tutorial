# animation.rb
# Shows how to animate a bouncing ball
require 'green_shoes'

Shoes.app do
  fill blue
  @gravity = 0.05
  @velocity = 0.0
  @ball_radius = 60
  @ball = oval(top: 10, 
               left: width / 2 - @ball_radius, 
               radius: @ball_radius)
  button("drop ball") do
    animate(60) do
      @velocity += @gravity
      @ball.top += @velocity 
      if @ball.top > height - @ball_radius * 2
        @ball.top = height - @ball_radius * 2
        @velocity = @velocity * -0.8
      end
    end
  end
end
