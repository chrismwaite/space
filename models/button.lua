Button = {}

Button.new = function(tag, x, y, width, height, button_colour, text, text_colour)

  local self = {}

  local tag = tag or ""
  local x = x or 0
  local y = y or 0
  local width = width or 0
  local height = height or 0
  local button_colour = button_colour or {255, 255, 255, 255}
  local text = text or ""
  local text_colour = text_colour or {0, 0, 0, 255}

  -- getters
  self.getTag = function() return tag end
  self.getX = function() return x end
  self.getY = function() return y end
  self.getWidth = function() return width end
  self.getHeight = function() return height end
  self.getButtonColour = function() return button_colour end
  self.getText = function() return text end
  self.getTextColour = function() return text_colour end

  -- setters
  self.setTag = function(arg) tag = arg end
  self.setX = function(arg) x = arg end
  self.setY = function(arg) y = arg end
  self.setWidth = function(arg) width = arg end
  self.setHeight = function(arg) height = arg end
  self.setButtonColour = function(arg) button_colour = arg end
  self.setText = function(arg) text = arg end
  self.setTextColour = function(arg) text_colour = arg end

  self.draw = function()
    love.graphics.setColor(button_colour)
    love.graphics.rectangle("fill", x, y, width, height)

    if text ~= "" then
      love.graphics.setColor(text_colour)
      love.graphics.print(text, x+(width/2), y+(height/2))
    end
  end

  return self
end