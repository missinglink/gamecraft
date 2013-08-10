
ratio = 1

module.exports =

  world: (obj) ->
    if typeof obj is 'object'
      out = {}
      for key, val of obj
        out[key] = @world val
      return out
    else
      return obj * ratio

  screen: (obj) ->
    console.log obj
    if typeof obj is 'object'
      out = {}
      for key, val of obj
        out[key] = @screen val
      return out
    else
      return obj / ratio
