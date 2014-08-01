Planet = {}

Planet.new = function(x, y, radius, red, green, blue)
  
  -- variables
  local self = {}
  local composition = {}
  x = x or 0
  y = y or 0
  radius = radius or 0
  red = red or 0
  green = green or 0
  blue = blue or 0

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

  -- cutom methods
  self.draw = function()
    love.graphics.setColor(red, green, blue, 255)
    love.graphics.circle("fill", x, y, radius, 100)
  end

  return self
end