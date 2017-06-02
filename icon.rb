#!/usr/bin/env ruby

require 'chroma'
require 'xml-dsl'

def brighten(rgb)
  rgb.paint.brighten(20).saturate(40).to_hex
end

grey = '#807768'.paint.brighten(34).to_hex
yellow = brighten '#9f7d35'
red = brighten '#8c201d'

svg = xml do
  width = 240
  height = 180

  svg xmlns: 'http://www.w3.org/2000/svg', width: width, height: height do
    path d: 'M 55 170 h 30 l 75 -50 l 5 -40 Z', fill: grey
    path d: 'M 100 180 h 40 l 10 -110 h -40 Z', fill: grey
    path d: 'M 0 180 h 40 l 200 -130 h -40 Z', fill: grey

    path(
      d: 'M 55 170 h 30 l 35 -60 l -20 -40 l 30 -60 h -30 l -30 60 l 20 40 Z',
      fill: yellow
    )

    path(
      d: 'M 20 20 h 40 l 80 160 h -40 l -30 -60 l -30 60 h -40 l 50 -100 Z',
      fill: red
    )
  end
end

puts svg
