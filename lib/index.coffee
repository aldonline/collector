stackval = require 'stackval'

module.exports = ->
  sv = stackval()
  attach: (f) -> ->
    collected = []
    f2 = sv.attach f, -> collected
    collected.concat [ f2.apply null, arguments ]
  collect: ( value ) -> sv.get().push value