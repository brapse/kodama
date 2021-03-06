local v2 = require 'dokidoki.v2'

velocity = v2.zero
gravity  = -0.4
friction = 0.1
local decay = 0.99
local impulse_accumulator = v2.zero

is_grounded = false

function update()
  -- apply gravity
  apply_impulse(gravity * v2.norm(self.transform.pos))

  local old_velocity = velocity
  velocity = (velocity + impulse_accumulator) * decay
  impulse_accumulator = v2.zero
  self.transform.pos = self.transform.pos + (old_velocity + velocity) / 2
end

local function apply_friction(velocity, friction)
  local sign = 1
  if velocity < 0 then
    sign = -1
  end

  return math.max(velocity * sign - friction, 0) * sign
end

--handle player movement
function update_correction()
  if self.transform.pos ~= v2.zero then
    local distance = v2.mag(self.transform.pos)
    local up = self.transform.pos / distance
    local right = -v2.rotate90(up)

    self.transform.facing = right

    local is_inside = distance < game.planet.radius
    -- keep player from being inside the planet
    if is_inside then
      is_grounded = true
      local vertical_velocity   = v2.dot(velocity, up)
      local horizontal_velocity = v2.dot(velocity, right)

      horizontal_velocity = apply_friction(horizontal_velocity, friction) * 0.9

      -- if their vertical velocity is downwards then eliminate it
      if vertical_velocity < 0 then
        vertical_velocity = 0
      end

      velocity = (vertical_velocity * up) + (horizontal_velocity * right)

      -- pull the player out of the planet
      self.transform.pos = up * game.planet.radius
    else
      is_grounded = false
    end
  end
end

function apply_impulse(impulse)
  impulse_accumulator = impulse_accumulator + impulse
end
