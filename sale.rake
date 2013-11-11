task :sale do
  system("ruby wombat.rb")
end

task :default => [:sale]
