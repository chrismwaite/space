require "models.system"

Galaxy = {}

-- x, y are coordinates in the universe?
Galaxy.new = function()
  
  -- variables
  local self = {}
  local systems = {}
  local x = x or 0
  local y = y or 0
  local num_systems = num_systems or 100

  -- getters
  self.getX = function() return x end
  self.getY = function() return y end
  self.getNumSystems = function () return num_systems end
  self.getSystems = function () return systems end
  
  -- setters
  self.setX = function(arg) x = arg end
  self.setY = function(arg) y = arg end
  self.setNumSystems = function(arg) num_systems = arg end
  self.setSystems = function(arg) systems = arg end

  -- generation
  self.generate = function ()
    x = love.math.random(love.graphics.getWidth())
    y = love.math.random(love.graphics.getHeight())
    num_systems = love.math.random(50,100)

    -- NOTE: The systems should only be generated when they are visited so this needs reworking
    for i=1,num_systems do
      local system = System.new()
      system.generate()
      table.insert(systems, system)
    end
  end

  return self
end