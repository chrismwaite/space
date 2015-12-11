require "helper"
require "models.button"
require "models.scanner"

ViewPlanet = {}

ViewPlanet.new = function()
  
  --variables
  local self = {}
  local is_active = false
  local planet = nil
  local current_site = nil

  -- mode e.g. scan etc
  local mode = nil
  -- drones
  local scanners = {}

  -- interface
  local buttons = {}

  -- getters
  self.getIsActive = function() return is_active end
  self.getPlanet = function() return planet end
  
  -- setters
  self.setIsActive = function(arg) is_active = arg end
  self.setPlanet = function(arg) planet = arg end

  self.draw = function()
    if is_active then
      -- composition string
      love.graphics.setColor(255, 255, 255, 255)
      love.graphics.print(table_as_string(planet.getComposition()), 100, 0)
      
      -- current site composition string
      if current_site ~= nil then
        love.graphics.print(table_as_string(current_site.getElements()), 400, 300)
      end
      
      -- planet
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
        love.graphics.circle("fill", site.getX(), site.getY(), site.getRadius(), 10)
      end

      -- buttons
      for key,value in pairs(buttons) do
        value.draw()
      end
    end
  end

  self.load = function()
    -- buttons
    local scan_button = Button.new("scan", love.window.getWidth()-100, 20, 80, 20, {255, 255, 255, 255}, "Scan", {0, 0, 0, 255})
    table.insert(buttons, scan_button)
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

        for key,value in pairs(buttons) do
          if pointPresentInButton(x, y, value) then
            local button = value
            if button.getTag() == "scan" then
              love.mouse.setCursor(love.mouse.getSystemCursor("crosshair"))
            end
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