local v2 = require 'dokidoki.v2'

function update_correction()
  if self.transform.pos ~= v2.zero then
    local up = v2.norm(self.transform.pos)
    self.transform.pos = up * game.planet.radius
    self.transform.facing = -v2.rotate90(up)
  end
end
