require "helper"

ViewSystem = {}

ViewSystem.new = function()
  
  --variables
  local self = {}
  local is_active = false
  local system = nil
  local angle = 1

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
      for key, value in pairs(system.getPlanets()) do
        local planet = value
        planet.setX((love.graphics.getWidth()/2) + math.sin(planet.getAngle()) * planet.getDistance())
        planet.setY((love.graphics.getHeight()/2) + math.cos(planet.getAngle()) * planet.getDistance())
        if planet.getAngle() < 360 then
          planet.setAngle(planet.getAngle()+planet.getSpeed())
        else
          planet.setAngle(0)
        end
      end
      --planet_1 = system.getPlanets()[1]
      -- x = originX + sin(angle)*radius;
      -- y = originY + cos(angle)*radius;
      --planet_1.setX((love.graphics.getWidth()/2) + math.sin(angle) * 200)
      --planet_1.setY((love.graphics.getHeight()/2) + math.cos(angle) * 200)
      --if angle < 360 then
      --  angle = angle + 0.01
      --else
      --  angle = 0
      --end
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

  self.keypressed = function(key, game)
    if is_active then
      if key == "b" then
        game.getViewGalaxy().setIsActive(true)
        self.setIsActive(false)
      end
    end
  end

  return self
end