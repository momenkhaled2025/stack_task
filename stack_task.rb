require 'benchmark'

class Stack
  def initialize
    @stack = []
    @max = nil
    @sum = 0
    @count = 0
  end

  def push(number)
    @stack.push(number)
    @sum += number
    @count += 1

    if @max.nil? || number > @max
      @max = number
    end
  end

  def pop
    unless @stack.empty?
      number = @stack.pop
      @sum -= number
      @count -= 1

      if number == @max
        @max = @stack.max
      end

      number
    end
  end

  def max
    @max
  end
end

class Extras < Stack
  def mean
    if @count == 0
      nil
    else
      @sum.to_f / @count
    end
  end
end

stack = Extras.new

push_time = Benchmark.measure do
  10_000_000.times do
    stack.push(rand(1..10))
  end
end

puts "Max value: #{stack.max}"
puts "Mean value: #{stack.mean}"

max_time = Benchmark.measure do
  stack.max
end

mean_time = Benchmark.measure do
  stack.mean
end



puts "Time to push  elements: #{push_time.real} seconds"
puts "Time to get max: #{max_time.real} seconds"
puts "Time to get mean: #{mean_time.real} seconds"