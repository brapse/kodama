local v2 = require 'dokidoki.v2'
local glfw = require 'glfw'

local left_key  = glfw.KEY_LEFT
local right_key = glfw.KEY_RIGHT
local up_key    = glfw.KEY_UP
local plant_key = string.byte(' ')
local camera_key = string.byte('Z')

local speed = 0.40
local jump_speed = 5

    

function update()
  local right = self.transform.facing
  local up    = v2.rotate90(right)

  if self.collider.is_grounded then
    if game.keyboard.key_held(left_key) then
      self.collider.apply_impulse(-right * speed)
    end

    if game.keyboard.key_held(right_key) then
      self.collider.apply_impulse(right * speed)
    end

    if game.keyboard.key_pressed(up_key) then
      self.collider.apply_impulse(up * jump_speed)
    end
  end

  if game.keyboard.key_pressed(plant_key) then
    game.actors.new(game.blueprints.plant,
      {'transform', pos = self.transform.pos})
  end
  
  
  if game.keyboard.key_pressed(camera_key) then
     game.camera.toggle_zoom()
    
  end
  
  
  
  
end
