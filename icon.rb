#!/usr/bin/env ruby

require 'xml-dsl'

PRIMARY = 'teal'.freeze
SECONDARY = 'tomato'.freeze

puts(xml do
  svg xmlns: 'http://www.w3.org/2000/svg', width: 160, height: 160 do
    path d: 'M 0 0 h 160 l -80 80 l 80 80 h -160', fill: PRIMARY
    rect x: 30, y: 30, width: 100, height: 100, fill: SECONDARY
    rect x: 60, y: 60, width: 40, height: 40, fill: PRIMARY
  end
end)
