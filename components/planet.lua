local gl = require 'gl'
local v2 = require 'dokidoki.v2'

radius = 100

local SEGMENTS = 64

game.actors.new_generic('planet_component', function()
  function draw()
    gl.glBegin(gl.GL_POLYGON)
    for i = 1, SEGMENTS do
      local point = v2.unit(i/SEGMENTS * 2*math.pi) * radius
      gl.glVertex2d(point.x, point.y)
    end
    gl.glEnd();
  end
end)
