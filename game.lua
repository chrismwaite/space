require "planet"
require "helper"
require "view_planet"

Game = {}

Game.new = function()
  
  --variables
  local self = {}
   -- record and set the random seed
  seed = os.time()
  --seed = 1394190375
  love.math.setRandomSeed(seed)
  -- first number is always the same regardless of seed (could be useful)
  test_random = love.math.random(1000)
  -- second number abides by seed
  test_random2 = love.math.random(1000)
  -- planets table
  local planets = {}
  local is_active = false

  --other screens
  local view_planet = ViewPlanet.new()

  -- getters
  self.getIsActive = function() return is_active end
  
  -- setters
  self.setIsActive = function(arg) is_active = arg end

  self.draw = function()
    if is_active then
      if view_planet.getIsActive() == false then
        love.graphics.setColor(255, 255, 255, 255)
        love.graphics.print(seed, 0, 0)
        for key,value in pairs(planets) do
          value.draw()
        end
      end
      --try to draw other screens if they're active
      view_planet.draw()
    end
  end

  self.update = function(dt)
    if is_active then
    end
  end

  -- object generation algorithms

  -- generate a random planet
  self.generate_planet = function()
    local red = love.math.random(1,255)
    local green = love.math.random(1,255)
    local blue = love.math.random(1,255)
    local x = love.math.random(love.graphics.getWidth())
    local y = love.math.random(love.graphics.getHeight())
    local radius = love.math.random(10,50)

    local planet = Planet.new(x,y,radius,red,green,blue)
    planet.setComposition(self.generate_composition())
    table.insert(planets, planet)
  end

  -- generate random planet composition
  self.generate_composition = function()
    local composition = {}

    -- this alogorithm will eventually need to take into consideration the sector in which the planet is being generated
    local elements = {"Silicon","Oxygen","Iron","Nickel","Hydrogen","Nitrogen","Aluminium"}

    -- select x items
    local num_elements = love.math.random(1,#elements)
    print(num_elements)
    local total_value_of_elements = 0
    for i=1,num_elements do
      -- select a random element
      local random_element = love.math.random(1,#elements)
      local element = elements[random_element]
      print(element)
      -- remove from the table so that it can't be selected again this generation
      table.remove(elements,random_element)
      -- add the element and assign a random weighting
      local weighting = love.math.random(1,10)
      total_value_of_elements = total_value_of_elements + weighting
      composition[element] = weighting
      print(weighting)
    end
    print(total_value_of_elements)
    local percentage_per_point = 100/total_value_of_elements
    print(percentage_per_point)
    -- loop the composition table and assign percentage based on weighting
    local new_composition = {}
    for key,value in pairs(composition) do
      new_composition[key] = math.ceil(value * percentage_per_point)
      print(math.ceil(value * percentage_per_point))
    end

    return new_composition
  end

  -- input callbacks
  self.mousepressed = function(x, y, button)
    if is_active then
      if button == 'l' then
        for key,value in pairs(planets) do
          if pointPresentInCircle(x, y, value.getX(), value.getY(), value.getRadius()) then
            view_planet.setPlanet(value)
            view_planet.setIsActive(true)
          end
        end
      end
      view_planet.mousepressed(x, y, button)
    end
  end

  -- initialisation functions
  -- generate n planets
  for i=1,3 do
    self.generate_planet()
  end

  return self
end