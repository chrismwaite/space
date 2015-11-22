require 'views.menu_view'
require 'game'

local menu = Menu.new()
local game = Game.new()

function love.load()
  menu.setIsActive(true)
end

function love.update(dt)
   game.update(dt)
   menu.update(dt)
end

function love.draw()
   game.draw()
   menu.draw()
end

function love.keypressed(key)
   game.keypressed(key)
end

function love.mousepressed(x, y, button)
  if menu.mousepressed(x, y, button) then
    menu.setIsActive(false)
    game.setIsActive(true)
  end
  game.mousepressed(x, y, button)
end

function love.mousemoved( x, y, dx, dy )
  game.mousemoved( x, y, dx, dy )
end