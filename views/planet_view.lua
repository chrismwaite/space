require "helper"

ViewPlanet = {}

ViewPlanet.new = function()
  
  --variables
  local self = {}
  local is_active = false
  local planet = nil
  local current_site = nil

  -- getters
  self.getIsActive = function() return is_active end
  self.getPlanet = function() return planet end
  
  -- setters
  self.setIsActive = function(arg) is_active = arg end
  self.setPlanet = function(arg) planet = arg end

  self.draw = function()
    if is_active then
      love.graphics.setColor(255, 255, 255, 255)
      love.graphics.print(table_as_string(planet.getComposition()), 100, 0)
      
      if current_site ~= nil then
        love.graphics.print(table_as_string(current_site.getElements()), 400, 300)
      end
      
      love.graphics.setColor(planet.getRed(), planet.getGreen(), planet.getBlue(), 255)
      love.graphics.circle("fill", 0, love.window.getHeight()/2, love.window.getHeight()/2, 100)

      local low = {255, 102, 102, 255} -- red
      local med = {255, 255, 102, 255} -- yellow
      local high = {102, 255, 102, 255} -- green
      local colour_table = {}
      table.insert(colour_table, low)
      table.insert(colour_table, med)
      table.insert(colour_table, high)

      -- planet sites
      for key,value in pairs(planet.getSites()) do
        local site = value
        local colour = colour_table[site.getQuality()]
        if site == current_site then
          love.graphics.setColor(255, 255, 255, 255)
        else
          love.graphics.setColor(colour)
        end
        love.graphics.circle("fill", site.getX(), site.getY(), 10, 5)
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
        for key,value in pairs(planet.getSites()) do
          if pointPresentInCircle(x, y, value.getX(), value.getY(), 10) then
            current_site = value
          end
        end
      end
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