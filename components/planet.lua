local gl = require 'gl'
local v2 = require 'dokidoki.v2'

radius = 50

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

  function update()
    local target_radius = 50
    for _, growth in ipairs(game.actors.get('planet_growth')) do
      target_radius = target_radius + growth.planet_growth.value
    end
    game.planet.radius = game.planet.radius * 0.8 + target_radius * 0.2
  end
end)
