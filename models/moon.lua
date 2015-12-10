Moon = {}

Moon.new = function()
  
  -- variables
  local self = {}
  
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

  -- generation methods

  -- default moon
  self.generate = function ()
    -- generate topography

    -- colour
    red = 255
    green = 255
    blue = 255
    radius = 10
    distance = 50
    speed = love.math.random(10,40)*0.0002
  end

  return self
end