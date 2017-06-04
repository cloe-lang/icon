require 'rake'

rule '.png' => '.svg' do |t|
  sh "inkscape -d #{96 * 4} --export-area-drawing --export-png #{t.name} #{t.source}"
end

task :svgs do
  sh './icon.rb > icon.svg'
  sh './icon.rb --landscape > landscape.svg'
end

task default: :svgs do
  Rake::Task['icon.png'].invoke
  Rake::Task['landscape.png'].invoke
end
