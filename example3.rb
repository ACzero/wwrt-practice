# chapter 5

require 'benchmark'
require 'open-uri'

time = Benchmark.measure do
  3.times.map do
    Thread.new do
      open('http://zombo.com')
    end
  end.each(&:join)
end

puts time
