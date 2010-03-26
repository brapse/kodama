local v2 = require 'dokidoki.v2'
local game = require 'dokidoki.game'

player = game.make_blueprint('player',
  {'transform', pos=v2(100, 100), scale_x=8, scale_y=8},
  {'sprite'},
  {'player_movement'})
