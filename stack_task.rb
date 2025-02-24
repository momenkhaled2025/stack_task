class Stack
  
  def initialize
    @stack = []
    @max_stack = []
    @sum = 0 
    @count = 0
  end
  
  def push(number)
    @stack.push(number)
    
    @sum +=number
    @count+=1
    
    if @max_stack.empty? || number >= @max_stack.last
      @max_stack.push(number)
    else   
      @max_stack.push(@max_stack.last)   
    end
    
  end
  
   def pop
    return if @stack.empty?
    
    number = @stack.pop
     
    @sum -=number
    @count-=1
              
    @max_stack.pop
   end
  
   def max
    @max_stack.last 
   end
end


class Extras < Stack
  def mean
    return "Not element existing in Stack !" if @count == 0
    @sum.to_f / @count
  end
end

stack = Extras.new

stack.push(3)
stack.push(2)
stack.push(5)
stack.push(1)
stack.pop
stack.pop

puts stack.max
puts stack.mean


