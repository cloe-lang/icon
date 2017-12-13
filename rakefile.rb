dpi = 96

task :default do
  sh './icon.rb > icon.svg'
  sh "inkscape -d #{dpi} --export-area-drawing --export-png icon.png icon.svg"
  sh %W[inkscape -d #{dpi} --export-area -50:-50:210:210 --export-png
        spaced.png icon.svg].join ' '
end
