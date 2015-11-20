require "helper"

ViewSystem = {}

ViewSystem.new = function()
  
  --variables
  local self = {}
  local is_active = false
  local system = nil

  -- getters
  self.getIsActive = function() return is_active end
  self.getSystem = function() return system end
  
  -- setters
  self.setIsActive = function(arg) is_active = arg end
  self.setSystem = function(arg)
    system = arg
  end

  -- callbacks - draw the system
  self.draw = function()
    if is_active then
      for key,value in pairs(system.getPlanets()) do
        local planet = value
        love.graphics.setColor(planet.getRed(), planet.getGreen(), planet.getBlue(), 255)
        love.graphics.circle("fill", planet.getX(), planet.getY(), planet.getRadius(), 100)
      end
    end
  end

  self.update = function(dt)
    if is_active then
    end
  end

  -- input callbacks
  self.mousepressed = function(x, y, button, game)
    if is_active then
      if button == 'l' then
        for key,value in pairs(system.getPlanets()) do
          if pointPresentInCircle(x, y, value.getX(), value.getY(), value.getRadius()) then
            game.getViewPlanet().setPlanet(value)
            game.getViewPlanet().setIsActive(true)
            self.setIsActive(false)
          end
        end
      end
    end
  end

  return self
end