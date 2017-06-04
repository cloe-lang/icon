#!/usr/bin/env ruby

require 'chroma'
require 'docopt'
require 'xml-dsl'

args = Docopt.docopt "
Icon generator

Usage:
  #{__FILE__} [--landscape] [--shadow]
"

red, yellow = %w[#8c201d #9f7d35].map do |rgb|
  rgb.paint.brighten(20).saturate(40).to_hex
end

puts(xml do
  svg xmlns: 'http://www.w3.org/2000/svg',
      width: (args['--shadow'] ? 240 : 140),
      height: 170 do
    if args['--shadow']
      defs do
        linearGradient id: 'shadowColor',
                       x1: '0%', y1: '100%',
                       x2: '0%', y2: '0%' do
          stop offset: '0%',
               'stop-color' => 'black',
               'stop-opacity' => '50%'
          stop offset: '85%',
               'stop-color' => 'black',
               'stop-opacity' => '0%'
        end

        clipPath id: 'shadowPath' do
          path d: 'M 55 160 h 30 l 75 -50 l 5 -40 Z'
          path d: 'M 100 170 h 40 l 10 -110 h -40 Z'
          path d: 'M 0 170 h 40 l 200 -130 h -40 Z'
        end
      end

      rect width: '100%', height: '100%',
           fill: 'url(#shadowColor)',
           'clip-path' => 'url(#shadowPath)'
    end

    path(
      d: 'M 55 160 h 30 l 35 -60 l -20 -40 l 30 -60 h -30 l -30 60 l 20 40 Z',
      fill: yellow
    )

    path(
      d: 'M 20 10 h 40 l 80 160 h -40 l -30 -60 l -30 60 h -40 l 50 -100 Z',
      fill: red
    )
  end
end)
