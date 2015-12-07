require "helper"

ViewPlanet = {}

ViewPlanet.new = function()
  
  --variables
  local self = {}
  local is_active = false
  local planet = nil

  -- getters
  self.getIsActive = function() return is_active end
  self.getPlanet = function() return planet end
  
  -- setters
  self.setIsActive = function(arg) is_active = arg end
  self.setPlanet = function(arg)
    planet = Planet.new(arg.getX(),arg.getY(),arg.getRadius(),arg.getRed(),arg.getGreen(),arg.getBlue())
    planet.setComposition(arg.getComposition())
    planet.setRadius(love.window.getHeight()/2)
    planet.setX(0)
    planet.setY(love.window.getHeight()/2)
  end

  self.draw = function()
    if is_active then
      love.graphics.setColor(255, 255, 255, 255)
      love.graphics.print(table_as_string(planet.getComposition()), 100, 0)
      love.graphics.setColor(planet.getRed(), planet.getGreen(), planet.getBlue(), 255)
      love.graphics.circle("fill", planet.getX(), planet.getY(), planet.getRadius(), 100)
    end
  end

  self.update = function(dt)
    if is_active then
    end
  end

  -- input callbacks
  self.mousepressed = function(x, y, button, game)
    if is_active then
    end
  end

  self.keypressed = function(key, game)
    if is_active then
      if key == "b" then
        game.getViewSystem().setIsActive(true)
        self.setIsActive(false)
      end
    end
  end

  return self
end