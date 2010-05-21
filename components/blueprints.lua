local v2 = require 'dokidoki.v2'

player = game.make_blueprint('player',
  {'transform', pos=v2(100, 100) },
  {'sprite', image=game.resources.player_sprite},
  {'collider'},
  {'player_movement'})

plant = game.make_blueprint('plant',
  {'transform'},
  {'sprite', image=game.resources.plant_sprite},
  {'collider'})

