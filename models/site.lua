Site = {}

Site.new = function()
  
  -- variables
  local self = {}
  local elements = {}
  local quality = quality or 0

  -- positioning
  local x = x or 0
  local y = y or 0
  local radius = radius or 0

  -- getters
  self.getX = function() return x end
  self.getY = function() return y end
  self.getRadius = function() return radius end
  self.getQuality = function() return quality end
  self.getElements = function() return elements end

  -- setters
  self.setX = function(arg) x = arg end
  self.setY = function(arg) y = arg end
  self.setRadius = function(arg) radius = arg end
  self.setQuality = function(arg) quality = arg end
  self.setElements = function(arg) elements = arg end

  self.generate = function (composition)
    -- in planet view, the draw radius is the height - 1/2 is chopped off for the width
    local padding = (love.window.getHeight()/2)*0.4
    x = love.math.random((love.window.getHeight()/2)-padding)
    y = love.math.random(padding, (love.window.getHeight()-padding))
    radius = love.math.random(5,20)

    -- the site quality is random with 1 being the lowest and 3 the highest
    quality = love.math.random(1,3)

    -- the composition of the planet is used to select random materials for this location
    for key,value in pairs(composition) do
      -- roll a random number based on the quality
      local random = love.math.random(1,3)
      if random <= quality then
        table.insert(elements, key)
      end
    end

  end

  return self
end