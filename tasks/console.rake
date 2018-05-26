task :console do
  puts 'starting console'
  sh "irb -r ./application.rb"
end
