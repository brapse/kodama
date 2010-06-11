local gl = require 'gl'
local v2 = require 'dokidoki.v2'

for i=1, 200 do
  local star = game.actors.new(game.blueprints.star)
  star.transform.pos = v2(math.random(-300,300),math.random(-200,200))
  star.transform.scale_x = math.random()*0.15
  star.transform.scale_y= star.transform.scale_x
  star.sprite.color = {1,1,1,star.transform.scale_x*3} 
  
  angle = math.rad( (math.random(0,360)) )
  star.transform.facing = v2.unit(angle)
end
