require "models.system"
require "helper"
require "views.system_view"
require "views.planet_view"

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
  local systems = {}
  local is_active = false

  -- views
  local view_planet = ViewPlanet.new()
  local view_system = ViewSystem.new()

  -- getters
  self.getIsActive = function() return is_active end
  self.getViewPlanet = function() return view_planet end
  self.getViewSystem = function() return view_system end
  
  -- setters
  self.setIsActive = function(arg) is_active = arg end

  self.draw = function()
    -- game is active i.e. not in the menu
    if is_active then
      love.graphics.setColor(255, 255, 255, 255)
      love.graphics.print(seed, 0, 0)

      -- views
      view_system.draw()
      view_planet.draw()
    end
  end

  self.update = function(dt)
    if is_active then
    end
  end

  -- input callbacks
  self.mousepressed = function(x, y, button)
    if is_active then
      view_planet.mousepressed(x, y, button, self)
      view_system.mousepressed(x, y, button, self)
    end
  end

  -- press 1, 2, or 3 to switch between systems. Currently there are 3
  function self.keypressed(key)
    if key == "1" then
      view_system.setSystem(systems[1])
    elseif key == "2" then
      view_system.setSystem(systems[2])
    elseif key == "3" then
      view_system.setSystem(systems[3])
    end
  end

  -- initialisation functions
  -- generate n systems
  -- NOTE: The systems should only be generated when they are visited so this needs reworking
  for i=1,3 do
    local system = System.new()
    system.generate()
    table.insert(systems, system)
  end

  -- set the starting system
  view_system.setSystem(systems[1])
  -- force the system view to be active as we start in a system
  view_system.setIsActive(true)

  return self
end