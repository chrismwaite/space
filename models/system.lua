require "models.planet"

System = {}

-- x, y are coordinates in a galaxy
System.new = function()
  
  -- variables
  local self = {}
  local planets = {}
  local primary_star = nil
  local x = x or 0
  local y = y or 0
  local radius = radius or 0
  local original_radius = original_radius or 0
  local luminosity = luminosity or 0
  local num_planets = num_planets or 3

  -- getters
  self.getX = function() return x end
  self.getY = function() return y end
  self.getRadius = function() return radius end
  self.getOriginalRadius = function() return original_radius end
  self.getLuminosity = function() return luminosity end
  self.getNumPlanets = function () return num_planets end
  self.getPlanets = function () return planets end
  self.getPrimaryStar = function () return primary_star end
  
  -- setters
  self.setX = function(arg) x = arg end
  self.setY = function(arg) y = arg end
  self.setRadius = function(arg) radius = arg end
  self.setLuminosity = function(arg) luminosity = arg end
  self.setNumPlanets = function(arg) num_planets = arg end
  self.setPlanets = function(arg) planets = arg end

  -- generation
  self.generate = function ()
    -- system generation variables
    x = love.math.random(love.graphics.getWidth())
    y = love.math.random(love.graphics.getHeight())
    radius = love.math.random(1,3)
    original_radius = radius
    luminosity = love.math.random(50,255)
    num_planets = love.math.random(1,5)

    -- create the planets

    -- primary star
    primary_star = Planet.new()
    primary_star.generatePrimary()

    -- planets
    for i=1,num_planets do
      local planet = Planet.new()
      planet.generate()
      table.insert(planets, planet)
    end
  end

  return self
end