#Work application
#ruby .\work_application.rb --name=Petr --surname=Petrovich --experience=7 --age=57 --mail=petr@gmail.com

def main
  pp ARGV
  args_in_hash = ARGV.map do |argument|
    elements = argument.split('=')
    [
      elements.first.sub(/--/, ''),
      elements.last
    ]
  end.to_h
  pp args_in_hash
end

if __FILE__ == $0
  main
end