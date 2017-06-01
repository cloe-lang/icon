#!/usr/bin/env ruby

require 'chroma'
require 'xml-dsl'

SCALE = 100

brown = '#62432f'
grey = '#807768'
yellow = '#9f7d35'
red = '#8c201d'

def color(rgb)
  rgb.paint.saturate.to_hex
end

def scale(number)
  (number * SCALE).round
end

def points(*points)
  points.map do |x, y|
    "#{scale x},#{scale y}"
  end.join ' '
end

svg = xml do
  width = 6 * SCALE
  height = 3 * SCALE

  svg xmlns: 'http://www.w3.org/2000/svg', width: width, height: height do
    polygon points: points([1.5, 0], [2.3, 0], [3.8, 3], [3, 3]),
            fill: color(brown)
    polygon points: points([0, 1], [5, 1], [5.5, 2], [0.5, 2]),
            fill: color(grey)
    polygon points: points([0.5, 0], [1.3, 0], [2.8, 3], [2, 3]),
            fill: color(yellow)
    polygon points: points([2.5, 0], [3.5, 0], [5, 3], [4, 3], [3.5, 2],
                           [3, 3], [2, 3], [3, 1]),
            fill: color(red)
  end
end

puts svg
