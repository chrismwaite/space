Planet = {}

Planet.new = function(x, y, radius, red, green, blue)
  
  -- variables
  local self = {}
  local composition = {}
  local x = x or 0
  local y = y or 0
  local radius = radius or 0
  local red = red or 0
  local green = green or 0
  local blue = blue or 0

  -- getters
  self.getX = function() return x end
  self.getY = function() return y end
  self.getRadius = function() return radius end
  self.getRed = function() return red end
  self.getGreen = function() return green end
  self.getBlue = function() return blue end
  self.getComposition = function () return composition end
  
  -- setters
  self.setX = function(arg) x = arg end
  self.setY = function(arg) y = arg end
  self.setRadius = function(arg) radius = arg end
  self.setRed = function(arg) red = arg end
  self.setGreen = function(arg) green = arg end
  self.setBlue = function(arg) blue = arg end
  self.setComposition = function(arg) composition = arg end

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

  -- generation
  self.generate = function ()
    -- generate topography
    red = love.math.random(1,255)
    green = love.math.random(1,255)
    blue = love.math.random(1,255)
    x = love.math.random(love.graphics.getWidth())
    y = love.math.random(love.graphics.getHeight())
    radius = love.math.random(10,50)

    -- generate composition
    self.setComposition(self.generate_composition())
  end

  return self
end