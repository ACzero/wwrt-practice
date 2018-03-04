# chapter 5

require 'benchmark'
require 'digest/md5'

time = Benchmark.measure do
  100.times.map do
    Thread.new do
      Digest::MD5.hexdigest(rand.to_s)
    end
  end.each(&:value)
end

puts time
