dpi = 96

task :default do
  sh './icon.rb > icon.svg'
  sh "inkscape -d #{dpi} --export-area-drawing --export-png icon.png icon.svg"
  sh %W[inkscape -d #{dpi} --export-area -60:0:260:320 --export-png
        square.png icon.svg].join ' '
end
