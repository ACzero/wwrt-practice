# chapter 5

@counter = 0

5.times.map do
  Thread.new do
    temp = @counter
    temp = temp + 1

    # puts 'uncomment me you easily meet race condition'

    @counter = temp
  end
end.each(&:join)

puts @counter
