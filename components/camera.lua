local gl = require 'gl'
local v2 = require 'dokidoki.v2'

-- height off the ground to center the camera in zoomed in mode
local eye_level = 32

local zoomed_in = false
local target = nil

local angle = 0
local center = v2.zero
local zoom

-- wrap the angle between [-math.pi, math.pi)
local function normalize_angle(a)
  return (a + math.pi) % (2*math.pi) - math.pi
end

-- sets the zoomed-in camera target. nil to disable.
function set_target(t)
  assert(t == nil or (t and t.transform))
  target = t
end

function set_zoomed_in(z)
  zoomed_in = z
end

game.actors.new_generic('camera_component', function()
  function update()
    set_zoomed_in(game.keyboard.key_held(string.byte('Z')))

    local target_angle, target_center, target_zoom

    if zoomed_in and target then
      target_angle = -v2.angle(target.transform.facing)
      target_center = target.transform.pos
                      + v2.norm(target.transform.pos) * eye_level
      target_zoom = eye_level * 3
    else
      target_angle = 0
      target_center = v2.zero
      target_zoom = game.planet.radius * 4
    end

    -- angle change
    local delta = target_angle - angle
    if delta > math.pi then delta = delta - 2*math.pi end
    if delta <= -math.pi then delta = delta + 2*math.pi end
    angle = normalize_angle(angle + delta/10)

    -- center change
    center = center + (target_center - center) / 10

    -- zoom change
    if not zoom then
      zoom = target_zoom
    else
      zoom = zoom + (target_zoom - zoom) / 10
    end
  end

  function draw_setup()
    gl.glTranslated(game.opengl_2d.width/2, game.opengl_2d.height/2, 0)
    gl.glRotated(angle/math.pi*180, 0, 0, 1)
    local scale = game.opengl_2d.height / zoom
    gl.glScaled(scale, scale, scale)
    gl.glTranslated(-center.x, -center.y, 0)

  end
end)
