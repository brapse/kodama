local base = require 'dokidoki.base'

-- list of {number=?, {actor=?, callback=?}, ...}
local layers = {}

function register_sprite(actor, layer_number, callback)
  assert(type(layer_number) == 'number')
  local layer = nil

  for i = 1, #layers do
    if layers[i].number == layer_number then
      layer = layers[i]
    end
  end

  if not layer then
    layer = {number=layer_number}
    table.insert(layers, layer)
    table.sort(layers, function (a, b) return a.number < b.number end)
  end

  table.insert(layer, {actor=actor, callback=callback})
end

game.actors.new_generic('sprite_manager', function ()
  function draw()
    for i = 1, #layers do
      local number = layers[i].number
      layers[i] = base.ifilter(
        function (sprite) return not sprite.dead end,
        layers[i])

      local sprites = layers[i]
      sprites.number = number

      if #sprites == 0 then
        layers[i] = nil
      else
        for j = 1, #sprites do
          sprites[j].callback()
        end
      end
    end
  end
end)
