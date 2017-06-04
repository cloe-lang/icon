require 'rake'

rule '.png' => '.svg' do |t|
  sh %W[inkscape -d #{96 * 4} --export-area-drawing --export-png
        #{t.name} #{t.source}].join ' '
end

task :svgs do
  sh './icon.rb > icon.svg'
  sh './icon.rb --landscape --shadow > landscape.svg'
end

task default: :svgs do
  Rake::Task['icon.png'].invoke
  Rake::Task['landscape.png'].invoke
end
