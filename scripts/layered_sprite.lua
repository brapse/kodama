local gl = require 'gl'

assert(image, 'missing image argument')
assert(layer, 'missing layer argument')

game.sprite_manager.register_sprite(self, layer, function ()
  -- TODO: do these transforms directly, much faster!
  gl.glPushMatrix()
  gl.glTranslated(self.transform.pos.x, self.transform.pos.y, 0)
  -- slooooow and stupid rotation:
  local f = self.transform.facing
  gl.glRotated(180/math.pi * math.atan2(f.y, f.x), 0, 0, 1)
  gl.glScaled(self.transform.scale_x, self.transform.scale_y, 0)

  if color then gl.glColor4d(color[1], color[2], color[3], color[4] or 1) end
  image:draw()
  if color then gl.glColor3d(1, 1, 1) end

  gl.glPopMatrix()
end)
