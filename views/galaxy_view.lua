require "helper"

ViewGalaxy = {}

ViewGalaxy.new = function()
  
  --variables
  local self = {}
  local is_active = false
  local galaxy = nil

  -- getters
  self.getIsActive = function() return is_active end
  self.getGalaxy = function() return galaxy end
  
  -- setters
  self.setIsActive = function(arg) is_active = arg end
  self.setGalaxy = function(arg)
    galaxy = arg
  end

  -- callbacks - draw the galaxy
  self.draw = function()
    if is_active then
      for key,value in pairs(galaxy.getSystems()) do
        local system = value
        love.graphics.setColor(255, 255, 255, system.getLuminosity())
        love.graphics.circle("fill", system.getX(), system.getY(), system.getRadius(), 6)
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
        for key,value in pairs(galaxy.getSystems()) do
          if pointPresentInCircle(x, y, value.getX(), value.getY(), value.getRadius()) then
            game.getViewSystem().setSystem(value)
            game.getViewSystem().setIsActive(true)
            self.setIsActive(false)
          end
        end
      end
    end
  end

  self.mousemoved = function( x, y, dx, dy )
    if is_active then
      for key,value in pairs(galaxy.getSystems()) do
        if pointPresentInCircle(x, y, value.getX(), value.getY(), value.getRadius()+2) then
          value.setRadius(10)
        else
          value.setRadius(value.getOriginalRadius())
        end
      end
    end
  end

  self.keypressed = function(key, game)
    if is_active then

    end
  end

  return self
end