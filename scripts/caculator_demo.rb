require_relative '../caculator'

Signal.trap('INT') do
  puts "\nexiting..."
  exit
end

caculator = Caculator.new

loop do
  input = $stdin.gets
  puts "> #{caculator[input]}"
end


