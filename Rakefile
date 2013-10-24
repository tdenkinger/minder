task :default => [:test]

task :test do
  exec "bundle exec rspec --color"
end

task :run do
  exec 'rerun "rackup"'
end
