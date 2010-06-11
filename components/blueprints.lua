local v2 = require 'dokidoki.v2'

player = game.make_blueprint('player',
  {'transform', pos=v2(100, 100)},
  {'layered_sprite', layer=2, image=game.resources.player_sprite},
  {'collider'},
  {'player_movement'})

plant = game.make_blueprint('plant',
  {'transform'},
  {'layered_sprite', layer=1, image=game.resources.plant_sprite},
  {'planet_growth', value = 5},
  {'collider'})

star_field = game.make_blueprint('star_field',
  {'transform'},
  {'star_field'})
