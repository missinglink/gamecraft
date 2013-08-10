
win = $ window

ratio = 1

module.exports =

  world: (obj) -> obj / ratio

  screen: (obj) -> obj * ratio

  x: (x) -> win.width() * ratio / 2 + x

  y: (y) -> win.height() * ratio / 2 + y

  setRatio: (val) -> ratio = (val)