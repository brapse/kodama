require 'dokidoki.module' [[]]

local kernel = require 'dokidoki.kernel'
local game = require 'dokidoki.game'
local v2 = require 'dokidoki.v2'

kernel.start_main_loop(game.make_game(
  {'update_setup', 'update', 'update_correction', 'update_cleanup'},
  {'draw_setup', 'draw', 'draw_debug'},
  function (game)
    game.init_component('exit_handler')
    game.exit_handler.trap_esc = true
    game.init_component('keyboard')
    game.init_component('opengl_2d')

    game.init_component('blueprints')
    game.init_component('resources')

    game.init_component('camera')
    game.init_component('planet')

    game.actors.new(game.blueprints.player)
  end))
