require_relative '../caculator'

def exit_when_int
  Signal.trap('INT') do
    puts "\nexiting..."
    exit
  end
end

caculator = Caculator.new

loop do
  input = $stdin.gets
  puts "> #{caculator[input]}"
  exit_when_int
end


