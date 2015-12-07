require "models.galaxy"
require "helper"
require "views.system_view"
require "views.planet_view"
require "views.galaxy_view"

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
  
  local galaxies = {}
  local is_active = false

  -- views
  local view_planet = ViewPlanet.new()
  local view_system = ViewSystem.new()
  local view_galaxy = ViewGalaxy.new()

  -- getters
  self.getIsActive = function() return is_active end
  self.getViewPlanet = function() return view_planet end
  self.getViewSystem = function() return view_system end
  self.getViewGalaxy = function() return view_galaxy end
  
  -- setters
  self.setIsActive = function(arg) is_active = arg end

  self.draw = function()
    -- game is active i.e. not in the menu
    if is_active then
      love.graphics.setColor(255, 255, 255, 255)
      love.graphics.print(seed, 0, 0)

      -- views
      if view_planet.getIsActive() == true then
        view_planet.draw()
      elseif view_system.getIsActive() == true then
        view_system.draw()
      elseif view_galaxy.getIsActive() == true then
        view_galaxy.draw()
      end
    end
  end

  self.update = function(dt)
    if is_active then
      if view_system.getIsActive() == true then
        view_system.update(dt)
      end
    end
  end

  -- input callbacks
  self.mousepressed = function(x, y, button)
    if is_active then
      if view_planet.getIsActive() == true then
        view_planet.mousepressed(x, y, button, self)
      elseif view_system.getIsActive() == true then
        view_system.mousepressed(x, y, button, self)
      elseif view_galaxy.getIsActive() == true then
        view_galaxy.mousepressed(x, y, button, self)
      end
    end
  end

  self.mousemoved = function( x, y, dx, dy )
    if is_active then
      if view_galaxy.getIsActive() == true then
        view_galaxy.mousemoved(x, y, dx, dy)
      end
    end
  end

  self.keypressed = function(key)
    if is_active then
      if view_planet.getIsActive() == true then
        view_planet.keypressed(key, self)
      elseif view_system.getIsActive() == true then
        view_system.keypressed(key, self)
      elseif view_galaxy.getIsActive() == true then
        view_galaxy.keypressed(key, self)
      end

      -- escape key quits
      if key == 'escape' then
        love.event.quit()
      end
    end
  end

  self.load = function()
    -- initialisation functions
    -- generate n galaxies
    for i=1,1 do
      local galaxy = Galaxy.new()
      galaxy.generate()
      table.insert(galaxies, galaxy)
    end

    -- galaxy view is active & set starting galaxy
    view_galaxy.setGalaxy(galaxies[1])
    view_galaxy.setIsActive(true)
  end

  return self
end