# Два стека, ограниченные в совокупности
class TrplStack
  DEF_SIZE = 7

  def initialize(size = DEF_SIZE)
    @array = Array.new(size)
    empty
  end

  def empty(stack = nil)
    case stack
    when nil
      @head0 = @head1 = @head2 = 0
    when 0
      @head0 = 0
    when 1
      @head1 = 0
    when 2
      @head2 = 0
    else
      raise 'Wrong stack'
    end
  end

  def empty?(stack = nil)
    case stack
    when nil
      @head0 == 0 and @head1 == 0 and @head2 == 0
    when 0
      @head0 == 0
    when 1
      @head1 == 0
    when 2
      @head2 == 0
    else
      raise 'Wrong stack'
    end
  end

  def push(stack, val)
    raise 'Stacks are full' if @head0 + @head1 + @head2 >= @array.size
    case stack
    when 0
      @array[@head0] = val; @head0 += 1
    when 1
      if @array[@array.size - @head1 - 1] != nil # Сдвигаем стэк 2 влево относительно 1
        0.upto(@head2-1) do |i|
          @array[@array.size - @head1 - @head2 - 1 + i] = @array[@array.size - @head1 - @head2 + i]
        end
        @array[@array.size - @head1 - 1] = nil
        #@head2 += 1
      end
      @array[@array.size - @head1 - 1] = val
      @head1 += 1
    when 2
      @array[@array.size - @head1 - @head2 - 1] = val; @head2 += 1
    else
      raise 'Wrong stack'
    end
  end

  def pop(stack)
    case stack
    when 0
      raise 'Stack is empty' if @head0 <= 0
      @head0 -= 1; @array[@head0]
    when 1
      raise 'Stack is empty' if @head1 <= 0
      @head1 -= 1; @head2+=1; @array[@array.size - @head1 - 1]
    when 2
      raise 'Stack is empty' if @head2 <= 0
      @head2 -= 1; @array[@array.size - @head1 - @head2 - 1]
    else
      raise 'Wrong stack'
    end
  end

  def top(stack)
    case stack
    when 0
      raise 'Stack is empty' if @head0 <= 0
      @array[@head0 - 1]
    when 1
      raise 'Stack is empty' if @head1 <= 0
      @array[@array.size - @head1]
    when 2
      raise 'Stack is empty' if @head2 <= 0
      @array[@array.size - @head2]
    else
      raise 'Wrong stack'
    end
  end

  def print_all
    print @array
  end
end

=begin
if __FILE__ == $0

  trplstack = TrplStack.new
  TrplStack::DEF_SIZE.times do
    stack=gets.to_i
    tmp=gets.to_i
    trplstack.push(stack,tmp)
    trplstack.print_all
  end

  trplstack.print_all

end
=end
