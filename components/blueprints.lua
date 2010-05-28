local v2 = require 'dokidoki.v2'

player = game.make_blueprint('player',
  {'transform', pos=v2(100, 100)},
  {'sprite', image=game.resources.player_sprite},
  {'collider'},
  {'player_movement'})

plant = game.make_blueprint('plant',
  {'transform'},
  {'sprite', image=game.resources.plant_sprite},
  {'planet_growth', value = 5},
  {'collider'})

star = game.make_blueprint('star',
  {'transform'},
  {'sprite', image=game.resources.star_sprite})
  
  
star_field = game.make_blueprint('star_field',
  {'transform'},
  {'star_field'})
  
atmosphere = game.make_blueprint('atmosphere',
    {'transform'},
    {'sprite', image=game.resources.gradient})
