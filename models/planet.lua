require "helper"
require "models.moon"
require "models.site"

Planet = {}

Planet.new = function(x, y, radius, red, green, blue)
  
  -- variables
  local self = {}
  local composition = {}
  local moons = {}
  -- these are randomly generated points on the planet that can be mined etc.
  local sites = {}
  
  -- positioning
  local x = x or 0
  local y = y or 0
  local angle = angle or 0
  local distance = distance or 0
  local speed = speed or 0
  
  -- appearance
  local radius = radius or 0
  local red = red or 0
  local green = green or 0
  local blue = blue or 0

  -- getters
  self.getX = function() return x end
  self.getY = function() return y end
  self.getAngle = function() return angle end
  self.getRadius = function() return radius end
  self.getDistance = function() return distance end
  self.getSpeed = function() return speed end
  self.getRed = function() return red end
  self.getGreen = function() return green end
  self.getBlue = function() return blue end
  self.getComposition = function () return composition end
  self.getMoons = function () return moons end
  self.getSites = function () return sites end
  
  -- setters
  self.setX = function(arg) x = arg end
  self.setY = function(arg) y = arg end
  self.setAngle = function(arg) angle = arg end
  self.setRadius = function(arg) radius = arg end
  self.setDistance = function(arg) distance = arg end
  self.setSpeed = function(arg) speed = arg end
  self.setRed = function(arg) red = arg end
  self.setGreen = function(arg) green = arg end
  self.setBlue = function(arg) blue = arg end
  self.setComposition = function(arg) composition = arg end
  self.setMoons = function(arg) moons = arg end
  self.setSites = function(arg) sites = arg end

  -- composition
  self.generate_composition = function()
    local composition = {}

    -- this alogorithm will eventually need to take into consideration the sector in which the planet is being generated
    local elements = {"Silicon","Oxygen","Iron","Nickel","Hydrogen","Nitrogen","Aluminium"}

    -- select x items
    local num_elements = love.math.random(1,#elements)
    --print(num_elements)
    local total_value_of_elements = 0
    for i=1,num_elements do
      -- select a random element
      local random_element = love.math.random(1,#elements)
      local element = elements[random_element]
      --print(element)
      -- remove from the table so that it can't be selected again this generation
      table.remove(elements,random_element)
      -- add the element and assign a random weighting
      local weighting = love.math.random(1,10)
      total_value_of_elements = total_value_of_elements + weighting
      composition[element] = weighting
      --print(weighting)
    end
    --print(total_value_of_elements)
    local percentage_per_point = 100/total_value_of_elements
    --print(percentage_per_point)
    -- loop the composition table and assign percentage based on weighting
    local new_composition = {}
    for key,value in pairs(composition) do
      new_composition[key] = math.ceil(value * percentage_per_point)
      --print(math.ceil(value * percentage_per_point))
    end

    return new_composition
  end

  self.generateSites = function()
    local num_sites = love.math.random(5,20)
    for i=1,num_sites do
      local site = Site.new()
      site.generate(composition)
      table.insert(sites, site)
    end
  end

  -- generation methods

  -- default planet
  self.generate = function ()
    -- generate topography

    -- colour
    local colour = randomColourFromMixer(255,255,255)
    red = colour['r']
    green = colour['g']
    blue = colour['b']

    radius = love.math.random(10,50)

    -- generate position
    x = love.math.random(love.window.getWidth())
    y = love.math.random(love.window.getHeight())
    distance = love.math.random(100,400)
    speed = love.math.random(5,20)*0.0002

    -- generate composition
    self.setComposition(self.generate_composition())

    -- generate moons
    local num_moons = love.math.random(0,2)
    for i=1,num_moons do
      local moon = Moon.new()
      moon.generate()
      -- the position should match the planet
      moon.setX(x)
      moon.setY(y)
      -- the distance should be the radius of the planet + the radius of the moon + a bit
      -- but actually randum
      moon.setDistance(love.math.random(radius+moon.getRadius()+10,radius+moon.getRadius()+40))
      -- the radius should be a percentage of the planet radius
      moon.setRadius(0.25*radius)
      table.insert(moons, moon)
    end

    -- generate sites
    -- this determines the access to the elements that form the composition
    self.generateSites()
  end

  -- primary star
  self.generatePrimary = function ()
    x = love.window.getWidth()/2
    y = love.window.getHeight()/2

    local colour = randomColourFromMixer(255,255,255)
    red = 255
    green = 250
    blue = colour['b']

    radius = love.math.random(30,50)
  end

  return self
end