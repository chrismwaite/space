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
    planet.setRadius(love.graphics.getHeight()/2)
    planet.setX(0)
    planet.setY(love.graphics.getHeight()/2)
  end

  self.draw = function()
    if is_active then
      love.graphics.setColor(255, 255, 255, 255)
      love.graphics.print(table_as_string(planet.getComposition()), 100, 0)
      planet.draw()
    end
  end

  self.update = function(dt)
    if is_active then
    end
  end

  -- input callbacks
  self.mousepressed = function(x, y, button)
    if is_active then
      if button == 'l' then
        if pointPresentInCircle(x, y, planet.getX(), planet.getY(), planet.getRadius()) then
          self.setIsActive(false)
        end
      end
    end
  end

  return self
end