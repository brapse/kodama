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

game.sprite_manager.register_sprite(self, -2, function()
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
end)
