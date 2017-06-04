dpi = 96 * 4

task :default do
  sh './icon.rb > icon.svg'
  sh "inkscape -d #{dpi} --export-area-drawing --export-png icon.png icon.svg"

  sh './icon.rb --landscape --shadow > landscape.svg'
  sh %W[inkscape -d #{dpi} --export-area -400:-40:540:210 --export-png
        landscape.png landscape.svg].join ' '
end
