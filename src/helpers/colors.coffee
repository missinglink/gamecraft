
module.exports =

  mixHSL: (a, b, amt) ->
    amt = 0.5 if not amt?
    amt = amt / 100

    h = amt * a.hue() + (1 - amt) * b.hue()
    s = amt * a.saturation() + (1 - amt) * b.saturation()
    l = amt * a.lightness() + (1 - amt) * b.lightness()

    return $.Color hue: h, saturation: s, lightness: l

  mixRGB: (a, b, amt) ->
    amt = 0.5 if not amt?
    amt = amt / 100

    r = amt * a.red() + (1 - amt) * b.red()
    g = amt * a.green() + (1 - amt) * b.green()
    b = amt * a.blue() + (1 - amt) * b.blue()

    return $.Color r, g, b
