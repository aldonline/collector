class Collector
  constructor: -> @_stack = []
  collect: ( value ) => @_stack[-1..][0]?.push value
  # combinator that wraps a function so it creates a clean stack for itself
  attach : ( func ) =>
    unless typeof func is 'function'
      throw new Error 'function argument required'
    =>
      try
        @_stack.push []
        returned  = func.apply null, arguments
        @_stack.pop().concat [returned]
      catch e
        @_stack.pop()
        throw e

module.exports = -> new Collector