local gl = require 'gl'
local v2 = require 'dokidoki.v2'

game.actors.new_generic('camera_component', function()
  function draw_setup()
    gl.glTranslated(game.opengl_2d.width/2, game.opengl_2d.height/2, 0)
  end
end)
