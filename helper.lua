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