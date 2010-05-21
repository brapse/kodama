local v2 = require 'dokidoki.v2'

velocity = v2.zero
gravity  = -0.4
local decay = 0.99

function update()
  -- apply gravity
  apply_impulse(gravity * v2.norm(self.transform.pos))
  -- decay velocity
  velocity = velocity * decay
  self.transform.pos = self.transform.pos + velocity

end

--handle player movement
function update_correction()
  if self.transform.pos ~= v2.zero then
    local distance = v2.mag(self.transform.pos)
    local up = self.transform.pos / distance
    local is_inside = distance < game.planet.radius

    self.transform.facing = -v2.rotate90(up)

    -- keep player from being inside the planet
    if is_inside then
      velocity = velocity - v2.project(velocity, up)
      self.transform.pos = up * game.planet.radius
    end
  end

end

function apply_impulse(impulse)
  velocity = velocity + impulse
end
