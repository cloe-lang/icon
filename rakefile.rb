dpi = 96 * 4

task :default do
  sh './icon.rb > icon.svg'
  sh "inkscape -d #{dpi} --export-area-drawing --export-png icon.png icon.svg"
  sh %W[inkscape -d #{dpi} --export-area -15:0:155:170 --export-png
        square.png icon.svg].join ' '

  sh './icon.rb --shadow > shadowed.svg'
  sh %w[inkscape -d 96 --export-area -100:0:240:170 --export-png
        shadowed.png shadowed.svg].join ' '
end
