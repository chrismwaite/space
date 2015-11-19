Menu = {}

Menu.new = function()
  
  --variables
  local self = {}
  local is_active = false

  -- getters
  self.getIsActive = function() return is_active end
  
  -- setters
  self.setIsActive = function(arg) is_active = arg end

  self.draw = function()
    if is_active then
      love.graphics.setColor(255, 255, 255, 255)
      love.graphics.print("Space trading and mining", love.graphics.getWidth()/2, love.graphics.getHeight()/2)
      love.graphics.print("(Click to begin)", love.graphics.getWidth()/2, (love.graphics.getHeight()/2)+20)
    end
  end

  self.update = function(dt)
    if is_active then
    end
  end

  -- input callbacks
  self.mousepressed = function(x, y, button)
    if is_active then
      if button == 'l' then
        return true
      end
      return false
    end
    return false
  end

  return self
end