require "models.planet"

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

  -- generation
  self.generate = function ()
    x = love.math.random(love.graphics.getWidth())
    y = love.math.random(love.graphics.getHeight())
    num_planets = love.math.random(1,5)

    for i=1,num_planets do
      local planet = Planet.new()
      planet.generate()
      table.insert(planets, planet)
    end
  end

  return self
end