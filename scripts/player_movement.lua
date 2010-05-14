local v2 = require 'dokidoki.v2'

local left_key = string.byte('A')
local right_key = string.byte('D')

function update()
  local right = self.transform.facing

  if game.keyboard.key_held(left_key) then
    self.transform.pos = self.transform.pos - right
  end

  if game.keyboard.key_held(right_key) then
    self.transform.pos = self.transform.pos + right
  end
end
