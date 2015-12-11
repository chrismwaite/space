-- helper functions
function table_as_string(t)
  local output = "{"
  for key,value in pairs(t) do
    output = output .. key .. "=" .. value .. ","
  end
  return rtrim(output) .. "}"
end

function rtrim(s)
  return s:gsub(",$","")
end

function pointPresentInCircle(pointX, pointY, objectX, objectY, radius)
  if pointX > objectX-radius and pointX < objectX+radius and pointY > objectY-radius and pointY < objectY+radius then
    return true
  end
  return false
end

function pointPresentInButton(pointX, pointY, button)
  if pointX > button.getX() and pointX < (button.getX()+button.getWidth()) and pointY > button.getY() and pointY < (button.getY()+button.getHeight()) then
    return true
  end
  return false
end

function randomColourFromMixer(red, green, blue)
  local randomColour = {}
  randomColour['r'] = love.math.random(1,255)
  randomColour['g'] = love.math.random(1,255)
  randomColour['b'] = love.math.random(1,255)

  local newColour = {}
  newColour['r'] = (randomColour['r'] + red)/2
  newColour['g'] = (randomColour['g'] + green)/2
  newColour['b'] = (randomColour['b'] + blue)/2

  return newColour
end