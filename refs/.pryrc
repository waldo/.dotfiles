def add_path(dir="./lib")
  Dir[dir].each do |d|
    $: << d
  end
end

def rl(file=nil)
  file = @last_req if file.nil?
  file = file.to_s
  raise ArgumentError, "can't pass empty string, or no previous requires found" unless file.length > 0
  @last_req = file
  load!(@last_req)
end

def load!(file)
  files = $".select { |req| req =~ /^.*#{file}/ }
  $".delete_if { |req| files.include?(req) }
  if files.count > 0
    files.each do |f|
      require(f)
    end
  else
    require(file)
  end
end

add_path()

begin
  require "awesome_print"
  Pry.config.print = proc { |output, value| Pry::Helpers::BaseHelpers.stagger_output("=> #{value.ai}", output) }
rescue LoadError => err
  puts "no awesome_print :("
end

Pry.commands.alias_command "c", "continue"
Pry.commands.alias_command "s", "step"
Pry.commands.alias_command "n", "next"
Pry.commands.alias_command "f", "finish"
