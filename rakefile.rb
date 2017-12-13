dpi = 96

task :default do
  sh './icon.rb > icon.svg'
  sh "inkscape -d #{dpi} --export-area-drawing --export-png icon.png icon.svg"
end
