stackval = require 'stackval'

module.exports = ->
  sv = stackval()
  x = ( value ) -> sv.get().push value
  x.attach = (f) -> ->
    collected = []
    f2 = sv.attach f, -> collected
    collected.concat [ f2.apply null, arguments ]
  x.collect = x
  x