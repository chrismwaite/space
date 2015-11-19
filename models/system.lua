require "planet"

System = {}

-- x, y are coordinates in a galaxy
System.new = function(x, y, num_planets)
  
  -- variables
  local self = {}
  local planets = {}
  x = x or 0
  y = y or 0
  num_planets = num_planets or 3

  -- getters
  self.getX = function() return x end
  self.getY = function() return y end
  self.getNumPlanets = function () return num_planets end
  self.getPlanets = function () return planets end
  
  -- setters
  self.setX = function(arg) x = arg end
  self.setY = function(arg) y = arg end
  self.setNumPlanets = function(arg) num_planets = arg end
  self.setPlanets = function(arg) planets = arg end

  -- cutom methods
  self.draw = function()
    --love.graphics.setColor(red, green, blue, 255)
    --love.graphics.circle("fill", x, y, radius, 100)
  end

  -- generate planets


  return self
end