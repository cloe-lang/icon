#!/usr/bin/env ruby

require 'xml-dsl'

GREEN = '#004225'.freeze
YELLOW = '#F0C420'.freeze

puts(xml do
  svg xmlns: 'http://www.w3.org/2000/svg', width: 200, height: 320 do
    rect width: '100%', height: '100%', fill: 'white'
    polygon points: '0,0 200,0 0,320', fill: GREEN
    polygon points: '75,320 200,120 200,320', fill: YELLOW
  end
end)
