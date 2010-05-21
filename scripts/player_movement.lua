local v2 = require 'dokidoki.v2'

local left_key = string.byte('A')
local right_key = string.byte('D')
local plant_key = string.byte(' ')

local speed = 2

function update()
  local right = self.transform.facing

  if game.keyboard.key_held(left_key) then
    self.transform.pos = self.transform.pos - right * speed
  end

  if game.keyboard.key_held(right_key) then
    self.transform.pos = self.transform.pos + right * speed
  end

  if game.keyboard.key_pressed(plant_key) then
    game.actors.new(game.blueprints.plant,
      {'transform', pos = self.transform.pos})
  end
end
