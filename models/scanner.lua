Scanner = {}

Scanner.new = function(x, y)

  local self = {}

  local x = x or 0
  local y = y or 0
  local scan_radius = 50

  -- getters
  self.getX = function() return x end
  self.getY = function() return y end
  self.getScanRadius = function() return scan_radius end

  -- setters
  self.setX = function(arg) x = arg end
  self.setY = function(arg) y = arg end
  self.setScanRadius = function(arg) y = scan_radius end
  
  return self
end