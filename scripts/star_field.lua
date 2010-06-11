local gl = require 'gl'
local v2 = require 'dokidoki.v2'

local sprites = {}

for i=1, 200 do
  sprites[i] = {
    pos = v2.random()*300,
    scale = math.random() * 0.1 + 0.05,
    image = game.resources.star_sprite
  }
  -- todo:
  -- - randomize color
  -- - randomize image
end

function draw()
  gl.glPushMatrix()
  local camera_scale = 1/game.camera.scale
  gl.glScaled(camera_scale, camera_scale, camera_scale)

  for i = 1, #sprites do
    local s = sprites[i]
    local pos = s.pos
    local scale = s.scale

    gl.glPushMatrix()
    gl.glTranslated(pos.x, pos.y, 0)
    gl.glScaled(scale, scale, scale)
    s.image:draw()
    gl.glPopMatrix()
  end

  gl.glPopMatrix()
end

local atmo = game.actors.new(game.blueprints.atmosphere)
atmo.sprite.color = {1,1,1,0.5} 
atmo.transform.scale_x = 0.4
atmo.transform.scale_y= 0.4
